package samples.pixidude;

import pixi.Application;
import pixi.InteractionData;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.spine.Spine;
import pixi.loaders.AssetLoader;

class Main extends Application {

	var _loader:AssetLoader;

	var _pixie:Spine;

	var _postition:Float;
	var _background1:Sprite;
	var _background2:Sprite;
	var _foreground1:Sprite;
	var _foreground2:Sprite;

	public function new() {
		super();
		_init();

		var assetsToLoader:Array<String> = ["assets/spine/data/Pixie.json", "assets/spine/data/iP4_BGtile.jpg", "assets/spine/data/iP4_ground.png"];
		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();

		_postition = 0;
	}

	function _init() {
		backgroundColor = 0x00FF00;
		resize = false;
		width = 800;
		height = 600;
		super.start();
		stats = true;
	}

	function onAssetsLoaded() {
		_background1 = Sprite.fromImage("assets/spine/data/iP4_BGtile.jpg");
		_background2 = Sprite.fromImage("assets/spine/data/iP4_BGtile.jpg");
		_stage.addChild(_background1);
		_stage.addChild(_background2);

		_foreground1 = Sprite.fromImage("assets/spine/data/iP4_ground.png");
		_foreground2 = Sprite.fromImage("assets/spine/data/iP4_ground.png");
		_stage.addChild(_foreground1);
		_stage.addChild(_foreground2);
		_foreground1.position.y = _foreground2.position.y = 640 - _foreground2.height;

		_pixie = new Spine("assets/spine/data/Pixie.json");
		var scale = 0.3;

		_pixie.position.x = 1024 / 3;
		_pixie.position.y = 500;

		_pixie.scale.x = _pixie.scale.y = scale;

		_pixie.stateData.setMixByName("running", "jump", 0.2);
		_pixie.stateData.setMixByName("jump", "running", 0.4);

		_pixie.state.setAnimationByName(0, "running", true);

		_stage.addChild(_pixie);

		_stage.click = _stageOnClick;
	}

	function _stageOnClick(data:InteractionData) {
		_pixie.state.setAnimationByName(0, "jump", false);
		_pixie.state.addAnimationByName(0, "running", true, 0);
	}

	static function main() {
		new Main();
	}
}