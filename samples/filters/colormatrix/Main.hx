package filters.colormatrix;

import pixi.core.text.TextStyleObject;
import pixi.interaction.EventTarget;
import pixi.core.display.Container;
import pixi.filters.colormatrix.ColorMatrixFilter;
import pixi.core.text.Text;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _bg:Sprite;
	var _container:Container;
	var _colorMatrix:Array<Float>;
	var _filter:ColorMatrixFilter;

	var _bgFront:Sprite;
	var _light1:Sprite;
	var _light2:Sprite;
	var _panda:Sprite;

	var _count:Float;
	var _switchy:Bool;

	public function new() {
		super();
		_init();

		stage.interactive = true;
		_container = new Container();
		_container.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		stage.addChild(_container);

		_bg = Sprite.fromImage("assets/filters/BGrotate.jpg");
		_bg.anchor.set(0.5);

		_colorMatrix = [1, 0, 0, 0,
						0, 1, 0, 0,
						0, 0, 1, 0,
						0, 0, 0, 1];

		_filter = new ColorMatrixFilter();

		_bgFront = Sprite.fromImage("assets/filters/SceneRotate.jpg");
		_bgFront.anchor.set(0.5);
		_container.addChild(_bgFront);

		_light2 = Sprite.fromImage("assets/filters/LightRotate2.png");
		_light2.anchor.set(0.5);
		_container.addChild(_light2);

		_light1 = Sprite.fromImage("assets/filters/LightRotate1.png");
		_light1.anchor.set(0.5);
		_container.addChild(_light1);

		_panda = Sprite.fromImage("assets/filters/panda.png");
		_panda.anchor.set(0.5);
		_container.addChild(_panda);

		_count = 0;
		_switchy = false;
		_container.filters = [_filter];

		stage.on("click", _onClick);
		stage.on("tap", _onClick);

		var style:TextStyleObject = {fontSize: "12", fontFamily:"Arial", fontWeight: "bold", fill: 0xFFFFFF};
		var help = new Text("Click to turn filters on / off.", style);
		stage.addChild(help);
	}

	function _init() {
		backgroundColor = 0x00FF66;
		onUpdate = _onUpdate;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.01;

		_bg.rotation += 0.01;
		_bgFront.rotation -= 0.01;

		_light1.rotation += 0.02;
		_light2.rotation += 0.01;

		_panda.scale.x = 1 + Math.sin(_count) * 0.04;
		_panda.scale.y = 1 + Math.cos(_count) * 0.04;

		_count += 0.1;

		_colorMatrix[1] = Math.sin(_count) * 3;
		_colorMatrix[2] = Math.cos(_count);
		_colorMatrix[3] = Math.cos(_count) * 1.5;
		_colorMatrix[4] = Math.sin(_count / 3) * 2;
		_colorMatrix[5] = Math.sin(_count / 2);
		_colorMatrix[6] = Math.sin(_count / 4);
		_filter.matrix = _colorMatrix;
	}

	function _onClick(data:EventTarget) {
		_switchy = !_switchy;
		if (!_switchy) _container.filters = [_filter];
		else _container.filters = null;
	}

	static function main() {
		new Main();
	}
}