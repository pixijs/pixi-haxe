package samples.basics;

import pixi.Application;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;

class Main extends Application {

	var _bunny:Sprite;

	public function new() {
		super();
		_init();

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5, 0.5);
		_bunny.scale.set(2, 2);
		_bunny.position.set(400, 300);
		_stage.addChild(_bunny);
	}

	function _init() {
		stats = true;
		backgroundColor = 0x003366;
		onUpdate = _onUpdate;
		resize = false;
		width = 800;
		height = 600;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		_bunny.rotation += 0.1;
	}

	static function main() {
		new Main();
	}
}