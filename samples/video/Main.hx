package video;

import js.html.VideoElement;
import js.Browser;
import pixi.core.sprites.Sprite;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;

class Main extends Application {

	var _vidTexture:Texture;
	var _vidSprite:Sprite;
	var _vidElement:VideoElement;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xE0E6F8;
		onUpdate = _onUpdate;
		onResize = _onResize;
		autoResize = true;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		super.start();

		_vidTexture = Texture.fromVideoUrl("assets/video/test.mp4");
		_vidSprite = new Sprite(_vidTexture);
		stage.addChild(_vidSprite);

		//haxe.Timer.delay(_setup, 3000);
	}

	function _setup() {

	}

	function _onUpdate(elapsedTime:Float) {

	}

	function _onResize() {

	}

	static function main() {
		new Main();
	}
}