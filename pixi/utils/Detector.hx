package pixi.utils;

import pixi.renderers.webgl.WebGLRenderer;
import pixi.renderers.canvas.CanvasRenderer;
@:native("PIXI")
extern class Detector {

    /**
     * This helper function will automatically detect which renderer you should be using.
     * WebGL is the preferred renderer as it is a lot faster. If webGL is not supported by
     * the browser then this function will return a canvas renderer
     * @class autoDetectRenderer
     * @static
     * @param width=800 {Number} the width of the renderers view
     * @param height=600 {Number} the height of the renderers view
     *
     * @param [options] {Object} The optional renderer parameters
     * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
     * @param [options.transparent=false] {Boolean} If the render view is transparent, default false
     * @param [options.antialias=false] {Boolean} sets antialias (only applicable in chrome at the moment)
     * @param [options.preserveDrawingBuffer=false] {Boolean} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
     * @param [options.resolution=1] {Number} the resolution of the renderer retina would be 2
     *
     */
    @:overload(function(width:Float, height:Float, ?options:Dynamic):CanvasRenderer {})
	static function autoDetectRenderer(width:Float, height:Float, ?options:Dynamic):WebGLRenderer;

    /**
     * This helper function will automatically detect which renderer you should be using.
     * This function is very similar to the autoDetectRenderer function except that is will return a canvas renderer for android.
     * Even thought both android chrome supports webGL the canvas implementation perform better at the time of writing.
     * This function will likely change and update as webGL performance improves on these devices.
     *
     * @class autoDetectRecommendedRenderer
     * @static
     * @param width=800 {Number} the width of the renderers view
     * @param height=600 {Number} the height of the renderers view
     *
     * @param [options] {Object} The optional renderer parameters
     * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
     * @param [options.transparent=false] {Boolean} If the render view is transparent, default false
     * @param [options.antialias=false] {Boolean} sets antialias (only applicable in chrome at the moment)
     * @param [options.preserveDrawingBuffer=false] {Boolean} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
     * @param [options.resolution=1] {Number} the resolution of the renderer retina would be 2
     *
     */
    @:overload(function(width:Float, height:Float, ?options:Dynamic):CanvasRenderer {})
	static function autoDetectRecommendedRenderer(width:Int, height:Int, ?options:Dynamic):WebGLRenderer;
}