package pixi.loaders;

import pixi.utils.EventTarget;

@:native("PIXI.AtlasLoader")
extern class AtlasLoader extends EventTarget {
	
	/**
	 * The atlas file loader is used to load in Atlas data and parse it
	 * When loaded this class will dispatch a 'loaded' event
	 * If loading fails this class will dispatch an 'error' event
	 * @class AtlasLoader
	 * @extends EventTarget
	 * @constructor
	 * @param {String} url the url of the JSON file
	 * @param {Boolean} crossorigin
	 */
	function new (url:String, ?crossorigin:Bool);

	/**
	 * The url
	 */
	var url:String;
	
	/**
	 * Whether the requests should be treated as cross origin
	 */
	var crossorigin:Bool;
	
	/**
	 * [read-only] The base url
	 */
	var baseUrl:String;

	/**
	 * [read-only] Whether the data has loaded yet
	 */
	var loaded:Bool;

	/**
	 * Loads the JSON data
	 *
	 * @method load
	 */
	function load():Void;
}