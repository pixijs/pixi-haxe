package filters.blur;

import js.Browser;
import pixi.core.display.Container;
import pixi.filters.blur.BlurFilter;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;

class Main extends Application {

	var _bg:Sprite;
	var _container:Container;
	var _littleDudes:Sprite;
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

		_bg = Sprite.fromImage("assets/filters/depth_blur_BG.jpg");
		_bg.anchor.set(0.5);
		_container.addChild(_bg);

		_littleDudes = Sprite.fromImage("assets/filters/depth_blur_dudes.jpg");
		_littleDudes.anchor.set(0.5);
		_littleDudes.y = 100;
		_container.addChild(_littleDudes);

		_littleRobot = Sprite.fromImage("assets/filters/depth_blur_moby.jpg");
		_littleRobot.anchor.set(0.5);
		_littleRobot.x = 120;
		_container.addChild(_littleRobot);

		_blurFilter1 = new BlurFilter();
		_blurFilter2 = new BlurFilter();

		_littleDudes.filters = [_blurFilter1];
		_littleRobot.filters = [_blurFilter2];

		_count = 0;
	}

	function _init() {
		backgroundColor = 0xFFFFFF;
		onUpdate = _onUpdate;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.01;

		var blurAmount1 = Math.cos(_count);
		var blurAmount2 = Math.sin(_count);

		_blurFilter1.blur = 20 * (blurAmount1);
		_blurFilter2.blur = 20 * (blurAmount2);
	}

	static function main() {
		new Main();
	}
}