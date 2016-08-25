package bitmapfont;

import pixi.loaders.Loader;
import pixi.extras.BitmapText;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0x003366;
		super.start();

		var fontloader:Loader = new Loader();
		fontloader.add("font", "./assets/fonts/desyrel.xml");
		fontloader.load(_onLoaded);
	}

	function _onLoaded() {
		var bitmapFontText = new BitmapText("bitmap fonts are\n now supported!", {font: "60px Desyrel"});
		bitmapFontText.position.x = (Browser.window.innerWidth - bitmapFontText.width) / 2;
		bitmapFontText.position.y = (Browser.window.innerHeight - bitmapFontText.height) / 2;
		stage.addChild(bitmapFontText);
	}

	static function main() {
		new Main();
	}
}