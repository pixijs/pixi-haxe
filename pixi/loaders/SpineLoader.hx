package pixi.loaders;

import pixi.utils.EventTarget;

@:native("PIXI.SpineLoader")
extern class SpineLoader extends EventTarget {

	/**
	 * The Spine loader is used to load in JSON spine data
	 * To generate the data you need to use http://esotericsoftware.com/ and export in the "JSON" format
	 * Due to a clash of names  You will need to change the extension of the spine file from *.json to *.anim for it to load
	 * See example 12 (http://www.goodboydigital.com/pixijs/examples/12/) to see a working example and check out the source
	 * You will need to generate a sprite sheet to accompany the spine data
	 * When loaded this class will dispatch a "loaded" event
	 *
	 * @class SpineLoader
	 * @uses EventTarget
	 * @constructor
	 * @param url {String} The url of the JSON file
	 * @param crossorigin {Boolean} Whether requests should be treated as crossorigin
	 */
	function new(url:String, ?crossorigin:Bool);

	/**
	 * The url of the JSON file
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

	/**
	 * Loads the JSON data
	 *
	 * @method load
	 */
	function load():Void;
}