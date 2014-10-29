package pixi.loaders;

import pixi.textures.Texture;
@:native("PIXI.ImageLoader")
extern class ImageLoader extends pixi.utils.EventTarget {
	
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
	var texture:Texture;
	
	/**
	 * if the image is loaded with loadFramedSpriteSheet
	 * frames will contain the sprite sheet frames
	 */
	var frames:Array<Dynamic>;

	/**
	 * Loads image or takes it from cache
	 *
	 * @method load
	 */
	function load():Void;

	/**
	 * Loads image and split it to uniform sized frames
	 *
	 * @method loadFramedSpriteSheet
	 * @param frameWidth {Number} width of each frame
	 * @param frameHeight {Number} height of each frame
	 * @param textureName {String} if given, the frames will be cached in <textureName>-<ord> format
	 */
	function loadFramedSpriteSheet(frameWidth:Float, frameHeight:Float, textureName:String):Void;
}