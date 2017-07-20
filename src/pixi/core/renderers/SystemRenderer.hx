package pixi.core.renderers;

import pixi.core.Pixi.RendererType;
import pixi.core.display.Transform;
import pixi.core.textures.RenderTexture;
import pixi.core.textures.Texture;
import haxe.extern.EitherType;
import pixi.interaction.EventEmitter;
import pixi.core.display.DisplayObject;
import js.html.CanvasElement;

@:native("PIXI.SystemRenderer")
extern class SystemRenderer extends EventEmitter {

	/**
	 * @class
	 * @memberof PIXI
	 * @param system {String} The name of the system this renderer is for.
	 * @param [width=800] {Float} the width of the canvas view
	 * @param [height=600] {Float} the height of the canvas view
	 * @param [options] {RenderingOptions} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {Bool} If the render view is transparent, default false
	 * @param [options.autoResize=false] {Bool} If the render view is automatically resized, default false
	 * @param [options.antialias=false] {Bool} sets antialias (only applicable in chrome at the moment)
	 * @param [options.resolution=1] {Float} the resolution of the renderer retina would be 2
	 * @param [options.clearBeforeRender=true] {Bool} This sets if the CanvasRenderer will clear the canvas or
	 *      not before the new render pass.
	 * @param [options.backgroundColor=0x000000] {Int} The background color of the rendered area (shown if not transparent).
	 * @param [options.roundPixels=false] {Bool} If true Pixi will Math.floor() x/y values when rendering, stopping pixel interpolation.
	 * @param {Bool} [options.legacy=false] - If true Pixi will aim to ensure compatibility with older / less advanced devices.
	 *      If you experience unexplained flickering try setting this to true.
	 */
	function new(system:String, ?width:Float = 800, ?height:Float = 600, ?options:RenderOptions);

	/**
	 * The type of the renderer.
	 *
	 * @member {CONST.RENDERER_TYPE}
	 * @default CONT.RENDERER_TYPE.UNKNOWN
	 */
	var type:RendererType;

	/**
	 * The width of the canvas view
	 *
	 * @member {Float}
	 * @default 800
	 */
	var width:Float;

	/**
	 * The height of the canvas view
	 *
	 * @member {Float}
	 * @default 600
	 */
	var height:Float;

	/**
	 * The canvas element that everything is drawn to
	 *
	 * @member {CanvasElement}
	 */
	var view:CanvasElement;

	/**
	 * The resolution of the renderer
	 *
	 * @member {Float}
	 * @default 1
	 */
	var resolution:Float;

	/**
	 * Whether the render view is transparent
	 *
	 * @member {Bool}
	 */
	var transparent:Bool;

	/**
	 * Whether the render view should be resized automatically
	 *
	 * @member {Bool}
	 */
	var autoResize:Bool;

	/**
	 * Tracks the blend modes useful for this renderer.
	 *
	 * @member {object<string, mixed>}
	 */
	var blendModes:Dynamic;

	/**
	 * The value of the preserveDrawingBuffer flag affects whether or not the contents of the stencil buffer is retained after rendering.
	 *
	 * @member {Bool}
	 */
	var preserveDrawingBuffer:Bool;

	/**
	 * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
	 * If the scene is NOT transparent Pixi will use a canvas sized fillRect operation every frame to set the canvas background color.
	 * If the scene is transparent Pixi will use clearRect to clear the canvas every frame.
	 * Disable this by setting this to false. For example if your game has a canvas filling background image you often don't need this set.
	 *
	 * @member {Bool}
	 * @default
	 */
	var clearBeforeRender:Bool;

	/**
	 * The background color to fill if not transparent
	 *
	 * @member {String|Int}
	 * @default 0x000000
	 */
	var backgroundColor:EitherType<String, Int>;

	/**
     * If true Pixi will Math.floor() x/y values when rendering, stopping pixel interpolation.
     * Handy for crisp pixel art and speed on legacy devices.
     *
     * @member {Bool}
     */
	var roundPixels:Bool;

	/**
	 * Plugins object
	 */
	var plugins:RendererPlugins;

	/**
	 * Resizes the canvas view to the specified width and height
	 *
	 * @param width {Float} the new width of the canvas view
	 * @param height {Float} the new height of the canvas view
	 */
	function resize(width:Float, height:Float):Void;

	/**
     * Useful function that returns a texture of the display object that can then be used to create sprites
     * This can be quite useful if your displayObject is complicated and needs to be reused multiple times.
     *
     * @param {PIXI.DisplayObject} displayObject - The displayObject the object will be generated from
     * @param {Int} scaleMode - Should be one of the scaleMode consts
     * @param {Float} resolution - The resolution / device pixel ratio of the texture being generated
     * @return {PIXI.Texture} a texture of the graphics object
     */
	function generateTexture(displayObject:DisplayObject, scaleMode:Int, resolution:Float):Texture;


	/**
	 * Removes everything from the renderer and optionally removes the Canvas DOM element.
	 *
	 * @param [removeView=false] {Bool} Removes the Canvas element from the DOM.
	 */
	function destroy(?removeView:Bool = false):Void;

	/**
     * Renders the object to this canvas view
     *
     * @param {PIXI.DisplayObject} displayObject - The object to be rendered
     * @param {PIXI.RenderTexture} [renderTexture] - A render texture to be rendered to.
     *  If unset, it will render to the root context.
     * @param {boolean} [clear=false] - Whether to clear the canvas before drawing
     * @param {PIXI.Transform} [transform] - A transformation to be applied
     * @param {boolean} [skipUpdateTransform=false] - Whether to skip the update transform
     */
	function render(displayObject:DisplayObject, ?renderTexture:RenderTexture, ?clear:Bool, ?transform:Transform, ?skipUpdateTransform:Bool):Void;
}