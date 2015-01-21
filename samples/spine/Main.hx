package samples.spine;

import pixi.Application;
import pixi.InteractionData;
import pixi.display.Stage;
import pixi.spine.Spine;
import pixi.loaders.AssetLoader;

class Main extends Application {

	var _loader:AssetLoader;
	var _spineBoy:Spine;

	public function new() {
		super();
		_init();

		var assetsToLoader:Array<String> = ["assets/spine/data/spineboy.json"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();
	}

	function _init() {
		stats = true;
		backgroundColor = 0x00FF66;
		resize = false;
		width = 800;
		height = 600;
		super.start();
	}

	function onAssetsLoaded() {
		_spineBoy = new Spine("assets/spine/data/spineboy.json");

		_spineBoy.position.x = 400;
		_spineBoy.position.y = 600;
		_spineBoy.stateData.setMixByName("walk", "jump", 0.2);
		_spineBoy.stateData.setMixByName("jump", "walk", 0.4);
		_spineBoy.state.setAnimationByName(0, "walk", true);
		_stage.addChild(_spineBoy);

		_stage.click = _stageOnClick;
	}

	function _stageOnClick(data:InteractionData) {
		_spineBoy.state.setAnimationByName(0, "jump", false);
		_spineBoy.state.addAnimationByName(0, "walk", true);
	}

	static function main() {
		new Main();
	}
}