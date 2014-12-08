package samples.graphics;

import pixi.InteractionData;
import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Stage;
import pixi.primitives.Graphics;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _renderer:WebGLRenderer;
	var _stage:Stage;

	var _graphics:Graphics;
	var _thing:Graphics;
	var _count:Float;

	public function new() {
		_stage = new Stage(0x00FF00);
		_stage.interactive = true;
		_renderer = Detector.autoDetectRenderer(620, 380);
		_renderer.view.style.display = "block";
		Browser.document.body.appendChild(_renderer.view);

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

		_stage.addChild(_graphics);

		_thing = new Graphics();
		_stage.addChild(_thing);
		_thing.position.x = 620 / 2;
		_thing.position.y = 380 / 2;

		_count = 0;

		_stage.click = _stage.tap = _onStageClick;

		Browser.window.requestAnimationFrame(cast animate);
	}

	function _onStageClick(data:InteractionData) {
		_graphics.lineStyle(Math.random() * 30, Std.int(Math.random() * 0xFFFFFF), 1);
		_graphics.moveTo(Math.random() * 620, Math.random() * 380);
		_graphics.lineTo(Math.random() * 620, Math.random() * 380);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);

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

		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}