package pixi.utils;

import js.html.Element;
import pixi.renderers.webgl.WebGLRenderer;
import pixi.renderers.canvas.CanvasRenderer;

@:native("PIXI")
extern class Detector {

	/**
	 * @class Detector
	 */

	/**
	 * This helper function will automatically detect which renderer you should be using.
	 * WebGL is the preferred renderer as it is a lot faster. If webGL is not supported by
	 * the browser then this function will return a canvas renderer
	 * @static
	 * @method autoDetectRenderer
	 * @param width=800 {Float} the width of the renderers view
	 * @param height=600 {Float} the height of the renderers view
	 * @param [options] {RenderingOptions} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {Bool} If the render view is transparent, default false
	 * @param [options.antialias=false] {Bool} sets antialias (only applicable in chrome at the moment)
	 * @param [options.preserveDrawingBuffer=false] {Bool} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	* @param [options.resolution=1] {Float} the resolution of the renderer retina would be 2
	 * @return CanvasRenderer|WebGLRenderer
	 */
	@:overload(function(width:Float, height:Float, ?options:RenderingOptions):CanvasRenderer {})
	static function autoDetectRenderer(width:Float, height:Float, ?options:RenderingOptions):WebGLRenderer;

	/**
	 * This helper function will automatically detect which renderer you should be using.
	 * This function is very similar to the autoDetectRenderer function except that is will return a canvas renderer for android.
	 * Even thought both android chrome supports webGL the canvas implementation perform better at the time of writing.
	 * This function will likely change and update as webGL performance improves on these devices.
	 *
	 * @static
	 * @method autoDetectRecommendedRenderer
	 * @param width=800 {Float} the width of the renderers view
	 * @param height=600 {Float} the height of the renderers view
	 * @param [options] {RenderingOptions} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {Bool} If the render view is transparent, default false
	 * @param [options.antialias=false] {Bool} sets antialias (only applicable in chrome at the moment)
	 * @param [options.preserveDrawingBuffer=false] {Bool} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	 * @param [options.resolution=1] {Float} the resolution of the renderer retina would be 2
	 * @return CanvasRenderer|WebGLRenderer
	 */
	@:overload(function(width:Float, height:Float, ?options:RenderingOptions):WebGLRenderer {})
	static function autoDetectRecommendedRenderer(width:Float, height:Float, ?options:RenderingOptions):CanvasRenderer;
}

typedef RenderingOptions = {
	@:optional var view:Element;
	@:optional var transparent:Bool;
	@:optional var resolution:Float;

	/**
	 * canvas specific
	 */
	@:optional var clearBeforeRender:Bool;

	/**
	 * webgl specific
	 */
	@:optional var antialias:Bool;
	@:optional var preserveDrawingBuffer:Bool;
}