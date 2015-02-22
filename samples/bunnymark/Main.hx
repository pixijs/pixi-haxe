package samples.bunnymark;

import pixi.display.DisplayObjectContainer;
import js.Browser;
import pixi.Application;
import pixi.InteractionData;
import pixi.text.Text;
import pixi.display.Stage;
import pixi.textures.Texture;

class Main extends Application {

	var _bunny:Bunny;
	var _bunnyTexture:Texture;

	var _sprites:Array<Bunny>;
	var _quantityLabel:Text;

	var _isScale:Bool;
	var _isRotation:Bool;

	var _maxX:Int;
	var _maxY:Int;
	var _minX:Int;
	var _minY:Int;

	var _add:Bool;

	var _container:DisplayObjectContainer;

	public function new() {
		super();
		_init();

		_sprites = [];
		_add = false;
		_minX = _minY = 0;
		_maxX = Browser.window.innerWidth;
		_maxY = Browser.window.innerHeight;

		_bunnyTexture = Texture.fromImage("assets/basics/bunny.png");

		_quantityLabel = new Text("Press/Touch and hold to add bunnies continuously", {font: "15px Tahoma", fill:"#FFFFFF"});
		_stage.addChild(_quantityLabel);

		_stage.mousedown = _stage.touchstart = function(data:InteractionData) { _add = true; }
		_stage.mouseup = _stage.touchend = function(data:InteractionData) { _add = false; }

		_container = new DisplayObjectContainer();
		_stage.addChild(_container);
	}

	function _init() {
		backgroundColor = 0x003366;
		onUpdate = _onUpdate;
		super.start();
		stats = true;
	}

	function _onUpdate(elapsedTime:Float) {
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
	}

	function _addBunnys() {
		for (i in 0 ... 10) {
			_bunny = new Bunny(_bunnyTexture);
			_bunny.name = "bunny" + i;
			_container.addChild(_bunny);
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

	static function main() {
		new Main();
	}
}