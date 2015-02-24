package samples.snake;

import pixi.Application;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.geom.Point;
import pixi.extras.Rope;
import pixi.display.DisplayObjectContainer;

class Main extends Application {

	var _count:Float;
	var _points:Array<Point>;

	public function new() {
		super();
		_init();

		_count = 0;
		var length = 918 / 20;
		_points = [];
		for (i in 0...20) {
			var segSize = length;
			_points.push(new Point(i * length, 0));
		};

		var strip = new Rope(Texture.fromImage("assets/snake/snake.png"), _points);
		strip.x = -918 / 2;

		var snakeContainer:DisplayObjectContainer = new DisplayObjectContainer();
		snakeContainer.position.x = width / 2;
		snakeContainer.position.y = height / 2;

		snakeContainer.scale.x = width / 1100;
		_stage.addChild(snakeContainer);

		snakeContainer.addChild(strip);
	}

	function _init() {
		backgroundColor = 0x003366;
		onUpdate = _onUpdate;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.1;

		var length = 918 / 20;
		for (i in 0..._points.length) {
			_points[i].y = Math.sin(i * 0.5 + _count) * 30;
			_points[i].x = i * length + Math.cos(i * 0.3 + _count) * 20;
		};
	}

	static function main() {
		new Main();
	}
}