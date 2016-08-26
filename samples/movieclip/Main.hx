package movieclip;

import pixi.extras.MovieClip;
import pixi.loaders.Loader;
import pixi.plugins.app.Application;
import pixi.core.textures.Texture;
import js.Browser;

class Main extends Application {

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xFFFFFF;
		super.start(Application.AUTO);

		var mcloader:Loader = new Loader();
		mcloader.add("mc", "assets/movieclip/SpriteSheet.json");
		mcloader.load(_onLoaded);
	}

	function _onLoaded() {
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

			stage.addChild(explosion);
		}
	}

	static function main() {
		new Main();
	}
}