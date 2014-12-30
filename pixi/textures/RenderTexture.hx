package pixi.textures;

import pixi.geom.Matrix;
import pixi.display.DisplayObject;
import pixi.DomDefinitions;
import pixi.renderers.canvas.CanvasRenderer;
import pixi.renderers.webgl.WebGLRenderer;

@:native("PIXI.RenderTexture")
extern class RenderTexture extends Texture {

	/**
	 * A RenderTexture is a special texture that allows any Pixi display object to be rendered to it.
	 *
	 * __Hint__: All DisplayObjects (i.e. Sprites) that render to a RenderTexture should be preloaded otherwise black rectangles will be drawn instead.
	 *
	 * A RenderTexture takes a snapshot of any Display Object given to its render method. The position and rotation of the given Display Objects is ignored. For example:
	 *
	 *    var renderTexture = new PIXI.RenderTexture(800, 600);
	 *    var sprite = PIXI.Sprite.fromImage("spinObj_01.png");
	 *    sprite.position.x = 800/2;
	 *    sprite.position.y = 600/2;
	 *    sprite.anchor.x = 0.5;
	 *    sprite.anchor.y = 0.5;
	 *    renderTexture.render(sprite);
	 *
	 * The Sprite in this case will be rendered to a position of 0,0. To render this sprite at its actual position a DisplayObjectContainer should be used:
	 *
	 *    var doc = new PIXI.DisplayObjectContainer();
	 *    doc.addChild(sprite);
	 *    renderTexture.render(doc);  // Renders to center of renderTexture
	 *
	 * @class RenderTexture
	 * @extends Texture
	 * @constructor
	 * @param [width] {Float} The width of the render texture
	 * @param [height] {Float} The height of the render texture
	 * @param [renderer] {CanvasRenderer|WebGLRenderer} The renderer used for this RenderTexture
	 * @param [scaleMode] {Int} Should be one of the PIXI.scaleMode consts
	 * @param [resolution] {Float} The resolution of the texture being generated
	 */
	@:overload(function(?width:Float, ?height:Float, ?renderer:CanvasRenderer, ?scaleMode:Int, ?resolution:Float):Void {})
	function new(?width:Float, ?height:Float, ?renderer:WebGLRenderer, ?scaleMode:Int, ?resolution:Float);

	/**
	 * This function will draw the display object to the texture.
	 *
	 * @method renderWebGL/renderCanvas
	 * @param displayObject {DisplayObject} The display object to render this texture on
	 * @param [matrix] {Matrix} Optional matrix to apply to the display object before rendering.
	 * @param [clear] {Bool} If true the texture will be cleared before the displayObject is drawn
	 */
	var render:DisplayObject -> Matrix -> Bool -> Void;

	/**
	 * Resize the RenderTexture.
	 *
	 * @method resize
	 * @param width {Float} The width to resize to.
	 * @param height {Float} The height to resize to.
	 * @param [updateBase] {Bool} Should the baseTexture.width and height values be resized as well?
	 */
	function resize(width:Float, height:Float, ?updateBase:Bool):Void;

	/**
	 * Clears the RenderTexture.
	 *
	 * @method clear
	 */
	function clear():Void;

	/**
	 * Will return a a base64 encoded string of this texture. It works by calling RenderTexture.getCanvas and then running toDataURL on that.
	 *
	 * @method getBase64
	 * @return {String} A base64 encoded string of the texture.
	 */
	function getBase64():String;

	/**
	 * Creates a Canvas element, renders this RenderTexture to it and then returns it.
	 *
	 * @method getCanvas
	 * @return {CanvasElement} A Canvas element with the texture rendered on.
	 */
	function getCanvas():CanvasElement;

	/**
	 * Will return a HTML Image of the texture
	 *
	 * @method getImage
	 * @return {HTMLImage}
	 */
	function getImage():Image;

	/**
	 * The renderer this RenderTexture uses. A RenderTexture can only belong to one renderer at the moment if its webGL.
	 *
	 * @property renderer
	 * @type CanvasRenderer|WebGLRenderer
	 */
	var renderer:Dynamic;

	/**
	 * The Resolution of the texture.
	 *
	 * @property resolution
	 * @type Number
	 */
	var resolution:Float;
}