package samples.bitmaptext;

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
		resize = false;
		width = 800;
		height = 600;
		super.start(true);
	}

	function onAssetsLoaded() {
		var bitmapFontText = new BitmapText("bitmap fonts are\n now supported!", {font: "60px Desyrel"});
		bitmapFontText.position.x = 400 - bitmapFontText.width / 2;
		bitmapFontText.position.y = 300 - bitmapFontText.height / 2;
		_stage.addChild(bitmapFontText);
	}

	static function main() {
		new Main();
	}
}