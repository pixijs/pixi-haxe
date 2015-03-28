package samples.stream;

import pixi.plugins.eventemitter.EventTarget;
import pixi.text.Text;
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

	var _bunny:Sprite;
	var _table:Sprite;

	var _label:Text;

	var _vidTexture:Texture;
	var _vidSprite:Sprite;

	public function new() {
		_init();
	}

	function _init() {
		var options:RenderingOptions = {};
		options.backgroundColor = 0x003366;
		options.resolution = 1;

		_stage = new Container();
		_renderer = Detector.autoDetectRenderer(Browser.window.innerWidth, Browser.window.innerHeight, options);
		_wrapper = Browser.document.getElementById("game");

		_videoElement = Browser.document.createVideoElement();
		_videoElement.id = "videoWheel";
		_videoElement.style.position = "absolute";
		_videoElement.style.top = "0px";
		_videoElement.autoplay = true;
		_videoElement.src = "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";

		Browser.document.body.appendChild(_wrapper);
		_wrapper.appendChild(_renderer.view);
		_renderer.view.style.position = "absolute";
		_wrapper.appendChild(_videoElement);
		Browser.window.requestAnimationFrame(cast _animate);

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5, 0.5);
		_bunny.scale.set(4, 4);
		_bunny.position.set(550, Browser.window.innerHeight);
		_bunny.interactive = true;
		_stage.addChild(_bunny);
		_bunny.on("tap", _onTap);
	}

	function _onTap(data:EventTarget) {
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