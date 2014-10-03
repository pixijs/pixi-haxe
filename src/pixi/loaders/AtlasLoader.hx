package phaser.pixi.loaders;

@:native("PIXI.AtlasLoader")
extern class AtlasLoader extends phaser.pixi.utils.EventTarget {
	
	/**
	 * The atlas file loader is used to load in Atlas data and parse it
	 * When loaded this class will dispatch a 'loaded' event
	 * If loading fails this class will dispatch an 'error' event
	 */
	function new (url:String, crossorigin:Bool);
	
}
