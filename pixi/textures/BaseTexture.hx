package pixi.textures;

import pixi.DomDefinitions;
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
	 * @param scaleMode {Int} Should be one of the PIXI.scaleMode consts
	 */
	function new(source:String, scaleMode:Int);

	/**
	 * The Resolution of the texture.
	 *
	 * @property resolution
	 * @type Float
	 */
	var resolution:Float;

	/**
	 * [read-only] The width of the base texture set when the image has loaded
	 * @property width
	 * @type Float
	 */
	var width:Float;

	/**
	 * [read-only] The height of the base texture set when the image has loaded
	 * @property height
	 * @type Float
	 */
	var height:Float;

	/**
	 * The scale mode to apply when scaling this texture
	 * @property scaleMode
	 * @type Float
	 */
	var scaleMode:Float;

	/**
	 * [read-only] Describes if the base texture has loaded or not
	 * @property hasLoaded
	 * @type Bool
	 */
	var hasLoaded:Bool;

	/**
	 * The source that is loaded to create the texture
	 * @property source
	 * @type Dynamic
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
	 * @param crossorigin {Bool}
	 * @param scaleMode {Int} Should be one of the PIXI.scaleMode consts
	 * @return BaseTexture
	 */
	static function fromImage(imageUrl:String, ?crossorigin:Bool, ?scaleMode:Int):BaseTexture;

	/**
	 * Helper function that returns a base texture based on a canvas element
	 * If the image is not in the base texture cache it will be created and loaded
	 *
	 * @static
	 * @method fromCanvas
	 * @param canvas {Canvas} The canvas element source of the texture
	 * @param scaleMode {Int} Should be one of the PIXI.scaleMode consts
	 * @return BaseTexture
	 */
	static function fromCanvas(canvas:CanvasElement, ?scaleMode:Int):BaseTexture;
}