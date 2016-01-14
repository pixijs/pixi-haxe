package pixi.core.renderers.canvas;

import js.html.CanvasRenderingContext2D;
import pixi.core.renderers.Detector;

@:native("PIXI.CanvasRenderer")
extern class CanvasRenderer extends SystemRenderer {

	/**
	 * The CanvasRenderer draws the scene and all its content onto a 2d canvas. This renderer should be used for browsers that do not support webGL.
	 * Don't forget to add the CanvasRenderer.view to your DOM or you will not see anything :)
	 *
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
	 */
	function new(width:Float, height:Float, ?options:RenderingOptions);

	/**
	 * The canvas 2d context that everything is drawn with.
	 *
	 * @member {CanvasRenderingContext2D}
	 */
	var context:CanvasRenderingContext2D;

	/**
	 * Boolean flag controlling canvas refresh.
	 *
	 * @member {Bool}
	 */
	var refresh:Bool;

	/**
	 * Instance of a CanvasMaskManager, handles masking when using the canvas renderer.
	 *
	 * @member {CanvasMaskManager}
	 */
	var maskManager:Dynamic;

	/**
	 * Tracks the active scale mode for this renderer.
	 *
	 * @member {SCALE_MODE}
	 */
	var currentScaleMode:Int;

	/**
	 * Tracks the active blend mode for this renderer.
	 *
	 * @member {BLEND_MODES}
	 */
	var currentBlendMode:Int;

	/**
	 * The canvas property used to set the canvas smoothing property.
	 *
	 * @member {String}
	 */
	var smoothProperty:String;
}