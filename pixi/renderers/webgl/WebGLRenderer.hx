package pixi.renderers.webgl;

import pixi.renderers.webgl.utils.WebGLSpriteBatch;
import pixi.renderers.webgl.utils.WebGLMaskManager;
import pixi.renderers.webgl.utils.WebGLFilterManager;
import pixi.renderers.webgl.utils.WebGLStencilManager;
import pixi.renderers.webgl.utils.WebGLBlendModeManager;
import pixi.renderers.webgl.utils.WebGLShaderManager;
import pixi.utils.Event;
import pixi.utils.Detector.RenderingOptions;
import js.html.CanvasElement;
import pixi.textures.Texture;
import pixi.geom.Point;
import pixi.display.DisplayObject;
import pixi.display.Stage;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer  implements IRenderer {

	/**
	 * The WebGLRenderer draws the stage and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatchs.
	 * So no need for Sprite Batches or Sprite Clouds.
	 * Don't forget to add the view to your DOM or you will not see anything :)
	 *
	 * @class WebGLRenderer
	 * @constructor
	 * @param [width=0] {Float} the width of the canvas view
	 * @param [height=0] {Float} the height of the canvas view
	 * @param [options] {Object} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {Bool} If the render view is transparent, default false
	 * @param [options.antialias=false] {Bool} sets antialias (only applicable in chrome at the moment)
	 * @param [options.preserveDrawingBuffer=false] {Bool} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	 * @param [options.resolution=1] {Float} the resolution of the renderer retina would be 2
	 */
	function new(width:Float, height:Float, ?options:RenderingOptions);

	/**
     * @property type
     * @type Int
     */
	var type:Int;

	/**
     * The resolution of the renderer
     *
     * @property resolution
     * @type Float
     * @default 1
     */
	var resolution:Float;

	/**
	 * Whether the render view is transparent
	 *
	 * @property transparent
	 * @type Bool
	 */
	var transparent:Bool;

	/**
	 * The value of the preserveDrawingBuffer flag affects whether or not the contents of the stencil buffer is retained after rendering.
	 *
	 * @property preserveDrawingBuffer
	 * @type Bool
	 */
	var preserveDrawingBuffer:Bool;

	/**
     * This sets if the WebGLRenderer will clear the context texture or not before the new render pass. If true:
     * If the Stage is NOT transparent, Pixi will clear to alpha (0, 0, 0, 0).
     * If the Stage is transparent, Pixi will clear to the target Stage's background color.
     * Disable this by setting this to false. For example: if your game has a canvas filling background image, you often don't need this set.
     *
     * @property clearBeforeRender
     * @type Bool
     * @default
     */
	var clearBeforeRender:Bool;

	/**
	 * The width of the canvas view
	 *
	 * @property width
	 * @type Float
	 * @default 800
	 */
	var width:Float;

	/**
	 * The height of the canvas view
	 *
	 * @property height
	 * @type Float
	 * @default 600
	 */
	var height:Float;

	/**
	 * The canvas element that everything is drawn to
	 *
	 * @property view
	 * @type HTMLCanvasElement
	 */
	var view:CanvasElement;

	/**
     * @property contextLostBound
     * @type Function
     */
	var contextLostBound:Event -> Void;

	/**
     * @property contextRestoredBound
     * @type Function
     */
	var contextRestoredBound:Event -> Void;

	/**
     * @property projection
     * @type Point
     */
	var projection:Point;

	/**
     * @property offset
     * @type Point
     */
	var offset:Point;

	/**
     * Deals with managing the shader programs and their attribs
     * @property shaderManager
     * @type WebGLShaderManager
     */
	var shaderManager:WebGLShaderManager;

	/**
     * Manages the rendering of sprites
     * @property spriteBatch
     * @type WebGLSpriteBatch
     */
	var spriteBatch:WebGLSpriteBatch;

	/**
     * Manages the masks using the stencil buffer
     * @property maskManager
     * @type WebGLMaskManager
     */
	var maskManager:WebGLMaskManager;

	/**
     * Manages the filters
     * @property filterManager
     * @type WebGLFilterManager
     */
	var filterManager:WebGLFilterManager;

	/**
     * Manages the stencil buffer
     * @property stencilManager
     * @type WebGLStencilManager
     */
	var stencilManager:WebGLStencilManager;

	/**
     * Manages the blendModes
     * @property blendModeManager
     * @type WebGLBlendModeManager
     */
	var blendModeManager:WebGLBlendModeManager;

	/**
     * TODO remove
     * @property renderSession
     * @type Dynamic
     */
	var renderSession:Dynamic;

	/**
	* @method initContext
	*/
	function initContext():Void;

	/**
	 * Renders the stage to its webGL view
	 *
	 * @method render
	 * @param stage {Stage} the Stage element to be rendered
	 */
	function render(stage:Stage):Void;

	/**
	 * Renders a Display Object.
	 *
	 * @method renderDisplayObject
	 * @param displayObject {DisplayObject} The DisplayObject to render
	 * @param projection {Point} The projection
	 * @param buffer {Array} a standard WebGL buffer
	 */
	function renderDisplayObject(displayObject:DisplayObject, projection:Point, buffer:Array<Dynamic>):Void;

	/**
	 * resizes the webGL view to the specified width and height
	 *
	 * @method resize
	 * @param width {Float} the new width of the webGL view
	 * @param height {Float} the new height of the webGL view
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * Updates and Creates a WebGL texture for the renderers context.
	 *
	 * @method updateTexture
	 * @param texture {Texture} the texture to update
	 */
	function updateTexture(texture:Texture):Texture;

	/**
	 * Removes everything from the renderer (event listeners, spritebatch, etc...)
	 *
	 * @method destroy
	 */
	function destroy():Void;

	/**
	 * Maps Pixi blend modes to WebGL blend modes.
	 *
	 * @method mapBlendModes
	 */
	function mapBlendModes():Void;
}