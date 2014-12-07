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
	 * @param {Bool} crossorigin
	 */
	function new(url:String, ?crossorigin:Bool);

	/**
	 * The url of the json file
	 *
	 * @property url
	 * @type String
	 */
	var url:String;

	/**
	 * Whether the requests should be treated as cross origin
	 *
	 * @property crossorigin
	 * @type Boolean
	 */
	var crossorigin:Bool;

	/**
	 * [read-only] The base url of json file
	 *
	 * @property baseUrl
	 * @type String
	 * @readOnly
	 */
	var baseUrl:String;

	/**
	 * [read-only] Whether the data has loaded yet
	 *
	 * @property loaded
	 * @type Boolean
	 * @readOnly
	 */
	var loaded:Bool;

	/**
	 * Parsed json response
	 */
	var json:Dynamic;

	/**
	 * Starts loading the JSON file
	 *
	 * @method load
	 */
	function load():Void;
}