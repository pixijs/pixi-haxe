package textureswap;

import pixi.interaction.EventTarget;
import pixi.core.sprites.Sprite;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _texture1:Texture;
	var _texture2:Texture;

	var _bunny:Sprite;
	var _swap:Bool;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xE0E6F8;
		onUpdate = _onUpdate;
		super.start();

		_swap = false;
		_texture1 = Texture.fromImage("assets/bunnymark/bunny2.png");
		_texture2 = Texture.fromImage("assets/bunnymark/bunny4.png");

		_bunny = new Sprite(_texture1);
		_bunny.anchor.set(0.5);
		_bunny.scale.set(3);
		_bunny.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		_bunny.interactive = true;
		_bunny.on("click", _onClick);
		_bunny.on("tap", _onClick);
		stage.addChild(_bunny);
	}

	function _onClick(target:EventTarget) {
		_swap = !_swap;
		_bunny.texture = (_swap) ? _texture2 : _texture1;
	}

	function _onUpdate(elapsedTime:Float) {
		_bunny.rotation += 0.1;
	}

	static function main() {
		new Main();
	}
}