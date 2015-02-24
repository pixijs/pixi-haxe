package samples.bitmaptext;

import js.Browser;
import pixi.Application;
import pixi.display.Stage;
import pixi.loaders.AssetLoader;
import pixi.text.BitmapText;

class Main extends Application {

	var _loader:AssetLoader;

	public function new() {
		super();
		_init();

		var assetsToLoader:Array<String> = ["assets/fonts/desyrel.xml"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();
	}

	function _init() {
		backgroundColor = 0x003366;
		super.start();
	}

	function onAssetsLoaded() {
		var bitmapFontText = new BitmapText("bitmap fonts are\n now supported!", {font: "60px Desyrel"});
		bitmapFontText.position.x = (Browser.window.innerWidth - bitmapFontText.width) / 2;
		bitmapFontText.position.y = (Browser.window.innerHeight - bitmapFontText.height) / 2;
		_stage.addChild(bitmapFontText);
	}

	static function main() {
		new Main();
	}
}