package demos.rendertexture;

import pixi.renderers.webgl.WebGLRenderer;
import pixi.Pixi;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.RenderTexture;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import pixi.display.DisplayObjectContainer;
import js.Browser;

class Main {

	var _outputSprite:Sprite;
	var _renderer:WebGLRenderer;
	var _stage:Stage;

	var _bunnyContainer:DisplayObjectContainer;
	var _bunnys:Array<Sprite>;

	var _count1:Float;
	var _score:Float;
	var _count2:Float;

	var _renderTexture1:RenderTexture;
	var _renderTexture2:RenderTexture;
	var _currentTexture:RenderTexture;

	public function new() {
		_stage = new Stage(0x00FF00);
		_renderer = Detector.autoDetectRenderer(800, 600);
		_renderer.view.style.width = Browser.window.innerWidth + "px";
		_renderer.view.style.height = Browser.window.innerHeight + "px";
		_renderer.view.style.display = "block";

		Browser.document.body.appendChild(_renderer.view);

		_renderTexture1 = new RenderTexture(800, 600);
		_renderTexture2 = new RenderTexture(800, 600);
		_currentTexture = _renderTexture1;

		_outputSprite = new Sprite(_currentTexture);
		_outputSprite.position.x = 800 / 2;
		_outputSprite.position.y = 600 / 2;

		_outputSprite.anchor.x = 0.5;
		_outputSprite.anchor.y = 0.5;

		_stage.addChild(_outputSprite);

		_bunnyContainer = new DisplayObjectContainer();
		_bunnyContainer.position.x = 800 / 2;
		_bunnyContainer.position.y = 600 / 2;
		_stage.addChild(_bunnyContainer);

		var fruits = ["assets/rendertexture/spinObj_01.png", "assets/rendertexture/spinObj_02.png",
		"assets/rendertexture/spinObj_03.png", "assets/rendertexture/spinObj_04.png",
		"assets/rendertexture/spinObj_05.png", "assets/rendertexture/spinObj_06.png",
		"assets/rendertexture/spinObj_07.png", "assets/rendertexture/spinObj_08.png"];

		_bunnys = [];
		var bunny:Sprite;
		for (i in 0...20) {
			bunny = Sprite.fromImage(fruits[i % fruits.length]);
			bunny.position.x = Math.random() * 400 - 200;
			bunny.position.y = Math.random() * 400 - 200;

			bunny.anchor.x = 0.5;
			bunny.anchor.y = 0.5;

			_bunnyContainer.addChild(bunny);
			_bunnys.push(bunny);
		}

		_count1 = 0;
		_score = 0;
		_count2 = 0;

		Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
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
		_renderTexture1.render(_stage, true);
		_outputSprite.setTexture(_renderTexture1);
		_outputSprite.scale.x = _outputSprite.scale.y = 1 + Math.sin(_count1) * 0.2;
		_renderTexture2.render(_stage, false);
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}