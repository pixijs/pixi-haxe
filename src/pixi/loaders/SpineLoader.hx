package phaser.pixi.loaders;

@:native("PIXI.SpineLoader")
extern class SpineLoader {
	
	/**
	 * The Spine loader is used to load in JSON spine data
	 * To generate the data you need to use <a href='http://esotericsoftware.com/'>http://esotericsoftware.com/</a> and export in the "JSON" format
	 * Due to a clash of names  You will need to change the extension of the spine file from *.json to *.anim for it to load
	 * See example 12 (<a href='http://www.goodboydigital.com/pixijs/examples/12/'>http://www.goodboydigital.com/pixijs/examples/12/</a>) to see a working example and check out the source
	 * You will need to generate a sprite sheet to accompany the spine data
	 * When loaded this class will dispatch a "loaded" event
	 */
	function new (String:Dynamic, Boolean:Dynamic);
	
	/**
	 * The url of the bitmap font data
	 */
	var url:String;
	
	/**
	 * Whether the requests should be treated as cross origin
	 */
	var crossorigin:Bool;
	
	/**
	 * [read-only] Whether the data has loaded yet
	 */
	var loaded:Bool;
	
}
