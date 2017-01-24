package basics;

import pixi.core.RenderOptions;
import pixi.core.Application;
import pixi.core.graphics.Graphics;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main {

	var _bunny:Sprite;
	var _container:Container;
	var _app:Application;
	var _graphic:Graphics;

	public function new() {
		// Rendering options usage sample
		var options:RenderOptions = {};
		options.backgroundColor = 0x006666;
		options.resolution = 1;
		options.transparent = true;
		options.antialias = false;

		_app = new Application(800, 600, options);
		_container = new Container();
		_app.stage.addChild(_container);

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5);
		_bunny.position.set(400, 300);

		_container.addChild(_bunny);

		_graphic = new Graphics();
		_graphic.beginFill(0xFF0000, 0.4);
		_graphic.drawRect(200, 150, 400, 300);
		_graphic.endFill();

		_graphic.interactive = true;
		_graphic.on("click", function(evt) {trace(evt);});

		_container.addChild(_graphic);

		Browser.document.body.appendChild(_app.view);
		_app.ticker.add(_animate);
	}

	function _animate() {
		_bunny.rotation += 0.1;
	}

	static function main() {
		new Main();
	}
}