package samples.movieclip;

import pixi.renderers.webgl.WebGLRenderer;
import pixi.display.MovieClip;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import js.Browser;

class Main {

	var _loader:AssetLoader;
	var _renderer:WebGLRenderer;
	var _stage:Stage;

	public function new() {
		_stage = new Stage(0x00FF00);
		_renderer = Detector.autoDetectRenderer(800, 600);
		Browser.document.body.appendChild(_renderer.view);

		var assetsToLoader:Array<String> = ["assets/movieclip/SpriteSheet.json"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();

		Browser.window.requestAnimationFrame(cast animate);
	}

	function animate() {
		Browser.window.requestAnimationFrame(cast animate);
		_renderer.render(_stage);
	}

	function onAssetsLoaded() {
		var explosionTextures = [];

		var texture:Texture;
		for (i in 0 ... 26) {
			texture = Texture.fromFrame("Explosion_Sequence_A " + (i + 1) + ".png");
			explosionTextures.push(texture);
		}

		var explosion:MovieClip;
		for (i in 0...50) {
			explosion = new MovieClip(explosionTextures);
			explosion.position.x = Math.random() * 800;
			explosion.position.y = Math.random() * 600;
			explosion.anchor.x = 0.5;
			explosion.anchor.y = 0.5;

			explosion.rotation = Math.random() * Math.PI;
			explosion.scale.x = explosion.scale.y = 0.75 + Math.random() * 0.5;

			explosion.gotoAndPlay(Std.random(27));
			explosion.animationSpeed = 0.8;

			_stage.addChild(explosion);
		}

		Browser.window.requestAnimationFrame(cast animate);
	}

	static function main() {
		new Main();
	}
}