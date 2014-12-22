package samples.bunnymark;

import pixi.utils.Stats;
import pixi.InteractionData;
import pixi.text.Text;
import pixi.renderers.IRenderer;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _bunny:Bunny;
	var _bunnyTexture:Texture;
	var _renderer:IRenderer;
	var _stage:Stage;
	var _stats:Stats;

	var _sprites:Array<Bunny>;
	var _quantityLabel:Text;

	var _isScale:Bool;
	var _isRotation:Bool;

	var _maxX:Int;
	var _maxY:Int;
	var _minX:Int;
	var _minY:Int;

	var _add:Bool;

	public function new() {
		_stage = new Stage(0x00FF00);

		_renderer = Detector.autoDetectRenderer(Browser.window.innerWidth, Browser.window.innerHeight);
		Browser.document.body.appendChild(_renderer.view);

		_sprites = [];
		_add = false;
		_minX = _minY = 0;
		_maxX = Browser.window.innerWidth;
		_maxY = Browser.window.innerHeight;

		_bunnyTexture = Texture.fromImage("assets/basics/bunny.png");

		_quantityLabel = new Text("Press/Touch and hold to add bunnies continuously", {font: "15px Tahoma", fill:"#000000"});
		_stage.addChild(_quantityLabel);

		_stage.mousedown = _stage.touchstart = function(data:InteractionData) { _add = true; }
		_stage.mouseup = _stage.touchend = function(data:InteractionData) { _add = false; }

		_addStats();
		Browser.window.requestAnimationFrame(cast animate);
	}

	function _addBunnys() {
		for (i in 0 ... 10) {
			_bunny = new Bunny(_bunnyTexture);
			_stage.addChild(_bunny);
			_bunny.x = Std.random(_maxX);
			_bunny.y = Std.random(_maxY);
			_bunny.anchor.set(0.5, 0.5);
			_bunny.speedX = Math.random() * 16 + 2;
			_bunny.speedY = (Math.random() * 16) - 10;
			_bunny.rotationSpeed = Math.random() / 50 + 0.01;
			_bunny.scaleSpeed = Math.random() / 50 + 0.01;
			_sprites.push(_bunny);
		}
		_updateQuanityLabel();
	}

	function _updateQuanityLabel() {
		_quantityLabel.setText("Quantity: " + _sprites.length);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);

		if (_add) _addBunnys();

		for (i in 0 ... _sprites.length) {
			var bunny:Bunny = _sprites[i];
			bunny.position.x += bunny.speedX;
			bunny.position.y += bunny.speedY;
			bunny.speedY += 2;

			if (bunny.position.x > _maxX) {
				bunny.speedX *= -1;
				bunny.position.x = _maxX;
			}
			else if (bunny.position.x < _minX) {
				bunny.speedX *= -1;
				bunny.position.x = _minX;
			}

			if (bunny.position.y > _maxY) {
				bunny.speedY *= -0.9;
				bunny.position.y = _maxY;
				if (Math.random() > 0.5) bunny.speedY -= Math.random() * 6;
			}
			else if (bunny.position.y < _minY) {
				bunny.speedY = 0;
				bunny.position.y = _minY;
			}
		}
		_stats.update();
		_renderer.render(_stage);
	}

	function _addStats() {
		var _container = Browser.document.createElement("div");
		Browser.document.body.appendChild(_container);
		_stats = new Stats();
		_stats.domElement.style.position = "absolute";
		_stats.domElement.style.top = "2px";
		_stats.domElement.style.right = "2px";
		_container.appendChild(_stats.domElement);
		_stats.begin();
	}

	static function main() {
		new Main();
	}
}