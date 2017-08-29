package pixi.loaders;

import pixi.core.textures.Spritesheet;
import pixi.core.textures.Texture;
import pixi.loaders.LoaderOptions.LoaderMetadata;

/**
 * The types of loading a resource can use.
 *
 * @static
 * @constant
 * @property {object} LOAD_TYPE
 * @property {number} LOAD_TYPE.XHR - Uses XMLHttpRequest to load the resource.
 * @property {number} LOAD_TYPE.IMAGE - Uses an `Image` object to load the resource.
 * @property {number} LOAD_TYPE.AUDIO - Uses an `Audio` object to load the resource.
 * @property {number} LOAD_TYPE.VIDEO - Uses a `Video` object to load the resource.
 */
@:native("PIXI.loaders.Resource.LOAD_TYPE")
extern enum LoadType {
	XHR; IMAGE; AUDIO; VIDEO;
}

@:native("PIXI.loaders.Resource.TYPE")
extern enum ResourceType {
	JSON; XML; IMAGE; AUDIO; VIDEO;
}

@:native("PIXI.loaders.Resource")
extern class Resource {

	/**
	 * Manages the state and loading of a single resource represented by
	 * a single URL.
	 *
	 * @class
	 * @param name {string} The name of the resource to load.
	 * @param url {string|string[]} The url for this resource, for audio/video loads you can pass an array of sources.
	 * @param [options] {object} The options for the load.
	 * @param [options.crossOrigin] {boolean} Is this request cross-origin? Default is to determine automatically.
	 * @param [options.loadType=Resource.LOAD_TYPE.XHR] {Resource.LOAD_TYPE} How should this resource be loaded?
	 * @param [options.xhrType=Resource.XHR_RESPONSE_TYPE.DEFAULT] {Resource.XHR_RESPONSE_TYPE} How should the data being
	 *      loaded be interpreted when using XHR?
	 */
	function new(name:String, url:String, ?options:LoaderOptions);

	var texture:Texture;

	var textures:Dynamic<Texture>;

	var spritesheet:Spritesheet;

	var bitmapFont:Dynamic;

	var options:LoaderOptions;

	var metadata:LoaderMetadata;

	var type:ResourceType;

	/**
	 * Extension of this resource
	 * @member {string}
	 */

	var extension:String;
	/**
     * The name of this resource.
     *
     * @member {string}
     * @readonly
     */
	var name:String;

	/**
     * The url used to load this resource.
     *
     * @member {string}
     * @readonly
     */
	var url:String;

	/**
     * The data that was loaded by the resource.
     *
     * @member {any}
     */
	var data:Dynamic;

	/**
     * The XHR object that was used to load this resource. This is only set
     * when `loadType` is `Resource.LOAD_TYPE.XHR`.
     *
     * @member {XMLHttpRequest}
     */
	var xhr:Dynamic;

	/**
     * The type used to load the resource via XHR. If unset, determined automatically.
     *
     * @member {String}
     */
	var xhrType:String;

	/**
     * Is this request cross-origin? If unset, determined automatically.
     *
     * @member {string}
     */
	var crossOrigin:String;

	/**
     * The method of loading to use for this resource.
     *
     * @member {Resource.LOAD_TYPE}
     */
	var loadType:LoadType;

	/**
     * The error that occurred while loading (if any).
     *
     * @member {Error}
     * @readonly
     */
	var error:Dynamic;

	/**
     * Describes if this resource was loaded as json. Only valid after the resource
     * has completely loaded.
     *
     * @member {Bool}
     */
	var isJson:Bool;

	/**
     * Describes if this resource was loaded as xml. Only valid after the resource
     * has completely loaded.
     *
     * @member {Bool}
     */
	var isXml:Bool;

	/**
     * Describes if this resource was loaded as an image tag. Only valid after the resource
     * has completely loaded.
     *
     * @member {Bool}
     */
	var isImage:Bool;

	/**
     * Describes if this resource was loaded as an audio tag. Only valid after the resource
     * has completely loaded.
     *
     * @member {Bool}
     */
	@:deprecated
	var isAudio:Bool;

	/**
     * Describes if this resource was loaded as a video tag. Only valid after the resource
     * has completely loaded.
     *
     * @member {Bool}
     */
	var isVideo:Bool;
}

/**
 * The XHR ready states, used internally.
 *
 * @static
 * @constant
 * @property {object} XHR_READY_STATE
 * @property {number} XHR_READY_STATE.UNSENT - open()has not been called yet.
 * @property {number} XHR_READY_STATE.OPENED - send()has not been called yet.
 * @property {number} XHR_READY_STATE.HEADERS_RECEIVED - send() has been called, and headers and status are available.
 * @property {number} XHR_READY_STATE.LOADING - Downloading; responseText holds partial data.
 * @property {number} XHR_READY_STATE.DONE - The operation is complete.
 */
typedef XHR_READY_STATE = {
	var UNSENT:Int;
	var OPENED:Int;
	var HEADERS_RECEIVED:Int;
	var LOADING:Int;
	var DONE:Int;
}

/**
 * The XHR ready states, used internally.
 *
 * @static
 * @constant
 * @property {object} XHR_RESPONSE_TYPE
 * @property {string} XHR_RESPONSE_TYPE.DEFAULT - defaults to text
 * @property {string} XHR_RESPONSE_TYPE.BUFFER - ArrayBuffer
 * @property {string} XHR_RESPONSE_TYPE.BLOB - Blob
 * @property {string} XHR_RESPONSE_TYPE.DOCUMENT - Document
 * @property {string} XHR_RESPONSE_TYPE.JSON - Object
 * @property {string} XHR_RESPONSE_TYPE.TEXT - String
 */
typedef XHR_RESPONSE_TYPE = {
	var DEFAULT:String;
	var BUFFER:String;
	var BLOB:String;
	var DOCUMENT:String;
	var JSON:String;
	var TEXT:String;
}