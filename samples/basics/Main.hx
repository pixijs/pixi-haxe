package samples.basics;

import pixi.core.display.Container;
import pixi.core.textures.Texture;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main {

	var _bunny:Sprite;
	var _renderer:SystemRenderer;
	var _stage:Container;

	public function new() {
		// Rendering options usage sample
		var options:RenderingOptions = {};
		options.backgroundColor = 0x003366;
		options.resolution = 1;

		_stage = new Container();
		_renderer = Detector.autoDetectRenderer(800, 600, options);

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5, 0.5);
		_bunny.position.set(400, 300);

		_stage.addChild(_bunny);

		Browser.document.body.appendChild(_renderer.view);
		Browser.window.requestAnimationFrame(cast _animate);
	}

	function _animate() {
		Browser.window.requestAnimationFrame(cast _animate);
		_bunny.rotation += 0.1;
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}