package stream;

import Reflect;
import haxe.Json;
import js.html.XMLHttpRequest;
import js.html.TextTrackMode;
import js.html.TextTrackKind;
import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import haxe.Timer;
import pixi.interaction.EventTarget;
import pixi.core.text.Text;
import js.html.ImageElement;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import js.html.Element;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;
import pixi.core.renderers.Detector;

import js.Browser;
import js.html.VideoElement;

class Main {

	var _wrapper:Element;
	var _videoElement:VideoElement;
	var _videoCover:ImageElement;

	var _renderer:SystemRenderer;
	var _stage:Container;

	var _playBtn:Sprite;
	var _table:Sprite;

	var _label:Text;

	var _vidTexture:Texture;
	var _vidSprite:Sprite;

	var _timer:Timer;
	var _canvas:CanvasElement;
	var _context:CanvasRenderingContext2D;

	var subtitlePlaylistUrl:String;
	var movie:String;

	public function new() {
		_init();
	}

	function _init() {
		var options:RenderingOptions = {};
		options.backgroundColor = 0x003366;
		options.resolution = 1;
		options.transparent = true;

		_stage = new Container();
		_renderer = Detector.autoDetectRenderer(Browser.window.innerWidth, Browser.window.innerHeight, options);
		_wrapper = Browser.document.createDivElement();

		_videoElement = Browser.document.createVideoElement();
		_videoElement.id = "videoWheel";
		_videoElement.style.position = "absolute";
		_videoElement.style.top = "0px";
		_videoElement.autoplay = false;

		//_videoElement.width = 480;
		//_videoElement.height = 270;
		_videoElement.src = "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";

		Browser.document.body.appendChild(_wrapper);
		_wrapper.appendChild(_videoElement);
		_wrapper.appendChild(_renderer.view);
		_renderer.view.style.position = "absolute";
		Browser.window.requestAnimationFrame(cast _animate);

		_playBtn = new Sprite(Texture.fromImage("assets/stream/play.png"));
		_playBtn.width = 400;
		_playBtn.height = 400;
		_playBtn.interactive = true;
		_stage.addChild(_playBtn);
		_playBtn.tap = _onTap;
		_playBtn.click = _onTap;

		_timer = new Timer(1000);

		_canvas = Browser.document.createCanvasElement();
		_canvas.id = "video_canvas";
		_canvas.style.position = "absolute";
		_canvas.style.backgroundColor = "#FFFFFF";
		_canvas.style.left = "0px";
		_canvas.style.top = "500px";
		_canvas.width = 400;
		_canvas.height = 16;
		_wrapper.appendChild(_canvas);

		_context = _canvas.getContext2d();

		subtitlePlaylistUrl = null;
		movie = "1_400_400_750000";
	}

	function _onTap(data:EventTarget) {
		_playBtn.visible = false;
		_videoElement.play();
		_timer.run = _draw;
		/*untyped __js__("window.document.getElementById('videoWheel').webkitRequestFullscreen()");

		Timer.delay(function() {
			untyped __js__("window.document.getElementById('videoWheel').webkitExitFullscreen()");
		}, 1000);*/

		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var playlist = request.responseText;
				var lines = playlist.split('\n');
				var subtitles = lines[2].split(',');
				var uri:Array<String> = subtitles[5].split('=');

				uri[1] = StringTools.replace(uri[1], "\"", "");

				subtitlePlaylistUrl = "http://93.93.85.123:1935/live/" + movie + "/" + uri[1];
			}
		};

		var url = 'http://93.93.85.123:1935/live/' + movie + '/playlist.m3u8';
		request.open('GET', url, true);
		request.send(null);
	}

	function _draw() {
		if (_videoElement.paused || _videoElement.ended) return;
		//_context.drawImage(_videoElement, 0, 200, 480, 50, 0, 0, 480, 50);

		_context.drawImage(_videoElement, 0, 384, 400, 16, 0, 0, 400, 16);

		var textTrack:Dynamic = null;
		for (i in 0 ... _videoElement.textTracks.length) {
			if (_videoElement.textTracks[i].kind == TextTrackKind.CAPTIONS) {
				textTrack = _videoElement.textTracks[i];

				textTrack.mode = TextTrackMode.HIDDEN;

				textTrack.oncuechange = function() {
					if (textTrack.activeCues.length > 0) {
						for (j in 0 ... textTrack.activeCues.length) {
							var cue = textTrack.activeCues[j].text;
							//trace(cue);
							//trace(Json.parse(cue));
							//trace("Text Track Data: " + Reflect.field(cue, "typ"));
						}
					}
				};
			}
		}

		var subtitleRequest = new XMLHttpRequest();
		var subtitlePlaylistRequest = new XMLHttpRequest();

		subtitleRequest.onreadystatechange = function() {
			if (subtitleRequest.readyState == 4) {
				var playlist = subtitleRequest.responseText;
				var lines = playlist.split('\n');
				if (lines != null && lines[4] != null && lines[4].charCodeAt(0) != 160) {
					trace(Json.parse(lines[4]).type);
				}
			}
		}

		subtitlePlaylistRequest.onreadystatechange = function() {
			if (subtitlePlaylistRequest.readyState == 4) {
				var playlist = subtitlePlaylistRequest.responseText;
				var lines = playlist.split('\n');
				var webVTT = lines[5];

				var subtitleUrl = 'http://93.93.85.123:1935/live/' + movie + '/' + webVTT;
				subtitleRequest.open('GET', subtitleUrl, true);
				subtitleRequest.send(null);
			}
		}

		if (subtitlePlaylistUrl != null) {
			subtitlePlaylistRequest.open('GET', subtitlePlaylistUrl, true);
			subtitlePlaylistRequest.send(null);
		}
	}

	function _animate() {
		Browser.window.requestAnimationFrame(cast _animate);
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}