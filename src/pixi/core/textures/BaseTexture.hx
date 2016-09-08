package pixi.core.textures;

import pixi.interaction.EventEmitter;
import js.html.ImageElement;
import js.html.CanvasElement;

@:native("PIXI.BaseTexture")
extern class BaseTexture extends EventEmitter {

	/**
	 * A texture stores the information that represents an image. All textures have a base texture.
	 *
	 * @class
	 * @memberof PIXI
	 * @param source {Image|Canvas} the source object of the texture.
	 * @param [scaleMode=scaleModes.DEFAULT] {Int} See {@link SCALE_MODES} for possible values
	 * @param [resolution=1] {Float} The resolution / device pixel ratio of the texture
	 */
	@:overload(function(source:Dynamic,?scaleMode:Int, ?resolution:Float):Void {})
	@:overload(function(source:CanvasElement,?scaleMode:Int, ?resolution:Float):Void {})
	function new(source:ImageElement, ?scaleMode:Int, ?resolution:Float);

	/**
	 * The Resolution of the texture.
	 *
	 * @member {Float}
	 */
	var resolution:Float;

	/**
	 * The width of the base texture set when the image has loaded
	 *
	 * @member {Float}
	 * @readOnly
	 */
	var width:Float;

	/**
	 * The height of the base texture set when the image has loaded
	 *
	 * @member {Float}
	 * @readOnly
	 */
	var height:Float;

	/**
	 * The scale mode to apply when scaling this texture
	 *
	 * @member {Int}
	 * @default scaleModes.LINEAR
	 */
	var scaleMode:Int;

	/**
	 * Set to true once the base texture has successfully loaded.
	 *
	 * This is never true if the underlying source fails to load or has no texture data.
	 *
	 * @member {Bool}
	 * @readOnly
	 */
	var hasLoaded:Bool;

	/**
	 * Set to true if the source is currently loading.
	 *
	 * If an Image source is loading the 'loaded' or 'error' event will be
	 * dispatched when the operation ends. An underyling source that is
	 * immediately-available bypasses loading entirely.
	 *
	 * @member {Bool}
	 * @readonly
	 */
	var isLoading:Bool;

	/**
	 * The image source that is used to create the texture.
	 *
	 * @member {Image|Canvas}
	 * @readonly
	 */
	var source:Dynamic;

	/**
	 * Controls if RGB channels should be pre-multiplied by Alpha (WebGL only)
	 *
	 * @member {Bool}
	 * @default true
	 */
	var premultipliedAlpha:Bool;

	/**
	 * @member {String}
	 */
	var imageUrl:String;

	/**
	 *
	 * Set this to true if a mipmap of this texture needs to be generated. This value needs to be set before the texture is used
	 * Also the texture must be a power of two size to work
	 *
	 * @member {Bool}
	 */
	var mipmap:Bool;

	/**
     *
     * WebGL Texture wrap mode
     *
     * @member {Int}
     * @see PIXI.WRAP_MODES
     */
	var wrapMode:Int;

	/**
	 * Updates the texture on all the webgl renderers.
	 *
	 * @fires update
	 */
	function update():Void;

	/**
	 * Destroys this base texture
	 *
	 */
	function destroy():Void;

	/**
	 * Frees the texture from WebGL memory without destroying this texture object.
	 * This means you can still use the texture later which will upload it to GPU
	 * memory again.
	 *
	 */
	function dispose():Void;

	/**
	 * Load a source.
	 *
	 * If the source is not-immediately-available, such as an image that needs to be
	 * downloaded, then the 'loaded' or 'error' event will be dispatched in the future
	 * and `hasLoaded` will remain false after this call.
	 *
	 * The logic state after calling `loadSource` directly or indirectly (eg. `fromImage`, `new BaseTexture`) is:
	 *
	 *     if (texture.hasLoaded) {
	 *        // texture ready for use
	 *     } else if (texture.isLoading) {
	 *        // listen to 'loaded' and/or 'error' events on texture
	 *     } else {
	 *        // not loading, not going to load UNLESS the source is reloaded
	 *        // (it may still make sense to listen to the events)
	 *     }
	 *
	 * @protected
	 * @param source {Image|Canvas} the source object of the texture.
	 */
	function loadSource(source:String):Void;

	/**
	 * Changes the source image of the texture.
	 * The original source must be an Image element.
	 *
	 * @param newSrc {String} the path of the image
	 */
	function updateSourceImage(newSrc:String):Void;

	/**
	 * Helper function that creates a base texture from the given image url.
	 * If the image is not in the base texture cache it will be created and loaded.
	 *
	 * @static
	 * @param imageUrl {String} The image url of the texture
	 * @param [crossorigin=(auto)] {Bool} Should use anonymouse CORS? Defaults to true if the URL is not a data-URI.
	 * @param [scaleMode=scaleModes.DEFAULT] {Int} See {@link scaleModes} for possible values
	 * @return BaseTexture
	 */
	static function fromImage(imageUrl:String, ?crossorigin:Bool, ?scaleMode:Int):BaseTexture;

	/**
	 * Helper function that creates a base texture from the given canvas element.
	 *
	 * @static
	 * @param canvas {Canvas} The canvas element source of the texture
	 * @param scaleMode {Int} See {{#crossLink "PIXI/scaleModes:property"}}scaleModes{{/crossLink}} for possible values
	 * @return BaseTexture
	 */
	static function fromCanvas(canvas:CanvasElement, ?scaleMode:Int):BaseTexture;
}