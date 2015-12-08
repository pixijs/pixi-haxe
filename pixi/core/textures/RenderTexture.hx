package pixi.core.textures;

import js.html.CanvasElement;
import js.html.Image;
import js.html.Uint8ClampedArray;
import pixi.core.display.DisplayObject;
import pixi.core.math.Matrix;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI.RenderTexture")
extern class RenderTexture extends Texture {

	/**
	 * A RenderTexture is a special texture that allows any Pixi display object to be rendered to it.
	 *
	 * __Hint__: All DisplayObjects (i.e. Sprites) that render to a RenderTexture should be preloaded
	 * otherwise black rectangles will be drawn instead.
	 *
	 * A RenderTexture takes a snapshot of any Display Object given to its render method. The position
	 * and rotation of the given Display Objects is ignored. For example:
	 *
	 * ```js
	 * 	var renderTexture = new PIXI.RenderTexture(800, 600);
	 * 	var sprite = PIXI.Sprite.fromImage("spinObj_01.png");
	 *
	 * sprite.position.x = 800/2;
	 * sprite.position.y = 600/2;
	 * sprite.anchor.x = 0.5;
	 * sprite.anchor.y = 0.5;
	 *
	 * renderTexture.render(sprite);
	 * ```
	 *
	 * The Sprite in this case will be rendered to a position of 0,0. To render this sprite at its actual
	 * position a Container should be used:
	 *
	 * ```js
	 * 	var doc = new Container();
	 *
	 * doc.addChild(sprite);
	 *
	 * renderTexture.render(doc);  // Renders to center of renderTexture
	 * ```
	 *
	 * @class
	 * @extends Texture
	 * @namespace PIXI
	 * @param renderer {CanvasRenderer|WebGLRenderer} The renderer used for this RenderTexture
	 * @param [width=100] {number} The width of the render texture
	 * @param [height=100] {number} The height of the render texture
	 * @param [scaleMode] {number} See {@link SCALE_MODES} for possible values
	 * @param [resolution=1] {number} The resolution of the texture being generated
	 */
	@:overload(function(renderer:CanvasRenderer, ?width:Float, ?height:Float, ?scaleMode:Int, ?resolution:Float):Void {})
	function new(renderer:WebGLRenderer, ?width:Float, ?height:Float, ?scaleMode:Int, ?resolution:Float);

	/**
	 * The Resolution of the texture.
	 *
	 * @member {Float}
	 */
	var resolution:Float;

	/**
	 * The renderer this RenderTexture uses. A RenderTexture can only belong to one renderer at the moment if its webGL.
	 *
	 * @member {CanvasRenderer|WebGLRenderer}
	 */
	var renderer:Dynamic;

	/**
	 * Draw/render the given DisplayObject onto the texture.
	 *
	 * The displayObject and descendents are transformed during this operation.
	 * If `updateTransform` is true then the transformations will be restored before the
	 * method returns. Otherwise it is up to the calling code to correctly use or reset
	 * the transformed display objects.
	 *
	 * The display object is always rendered with a worldAlpha value of 1.
	 *
	 * @method
	 * @param displayObject {PIXI.DisplayObject} The display object to render this texture on
	 * @param [matrix] {PIXI.Matrix} Optional matrix to apply to the display object before rendering.
	 * @param [clear=false] {boolean} If true the texture will be cleared before the displayObject is drawn
	 * @param [updateTransform=true] {boolean} If true the displayObject's worldTransform/worldAlpha and all children
	 *  transformations will be restored. Not restoring this information will be a little faster.
	 */
	function render(displayObject:DisplayObject, matrix:Matrix, clear:Bool = false, updateTransform:Bool = true):Void;

	/**
	 * Resizes the RenderTexture.
	 *
	 * @param width {Float} The width to resize to.
	 * @param height {Float} The height to resize to.
	 * @param updateBase {Bool} Should the baseTexture.width and height values be resized as well?
	 */
	function resize(width:Float, height:Float, updateBase:Bool):Void;

	/**
	 * Clears the RenderTexture.
	 *
	 */
	function clear():Void;

	/**
	 * Will return a HTML Image of the texture
	 *
	 * @return {Image}
	 */
	function getImage():Image;

	/**
	 * Will return a a base64 encoded string of this texture. It works by calling RenderTexture.getCanvas and then running toDataURL on that.
	 *
	 * @return {String} A base64 encoded string of the texture.
	 */
	function getBase64():String;

	/**
	 * Creates a Canvas element, renders this RenderTexture to it and then returns it.
	 *
	 * @return {HTMLCanvasElement} A Canvas element with the texture rendered on.
	 */
	function getCanvas():CanvasElement;

	/**
	 * Will return a one-dimensional array containing the pixel data of a pixel within the texture in RGBA order, with integer values between 0 and 255 (included).
	 *
	 * @param x {number} The x coordinate of the pixel to retrieve.
	 * @param y {number} The y coordinate of the pixel to retrieve.
	 * @return {Uint8ClampedArray}
	 */
	function getPixel(x:Float, y:Float):Uint8ClampedArray;

	/**
	 * Will return a one-dimensional array containing the pixel data of the entire texture in RGBA order, with integer values between 0 and 255 (included).
	 *
	 * @return {Uint8ClampedArray}
	 */
	function getPixels():Uint8ClampedArray;
}