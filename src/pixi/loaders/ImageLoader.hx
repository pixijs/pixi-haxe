package pixi.loaders;

@:native("PIXI.ImageLoader")
extern class ImageLoader {
	
	/**
	 * The image loader class is responsible for loading images file formats ('jpeg', 'jpg', 'png' and 'gif')
	 * Once the image has been loaded it is stored in the PIXI texture cache and can be accessed though PIXI.Texture.fromFrameId() and PIXI.Sprite.fromFrameId()
	 * When loaded this class will dispatch a 'loaded' event
	 *
	 * @class ImageLoader
	 * @uses EventTarget
	 * @constructor
	 * @param url {String} The url of the image
	 * @param crossorigin {Boolean} Whether requests should be treated as crossorigin
	 */
	function new (url:String, ?crossorigin:Bool);
	
	/**
	 * The texture being loaded
	 */
	var texture:Dynamic;
	
	/**
	 * if the image is loaded with loadFramedSpriteSheet
	 * frames will contain the sprite sheet frames
	 */
	var frames:Dynamic;

	/**
	 * Loads the image
	 *
	 * @method load
	 */
	function load():Void;
}