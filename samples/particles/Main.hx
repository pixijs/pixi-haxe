package samples.particles;

import pixi.Application;
import pixi.renderers.IRenderer;
import pixi.display.MovieClip;
import pixi.display.Stage;
import pixi.textures.Texture;
import pixi.utils.Detector;
import pixi.loaders.AssetLoader;
import js.Browser;

import pixi.loaders.JsonLoader;
import pixi.plugins.particles.cloudkid.Emitter;
import pixi.plugins.particles.cloudkid.Particle;


class Main extends Application {

	var _loader:AssetLoader;

	var lastLaunch : Float;
	var elapsed : Float;
	var emitters : Array<Emitter>;
	var particle_json_config : Dynamic;


	public function new() {
		super();
		_init();

		var assetsToLoader:Array<String> = ["assets/particles/particle.png"];

		_loader = new AssetLoader(assetsToLoader);
		_loader.onComplete = onAssetsLoaded;
		_loader.load();
	}

	function _init() {
		stats = true;
		backgroundColor = 0x000000;
		onUpdate = _onUpdate;
		resize = false;
		width = 800;
		height = 600;
		emitters = new Array();

		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		var now = haxe.Timer.stamp();

		// launch new Emitter every .2 secs
		// remove this to get particles launching all the time
		var launch = now - lastLaunch > .3;
		if( launch ) {

			// using a simple bitmap. Use tilesheets for much improved performance
			var t = Texture.fromImage("assets/particles/particle.png");			
			var e = new Emitter( _stage, [t], particle_json_config );

			// emitter is spawned at a random position
			var x = Std.random( Std.int( width ) );
			var y = Std.random( Std.int( height ) );
			e.spawnPos = new pixi.geom.Point(x, y );

			// start to emit right away
			e.emit = true;
			emitters.push(e);		
			lastLaunch = now;
		}

		// update our emitters
		var t = now - elapsed;
		if( emitters.length > 0 ) {
			for( e in emitters ) {	
				e.update( t );
			}
			elapsed = now;
		}

		_renderer.render(_stage);
	}

	function onAssetsLoaded() {

		// load particles json configuration files 
		// json are loaded in a funny way. (need to check if pixi.js will make/has made this easier)
		// this one has been generated using http://cloudkidstudio.github.io/PixiParticlesEditor/#
		var j = new CustomJsonLoader("assets/particles/p_blow.json");
		j.on("error",  function( evt ) {
			throw evt;
		});
		j.on("loaded",  function( evt ) {
			particle_json_config = j.json;
			elapsed = lastLaunch = haxe.Timer.stamp();
		});
		j.load();
	}

	static function main() {
		new Main();
	}
}

class CustomJsonLoader extends JsonLoader {

	public var name : String;

	public function new( name : String ) {
		super(name);
		this.name = name;
	}
}

