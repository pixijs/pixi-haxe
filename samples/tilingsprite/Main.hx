package demos.tilingsprite;

import pixi.extras.TilingSprite;
import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import js.Browser;

class Main {

	var _tilingSprite:TilingSprite;
	var _renderer:WebGLRenderer;
	var _stage:Stage;
	var _count:Float;

	public function new() {
		_stage = new Stage(0x97C56E);

		_renderer = Detector.autoDetectRenderer(Browser.window.innerWidth, Browser.window.innerHeight);
		Browser.document.body.appendChild(_renderer.view);

		var texture = Texture.fromImage("assets/tilingsprite/p2.jpeg");
		_tilingSprite = new TilingSprite(texture, Browser.window.innerWidth, Browser.window.innerHeight);

		_stage.addChild(_tilingSprite);

		_count = 0;

		Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
		_count += 0.005;
		_tilingSprite.tileScale.x = 2 + Math.sin(_count);
		_tilingSprite.tileScale.y = 2 + Math.cos(_count);

		_tilingSprite.tilePosition.x += 1;
		_tilingSprite.tilePosition.y += 1;
		_renderer.render(_stage);
	}

	static function main() {
		new Main();
	}
}