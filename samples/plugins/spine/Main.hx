package samples.plugins.spine;

import pixi.loaders.Loader;
import pixi.plugins.app.Application;
import pixi.plugins.spine.Spine;

class Main extends Application {

	var _loader:Loader;
	var _goblin:Spine;

	public function new() {
		super();
		backgroundColor = 0x00FF66;
		super.start();

		stage.interactive = true;
		var assetsToLoader:Array<String> = [];

		_loader = new Loader();
		_loader.add("goblins", "assets/plugins.spine/data/goblins.json");
		_loader.load(onAssetsLoaded);
	}

	function onAssetsLoaded() {
		_goblin = new Spine(_loader.resources("goblins").spineData);

		// set current skin
		_goblin.skeleton.setSkinByName('goblin');
		_goblin.skeleton.setSlotsToSetupPose();

		// set the position
		_goblin.position.x = 400;
		_goblin.position.y = 600;

		_goblin.scale.set(1.5);

		// play animation
		_goblin.state.setAnimationByName(0, 'walk', true);

		stage.addChild(_goblin);

		stage.on('click', _stageOnClick);
	}

	function _stageOnClick() {
		var currentSkinName = _goblin.skeleton.skin.name;
		var newSkinName = currentSkinName == 'goblin' ? 'goblingirl' : 'goblin';
		_goblin.skeleton.setSkinByName(newSkinName);
		_goblin.skeleton.setSlotsToSetupPose();
	}

	static function main() {
		new Main();
	}
}