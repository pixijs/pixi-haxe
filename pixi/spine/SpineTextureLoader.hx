package pixi.spine;

import pixi.textures.BaseTexture;
@:native("PIXI.SpineTextureLoader")
extern class SpineTextureLoader {

	/**
	 * Supporting class to load images from spine atlases as per spine spec.
	 *
	 * @class SpineTextureLoader
	 * @uses EventTarget
	 * @constructor
	 * @param basePath {String} Tha base path where to look for the images to be loaded
	 * @param crossorigin {Bool} Whether requests should be treated as crossorigin
	 */
	function new(basePath:String, ?crossorigin:Bool);

	/**
	 * Starts loading a base texture as per spine specification
	 *
	 * @method load
	 * @param page {spine.AtlasPage} Atlas page to which texture belongs
	 * @param file {String} The file to load, this is just the file path relative to the base path configured in the constructor
	 */
	function load(page:Dynamic, file:String):Void;

	/**
	 * Unloads a previously loaded texture as per spine specification
	 *
	 * @method unload
	 * @param texture {BaseTexture} Texture object to destroy
	 */
	function unload(texture:BaseTexture):Void;

}