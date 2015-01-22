package samples.rendertexture;

import pixi.Application;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.RenderTexture;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main extends Application {

	var _outputSprite:Sprite;

	var _bunnyContainer:DisplayObjectContainer;
	var _bunnys:Array<Sprite>;

	var _count1:Float;
	var _score:Float;
	var _count2:Float;

	var _renderTexture1:RenderTexture;
	var _renderTexture2:RenderTexture;
	var _currentTexture:RenderTexture;

	public function new() {
		super();
		_init();

		_renderTexture1 = new RenderTexture(width, height);
		_renderTexture2 = new RenderTexture(width, height);
		_currentTexture = _renderTexture1;

		_outputSprite = new Sprite(_currentTexture);
		_outputSprite.position.x = width / 2;
		_outputSprite.position.y = height / 2;

		_outputSprite.anchor.set(0.5, 0.5);

		_stage.addChild(_outputSprite);

		_bunnyContainer = new DisplayObjectContainer();
		_bunnyContainer.position.x = width / 2;
		_bunnyContainer.position.y = height / 2;
		_stage.addChild(_bunnyContainer);

		var fruits = ["assets/rendertexture/spinObj_01.png", "assets/rendertexture/spinObj_02.png",
		"assets/rendertexture/spinObj_03.png", "assets/rendertexture/spinObj_04.png",
		"assets/rendertexture/spinObj_05.png", "assets/rendertexture/spinObj_06.png",
		"assets/rendertexture/spinObj_07.png", "assets/rendertexture/spinObj_08.png"];

		_bunnys = [];
		var bunny:Sprite;
		for (i in 0 ... 20) {
			bunny = Sprite.fromImage(fruits[i % fruits.length]);
			bunny.position.x = Math.random() * 400 - 200;
			bunny.position.y = Math.random() * 400 - 200;

			bunny.anchor.set(0.5, 0.5);

			_bunnyContainer.addChild(bunny);
			_bunnys.push(bunny);
		}

		_count1 = 0;
		_score = 0;
		_count2 = 0;
	}

	function _init() {
		stats = true;
		backgroundColor = 0x00FF00;
		onUpdate = _onUpdate;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		for (i in 0..._bunnys.length) {
			var bunny = _bunnys[i];
			bunny.rotation += 0.1;
		}

		_count1 += 0.01;
		_count2 ++;

		var temp = _renderTexture1;
		_renderTexture1 = _renderTexture2;
		_renderTexture2 = temp;

		_bunnyContainer.rotation -= 0.01;
		_renderTexture1.render(_stage, null, true);
		_outputSprite.setTexture(_renderTexture1);
		_outputSprite.scale.x = _outputSprite.scale.y = 1 + Math.sin(_count1) * 0.2;
		_renderTexture2.render(_stage, null, false);
	}

	static function main() {
		new Main();
	}
}