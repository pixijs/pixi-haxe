package pixi.core.renderers;

import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;
import js.html.CanvasElement;

@:native("PIXI")
extern class Detector {

	/**
	 * @class Detector
	 */

	/**
	 * The CanvasRenderer draws the scene and all its content onto a 2d canvas. This renderer should be used for browsers that do not support webGL.
	 * Don't forget to add the CanvasRenderer.view to your DOM or you will not see anything :)
	 *
	 * @class
	 * @memberof PIXI
	 * @param system {string} The name of the system this renderer is for.
	 * @param [width=800] {number} the width of the canvas view
	 * @param [height=600] {number} the height of the canvas view
	 * @param [options] {object} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {boolean} If the render view is transparent, default false
	 * @param [options.autoResize=false] {boolean} If the render view is automatically resized, default false
	 * @param [options.antialias=false] {boolean} sets antialias (only applicable in chrome at the moment)
	 * @param [options.resolution=1] {number} the resolution of the renderer retina would be 2
	 * @param [options.clearBeforeRender=true] {boolean} This sets if the CanvasRenderer will clear the canvas or
	 *      not before the new render pass.
	 * @param [options.backgroundColor=0x000000] {number} The background color of the rendered area (shown if not transparent).
	 * @param [options.roundPixels=false] {boolean} If true Pixi will Math.floor() x/y values when rendering, stopping pixel interpolation.
	 */
	@:overload(function(width:Float, height:Float, ?options:RenderingOptions, ?noWebGL:Bool):CanvasRenderer {})
	static function autoDetectRenderer(width:Float, height:Float, ?options:RenderingOptions, ?noWebGL:Bool):WebGLRenderer;
}

typedef RenderingOptions = {
	@:optional var backgroundColor:Int;
	@:optional var view:CanvasElement;
	@:optional var transparent:Bool;
	@:optional var autoResize:Bool;
	@:optional var resolution:Float;
	@:optional var clearBeforeRender:Bool;
	@:optional var antialias:Bool;
	@:optional var forceFXAA:Bool;
	@:optional var preserveDrawingBuffer:Bool;
}