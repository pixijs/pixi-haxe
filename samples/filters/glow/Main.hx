package filters.glow;

import js.Browser;
import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import pixi.filters.blur.BlurFilter;
import pixi.plugins.app.Application;
import pixi.filters.extras.GlowFilter;

class Main extends Application {

	var _container:Container;
	var _littleRobot:Sprite;

	var _blurFilter1:BlurFilter;
	var _blurFilter2:BlurFilter;

	var _count:Float;

	public function new() {
		super();
		_init();

		_container = new Container();
		stage.addChild(_container);
		_container.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);

		_littleRobot = Sprite.fromImage("assets/filters/depth_blur_moby.jpg");
		_littleRobot.anchor.set(0.5);
		_container.addChild(_littleRobot);

		_littleRobot.filters = [new GlowFilter(15, 2, 1, 0xFF0000, 0.5)];
	}

	function _init() {
		position = "fixed";
		backgroundColor = 0xFFFFFF;
		onUpdate = _onUpdate;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.01;
	}

	static function main() {
		new Main();
	}
}