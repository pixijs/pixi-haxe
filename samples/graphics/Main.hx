package graphics;

import pixi.interaction.EventTarget;
import pixi.core.graphics.Graphics;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _graphics:Graphics;
	var _thing:Graphics;
	var _count:Float;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0x003366;
		antialias = true;
		onUpdate = _onUpdate;
		super.start();

		_graphics = new Graphics();
		_graphics.beginFill(0xFF3300);
		_graphics.lineStyle(10, 0xffd900, 1);

		_graphics.moveTo(50, 50);
		_graphics.lineTo(250, 50);
		_graphics.lineTo(100, 100);
		_graphics.lineTo(250, 220);
		_graphics.lineTo(50, 220);
		_graphics.lineTo(50, 50);
		_graphics.endFill();

		_graphics.lineStyle(10, 0xFF0000, 0.8);
		_graphics.beginFill(0xFF700B, 1);

		_graphics.moveTo(210, 300);
		_graphics.lineTo(450, 320);
		_graphics.lineTo(570, 350);
		_graphics.lineTo(580, 20);
		_graphics.lineTo(330, 120);
		_graphics.lineTo(410, 200);
		_graphics.lineTo(210, 300);
		_graphics.endFill();

		_graphics.lineStyle(2, 0x0000FF, 1);
		_graphics.drawRect(50, 250, 100, 100);

		_graphics.lineStyle(0);
		_graphics.beginFill(0xFFFF0B, 0.5);
		_graphics.drawCircle(470, 200, 100);

		_graphics.lineStyle(20, 0x33FF00);
		_graphics.moveTo(30, 30);
		_graphics.lineTo(600, 300);

		stage.addChild(_graphics);

		_thing = new Graphics();
		stage.addChild(_thing);
		_thing.position.x = Browser.window.innerWidth / 2;
		_thing.position.y = Browser.window.innerHeight / 2;

		_count = 0;

		stage.interactive = true;
		stage.on("click", _onStageClick);
		stage.on("tap", _onStageClick);
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.1;

		_thing.clear();
		_thing.lineStyle(30, 0xFF0000, 1);
		_thing.beginFill(0xFF0000, 0.5);

		_thing.moveTo(-120 + Math.sin(_count) * 20, -100 + Math.cos(_count) * 20);
		_thing.lineTo(120 + Math.cos(_count) * 20, -100 + Math.sin(_count) * 20);
		_thing.lineTo(120 + Math.sin(_count) * 20, 100 + Math.cos(_count) * 20);
		_thing.lineTo(-120 + Math.cos(_count) * 20, 100 + Math.sin(_count) * 20);
		_thing.lineTo(-120 + Math.sin(_count) * 20, -100 + Math.cos(_count) * 20);

		_thing.rotation = _count * 0.1;
	}

	function _onStageClick(target:EventTarget) {
		_graphics.lineStyle(Math.random() * 30, Std.int(Math.random() * 0xFFFFFF), 1);
		_graphics.moveTo(Math.random() * 620, Math.random() * 380);
		_graphics.lineTo(Math.random() * 620, Math.random() * 380);
	}

	static function main() {
		new Main();
	}
}