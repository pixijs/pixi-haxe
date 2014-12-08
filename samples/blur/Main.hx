package samples.blur;

import js.Browser;
import pixi.filters.BlurFilter;
import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _bg:Sprite;
	var _littleDudes:Sprite;
	var _littleRobot:Sprite;

	var _blurFilter1:BlurFilter;
	var _blurFilter2:BlurFilter;

	var _count:Float;
	var _renderer:WebGLRenderer;
	var _stage:Stage;

	public function new() {
		_stage = new Stage(0xFFFFFF);

		_renderer = Detector.autoDetectRenderer(Browser.window.innerWidth, Browser.window.innerHeight);
		Browser.document.body.appendChild(_renderer.view);

		_renderer.view.style.position = "absolute";
		_renderer.view.style.width = Browser.window.innerWidth + "px";
		_renderer.view.style.height = Browser.window.innerHeight + "px";
		_renderer.view.style.display = "block";

		_bg = Sprite.fromImage("assets/filters/depth_blur_BG.jpg");
		_stage.addChild(_bg);

		_littleDudes = Sprite.fromImage("assets/filters/depth_blur_dudes.jpg");
		_littleDudes.y = 100;
		_stage.addChild(_littleDudes);

		_littleRobot = Sprite.fromImage("assets/filters/depth_blur_moby.jpg");
		_littleRobot.x = 120;
		_stage.addChild(_littleRobot);

		_blurFilter1 = new BlurFilter();
		_blurFilter2 = new BlurFilter();

		_littleDudes.filters = [_blurFilter1];
		_littleRobot.filters = [_blurFilter2];

		_count = 0;

		Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
		_count += 0.01;

		var blurAmount1 = Math.cos(_count);
		var blurAmount2 = Math.sin(_count);

		_blurFilter1.blur = 20 * (blurAmount1);
		_blurFilter2.blur = 20 * (blurAmount2);
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}