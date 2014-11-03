package demos.basics;

import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _bunny:Sprite;
	var _renderer:WebGLRenderer;
	var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
		_renderer = Detector.autoDetectRenderer(800, 600);
		Browser.document.body.appendChild(_renderer.view);

		_bunny = new Sprite(Texture.fromImage("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5, 0.5);
		_bunny.scale.set(2, 2);
		_bunny.position.x = 400;
		_bunny.position.y = 300;

		_stage.addChild(_bunny);

		Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
		_bunny.rotation += 0.1;
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}