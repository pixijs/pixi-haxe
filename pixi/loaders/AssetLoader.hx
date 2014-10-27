package pixi.loaders;

@:native("PIXI.AssetLoader")
extern class AssetLoader extends pixi.utils.EventTarget {
	
	/**
	 * A Class that loads a bunch of images / sprite sheet / bitmap font files. Once the
	 * assets have been loaded they are added to the PIXI Texture cache and can be accessed
	 * easily through PIXI.Texture.fromImage() and PIXI.Sprite.fromImage()
	 * When all items have been loaded this class will dispatch a 'onLoaded' event
	 * As each individual item is loaded this class will dispatch a 'onProgress' event
	 *
	 * @class AssetLoader
	 * @constructor
	 * @uses EventTarget
	 * @param {Array<String>} assetURLs an array of image/sprite sheet urls that you would like loaded
	 *      supported. Supported image formats include 'jpeg', 'jpg', 'png', 'gif'. Supported
	 *      sprite sheet data formats only include 'JSON' at this time. Supported bitmap font
	 *      data formats include 'xml' and 'fnt'.
	 * @param crossorigin {Boolean} Whether requests should be treated as crossorigin
	*/
	function new(assetURLs:Array<String>, ?crossorigin:Bool);
	
	/**
	 * The array of asset URLs that are going to be loaded
	*/
	var assetURLs:Array<String>;
	
	/**
	 * Whether the requests should be treated as cross origin
	*/
	var crossorigin:Bool;
	
	/**
	 * Maps file extension to loader types
	*/
	var loadersByType:Dynamic;

    /**
	 * Fired when an item has loaded
	*/
	var onProgress:AssetLoader -> Void;

    /**
	 * Fired when all the assets have loaded
	*/
	var onComplete:Void -> Void;

	/**
	 * Starts loading the assets sequentially
	 *
	 * @method load
	*/
	function load():Void;

    /**
     * Given a filename, returns its extension.
     *
     * @method _getDataType
     * @param str {String} the name of the asset
     */
    function _getDataType(str:String):String;
}