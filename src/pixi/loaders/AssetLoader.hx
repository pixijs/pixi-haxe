package pixi.loaders;

@:native("PIXI.AssetLoader")
extern class AssetLoader {
	
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
	function new(assetURLs:Dynamic, ?crossorigin:Bool);
	
	/**
	 * The array of asset URLs that are going to be loaded
	*/
	public var assetURLs:Dynamic;
	
	/**
	 * Whether the requests should be treated as cross origin
	*/
	public var crossorigin:Bool;
	
	/**
	 * Maps file extension to loader types
	*/
	public var loadersByType:Dynamic;

	public var loadCount:Int;

	public var onProgress:Dynamic;

	public var onComplete:Dynamic;

	/**
	 * Starts loading the assets sequentially
	 *
	 * @method load
	*/
	public function load():Void;
	
}
