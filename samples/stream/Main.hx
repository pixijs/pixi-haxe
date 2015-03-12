package samples.stream;

import pixi.text.Text;
import js.html.ImageElement;
import pixi.core.utils.EventData;
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

	var _bunny:Sprite;
	var _table:Sprite;

	var _label:Text;

	var _vidTexture:Texture;
	var _vidSprite:Sprite;

	public function new() {
		//super();
		_init();
	}

	function _init() {
		var options:RenderingOptions = {};
		options.backgroundColor = 0x003366;
		options.resolution = 1;

		_stage = new Container();
		_renderer = Detector.autoDetectRenderer(1024, 648, options);
		_wrapper = Browser.document.getElementById("game");

		_videoElement = Browser.document.createVideoElement();
		_videoElement.id = "videoWheel";
		_videoElement.style.position = "absolute";
		_videoElement.style.top = "0px";
		_videoElement.autoplay = true;
		//_videoElement.width = 384;
		//_videoElement.height = 320;
		_videoElement.src = "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";

		//"/live/smil:multiplayer-roulette.smil/playlist.m3u8";
		//"http://91.213.212.37/casino/roulette/wh_vir-mob_med_hls/playlist.m3u8"
		/*_videoCover = Browser.document.createImageElement();
		_videoCover.style.position = "absolute";
		_videoCover.width = 384;
		_videoCover.height = 354;
		_videoCover.src = "assets/stream/outter_wheel.png";*/

		Browser.document.body.appendChild(_wrapper);
		_wrapper.appendChild(_renderer.view);
		_renderer.view.style.position = "absolute";
		_wrapper.appendChild(_videoElement);
		//_wrapper.appendChild(_videoCover);
		Browser.window.requestAnimationFrame(cast _animate);

		//_table = new Sprite(Texture.fromImage("assets/stream/bg.png"));
		//_stage.addChild(_table);

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5, 0.5);
		_bunny.scale.set(4, 4);
		_bunny.position.set(550, 450);
		_bunny.interactive = true;
		_stage.addChild(_bunny);
		_bunny.on("tap", _onTap);

		/*var ua:String = Browser.window.navigator.userAgent;
		_label = new Text(ua.substring(ua.indexOf("Browser"), ua.length), {font: "14px Arial", fill: "#FFFFFF"});
		_label.position.set(0, _bunny.y + 100);
		_stage.addChild(_label);*/
	}

	function _onTap(data:EventData) {
		_videoElement.play();
	}

	function _animate() {
		Browser.window.requestAnimationFrame(cast _animate);
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}