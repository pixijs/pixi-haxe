package basics;

import pixi.core.graphics.Graphics;
import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main {

	var _bunny:Sprite;
	var _renderer:SystemRenderer;
	var _container:Container;

	var _graphic:Graphics;

	public function new() {
		// Rendering options usage sample
		var options:RenderingOptions = {};
		options.backgroundColor = 0x006666;
		options.resolution = 1;
		options.transparent = true;
		options.antialias = false;

		_container = new Container();
		_renderer = Detector.autoDetectRenderer(800, 600, options);

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

		Browser.document.body.appendChild(_renderer.view);
		Browser.window.requestAnimationFrame(cast _animate);
	}

	function _animate() {
		Browser.window.requestAnimationFrame(cast _animate);
		_bunny.rotation += 0.1;
		_renderer.render(_container);
	}

	static function main() {
		new Main();
	}
}