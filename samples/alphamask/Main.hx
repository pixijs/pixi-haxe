package alphamask;

import pixi.core.math.Point;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;

class Main extends Application {

	var _bg:Sprite;
	var _cells:Sprite;
	var _mask:Sprite;
	var _target:Point;

	public function new() {
		super();
		_init();
	}

	function _init() {
		onUpdate = _onUpdate;
		super.start(Application.RECOMMENDED);

		_bg = Sprite.fromImage("assets/alphamask/bkg.jpg");

		stage.addChild(_bg);

		_cells = Sprite.fromImage("assets/alphamask/cells.png");
		_cells.scale.set(1.5);

		_mask = Sprite.fromImage("assets/alphamask/flowerTop.png");
		_mask.anchor.set(0.5);
		_mask.position.set(310, 190);

		_cells.mask = _mask;

		stage.addChild(_mask);
		stage.addChild(_cells);

		_target = new Point();
		_reset();
	}

	function _reset() {
		_target.x = Math.floor(Math.random() * 550);
		_target.y = Math.floor(Math.random() * 300);
	}

	function _onUpdate(elapsedTime:Float) {
		_mask.position.x += (_target.x - _mask.x) * 0.1;
		_mask.position.y += (_target.y - _mask.y) * 0.1;
		if (Math.abs(_mask.x - _target.x) < 1) _reset();
	}

	static function main() {
		new Main();
	}
}