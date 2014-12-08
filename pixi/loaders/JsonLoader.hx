package pixi.loaders;

import pixi.utils.EventTarget;

@:native("PIXI.JsonLoader")
extern class JsonLoader extends EventTarget {

	/**
	 * The json file loader is used to load in JSON data and parse it
	 * When loaded this class will dispatch a 'loaded' event
	 * If loading fails this class will dispatch an 'error' event
	 *
	 * @class JsonLoader
	 * @uses EventTarget
	 * @constructor
	 * @param url {String} The url of the JSON file
	 * @param [crossorigin] {Bool} Whether requests should be treated as crossorigin
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
	 * [read-only] The base url of the json file
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
	 * XDomainRequest for cross origin
	 */
	var ajaxRequest:Dynamic;

	/**
	 * Loads the JSON data
	 *
	 * @method load
	 */
	function load():Void;
}