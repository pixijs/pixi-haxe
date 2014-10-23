package pixi.textures;

import pixi.utils.EventTarget;

@:native("PIXI.BaseTexture")
extern class BaseTexture extends EventTarget {
	
	/**
	 * A texture stores the information that represents an image. All textures have a base texture
	 *
	 * @class BaseTexture
	 * @uses EventTarget
	 * @constructor
	 * @param source {String} the source object (image or canvas)
	 * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
	 */
	function new(source:String, scaleMode:Float);

    /**
     * The Resolution of the texture.
     *
     * @property resolution
     * @type Number
     */
    var resolution:Float;

	/**
	 * [read-only] The width of the base texture set when the image has loaded
	 */
	var width:Float;
	
	/**
	 * [read-only] The height of the base texture set when the image has loaded
	 */
	var height:Float;
	
	/**
	 * The scale mode to apply when scaling this texture
	 */
	var scaleMode:Float;
	
	/**
	 * [read-only] Describes if the base texture has loaded or not
	 */
	var hasLoaded:Bool;
	
	/**
	 * The source that is loaded to create the texture
	 */
	var source:Dynamic;

    var imageUrl:String;

    var premultipliedAlpha:Bool;
	
	/**
	 * Destroys this base texture
	 *
	 * @method destroy
	 */
	function destroy():Void;

    /**
	 * Sets all glTextures to be dirty.
	 *
	 * @method dirty
	 */
    function dirty():Void;

	/**
	 * Changes the source image of the texture
	 *
	 * @method updateSourceImage
	 * @param newSrc {String} the path of the image
	 */
	function updateSourceImage(newSrc:String):Void;

	/**
	 * Helper function that returns a base texture based on an image url
	 * If the image is not in the base texture cache it will be created and loaded
	 *
	 * @static
	 * @method fromImage
	 * @param imageUrl {String} The image url of the texture
	 * @param crossorigin {Boolean} 
	 * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
	 * @return BaseTexture
	 */
	static function fromImage(imageUrl:String, ?crossorigin:Bool, ?scaleMode:Float):BaseTexture;

	/**
	 * Helper function that returns a base texture based on a canvas element
	 * If the image is not in the base texture cache it will be created and loaded
	 *
	 * @static
	 * @method fromCanvas
	 * @param canvas {Canvas} The canvas element source of the texture
	 * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
	 * @return BaseTexture
	 */
	static function fromCanvas(canvas:Dynamic, ?scaleMode:Float):BaseTexture;
}