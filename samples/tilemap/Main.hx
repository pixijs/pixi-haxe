package tilemap;

import haxe.Timer;
import pixi.core.textures.Texture;
import pixi.loaders.Loader;
import pixi.plugins.app.Application;
import pixi.tilemap.CompositeRectTileLayer;

class Main extends Application {

	var _loader:Loader;
	var _tilemap:CompositeRectTileLayer;

	var _frame:Int;

	public function new() {
		super();
		_init();
	}

	function _init() {
		onUpdate = _onUpdate;
		super.start(Application.AUTO);

		_loader = new Loader();
		_loader.baseUrl = "assets/tilemap/";
		_loader.add("atlas", "atlas.json");
		_loader.add("button", "button.png");
		_loader.load(_onLoaded);
	}

	function _onLoaded() {
		//first parameter means z-layer, which is not used yet
		//second parameter is list of textures for layers
		//third parameter means that all our tiles are squares or at least 2x1 dominoes
		//   and we can optimize it with gl.POINTS
		_tilemap = new pixi.tilemap.CompositeRectTileLayer();
		_tilemap.initialize(0, [_loader.resources.atlas_image.texture], true);
		stage.addChild(_tilemap);

		_frame = 0;

		var timer = new Timer(400);
		timer.run = function () {
			_frame = _frame == 0 ? 1 : 0;
			buildTilemap(_frame);
		};
	}

	function buildTilemap(frame:Int) {

		//Clear everything, like a PIXI.Graphics
		_tilemap.clear();

		var resources = _loader.resources;
		var size:Int = 32;

		// if you are too lazy, just specify filename and pixi will find it in cache
		for (i in 0...7)
			for (j in 0...7) {
				_tilemap.addFrame("grass.png", i * size, j * size);
				if (i % 2 == 1 && j % 2 == 1)
					_tilemap.addFrame("tough.png", i * size, j * size);
			}

		// if you are lawful citizen, please use textures from
		var textures:Dynamic = resources.atlas.textures;
		_tilemap.addFrame(Reflect.field(textures, "brick.png"), 2 * size, 2 * size);
		_tilemap.addFrame(Reflect.field(textures, "brick_wall.png"), 2 * size, 3 * size);

		//chest will be animated!
		trace('frame : ' + frame);
		_tilemap.addFrame(frame == 0 ? Reflect.field(textures, "chest.png") : Reflect.field(textures, "red_chest.png"), 4 * size, 4 * size);

		// button does not appear in the atlas, but tilemap wont surrender, it will create second layer for special for buttons
		// buttons will appear above everything
		_tilemap.addFrame(resources.button.texture, 6 * size, 2 * size);
	}

	function _onUpdate(elapsedTime:Float) {

	}

	static function main() {
		new Main();
	}
}