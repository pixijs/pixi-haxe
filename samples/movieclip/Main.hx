package samples.movieclip;

import js.Browser;
import pixi.Application;
import pixi.renderers.IRenderer;
import pixi.display.MovieClip;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.loaders.AssetLoader;

class Main extends Application {

	var _loader:AssetLoader;

	public function new() {
		super();
		_init();

		var assetsToLoader:Array<String> = ["assets/movieclip/SpriteSheet.json"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();
	}

	function _init() {
		backgroundColor = 0x00FF66;
		onUpdate = _onUpdate;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
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
		for (i in 0 ... 80) {
			explosion = new MovieClip(explosionTextures);
			explosion.position.x = Math.random() * Browser.window.innerWidth;
			explosion.position.y = Math.random() * Browser.window.innerHeight;
			explosion.anchor.set(0.5, 0.5);

			explosion.rotation = Math.random() * Math.PI;
			explosion.scale.x = explosion.scale.y = 0.75 + Math.random() * 0.5;

			explosion.gotoAndPlay(Std.random(27));
			explosion.animationSpeed = 0.8;

			_stage.addChild(explosion);
		}
	}

	static function main() {
		new Main();
	}
}