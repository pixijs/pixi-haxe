package samples.stream;

import js.html.TextTrackMode;
import js.html.TextTrackKind;
import js.html.TextTrack;
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
		_videoElement.width = 480;
		_videoElement.height = 270;
		_videoElement.src = "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";

		Browser.document.body.appendChild(_wrapper);
		_wrapper.appendChild(_videoElement);
		_wrapper.appendChild(_renderer.view);
		_renderer.view.style.position = "absolute";
		Browser.window.requestAnimationFrame(cast _animate);

		_playBtn = new Sprite(Texture.fromImage("assets/stream/play.png"));
		_playBtn.interactive = true;
		_stage.addChild(_playBtn);
		_playBtn.tap = _onTap;
		_playBtn.click = _onTap;

		_timer = new Timer(500);

		_canvas = Browser.document.createCanvasElement();
		_canvas.id = "video_canvas";
		_canvas.style.position = "absolute";
		_canvas.style.backgroundColor = "#000000";
		_canvas.style.left = "0px";
		_canvas.style.top = "280px";
		_canvas.width = 480;
		_canvas.height = 50;
		_wrapper.appendChild(_canvas);

		_context = _canvas.getContext2d();
	}

	function _onTap(data:EventTarget) {
		_playBtn.visible = false;
		_videoElement.play();
		_timer.run = _draw;
	}

	function _draw() {
		if (_videoElement.paused || _videoElement.ended) return;
		_context.drawImage(_videoElement, 0, 200, 480, 50, 0, 0, 480, 50);

		var textTrack:TextTrack = null;
		for (i in 0 ... _videoElement.textTracks.length) {
			if (_videoElement.textTracks[i].kind == TextTrackKind.SUBTITLES) {
				textTrack = _videoElement.textTracks[i];

				textTrack.mode = TextTrackMode.HIDDEN;

				textTrack.addEventListener("oncuechange", function () {
					if (textTrack.activeCues.length > 0) {
						for (j in 0 ... textTrack.activeCues.length) {
							var cue = textTrack.activeCues[j].text;
							trace(cue);
						}
					}
				});
			}
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