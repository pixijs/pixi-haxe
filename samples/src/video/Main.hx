package video;

import js.html.VideoElement;
import js.Browser;
import pixi.core.sprites.Sprite;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.core.Application;

class Main extends Application {

	var _vidTexture:Texture;
	var _vidSprite:Sprite;
	var _vidElement:VideoElement;

	public function new() {
		var options:ApplicationOptions = {
			backgroundColor: 0xE0E6F8,
			width: Browser.window.innerWidth,
			height: Browser.window.innerHeight
		};
		super(options);
		_init();
	}

	function _init() {
		super.start();

		_vidTexture = Texture.from("assets/video/test.mp4");
		_vidSprite = new Sprite(_vidTexture);
		stage.addChild(_vidSprite);
	}

	static function main() {
		new Main();
	}
}