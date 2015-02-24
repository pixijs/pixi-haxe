package samples.particles;

import js.Browser;
import haxe.Timer;
import pixi.Application;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.loaders.AssetLoader;

import pixi.plugins.particles.cloudkid.Emitter;

class Main extends Application {

	var _loader:AssetLoader;

	var lastLaunch:Float;
	var elapsed:Float;
	var emitters:Array<Emitter>;
	var particle_json_config:Dynamic;

	public function new() {
		super();
		_init();

		// json has been generated using http://cloudkidstudio.github.io/PixiParticlesEditor/#
		var assetsToLoader:Array<String> = ["assets/particles/particle.png", "assets/particles/p_blow.json"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onProgress = _onAssetLoaded;
		_loader.onComplete = _onAssetsLoaded;
		_loader.load();
	}

	function _init() {
		backgroundColor = 0x003366;
		onUpdate = _onUpdate;
		super.start();

		emitters = new Array();
	}

	function _onUpdate(elapsedTime:Float) {
		var now = Timer.stamp();

		// launch new Emitter every .3 secs
		// remove this to get particles launching all the time

		var launch = now - lastLaunch > .3;
		if (launch) {

			// using a simple bitmap. Use tilesheets for much improved performance
			var t = Texture.fromImage("assets/particles/particle.png");
			var e = new Emitter(_stage, [t], particle_json_config);

			// emitter is spawned at a random position
			var x = Std.random(Std.int(width));
			var y = Std.random(Std.int(height));
			e.spawnPos = new pixi.geom.Point(x, y);

			// start to emit right away
			e.emit = true;
			emitters.push(e);
			lastLaunch = now;
		}

		// update our emitters
		var u = now - elapsed;
		if (emitters.length > 0) {
			for (e in emitters) {
				e.update(u);
			}
			elapsed = now;
		}
	}

	function _onAssetLoaded(loader:Dynamic) {
		if (loader.url == "assets/particles/p_blow.json") particle_json_config = loader.json;
	}

	function _onAssetsLoaded() {
		elapsed = lastLaunch = Timer.stamp();
	}

	static function main() {
		new Main();
	}
}