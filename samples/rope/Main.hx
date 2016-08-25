package rope;

import pixi.mesh.Rope;
import pixi.core.display.Container;
import pixi.core.math.Point;
import pixi.plugins.app.Application;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;

class Main extends Application {

	var _count:Float;
	var _points:Array<Point>;
	var _length:Float;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xFFFFFF;
		onUpdate = _onUpdate;
		super.start(Application.AUTO);

		_count = 0;
		_points = [];
		_length = 918 / 20;

		for (i in 0 ... 20) {
			var segSize = _length;
			_points.push(new Point(i * _length, 0));
		};

		var strip = new Rope(Texture.fromImage("assets/rope/snake.png"), _points);
		strip.x = -918 / 2;

		var snakeContainer:Container = new Container();
		snakeContainer.position.x = width / 2;
		snakeContainer.position.y = height / 2;

		snakeContainer.scale.x = width / 1100;
		stage.addChild(snakeContainer);

		snakeContainer.addChild(strip);
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.1;

		for (i in 0 ... _points.length) {
			_points[i].y = Math.sin(i * 0.5 + _count) * 30;
			_points[i].x = i * _length + Math.cos(i * 0.3 + _count) * 20;
		}
	}

	static function main() {
		new Main();
	}
}