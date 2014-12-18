package samples.spine;

import pixi.InteractionData;
import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Stage;
import pixi.spine.Spine;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import js.Browser;

class Main {

	var _loader:AssetLoader;
	var _renderer:WebGLRenderer;
	var _stage:Stage;

	var _spineBoy:Spine;

	public function new() {
		_stage = new Stage(0x00FF00);
		_renderer = Detector.autoDetectRenderer(800, 600);
		_renderer.view.style.display = "block";
		Browser.document.body.appendChild(_renderer.view);

		var assetsToLoader:Array<String> = ["assets/spine/data/spineboy.json"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();

		Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
		_renderer.render(_stage);
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