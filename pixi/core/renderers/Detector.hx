package pixi.core.renderers;

import js.html.CanvasElement;

@:native("PIXI")
extern class Detector {

	/**
	 * @class Detector
	 */
	
	 /**
     * This helper function will automatically detect which renderer you should be using.
     * WebGL is the preferred renderer as it is a lot faster. If webGL is not supported by
     * the browser then this function will return a canvas renderer
     *
     * @memberof PIXI
     * @param width=800 {number} the width of the renderers view
     * @param height=600 {number} the height of the renderers view
     * @param [options] {object} The optional renderer parameters
     * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
     * @param [options.transparent=false] {boolean} If the render view is transparent, default false
     * @param [options.antialias=false] {boolean} sets antialias (only applicable in chrome at the moment)
     * @param [options.preserveDrawingBuffer=false] {boolean} enables drawing buffer preservation, enable this if you
     *      need to call toDataUrl on the webgl context
     * @param [options.resolution=1] {number} the resolution of the renderer, retina would be 2
     * @param [noWebGL=false] {boolean} prevents selection of WebGL renderer, even if such is present
     *
     * @return {WebGLRenderer|CanvasRenderer} Returns WebGL renderer if available, otherwise CanvasRenderer
     */
	static function autoDetectRenderer(width:Float, height:Float, ?options:RenderingOptions, noWebGL:Bool = false):Dynamic;
}

typedef RenderingOptions = {
	@:optional var backgroundColor:Int;
	@:optional var view:CanvasElement;
	@:optional var transparent:Bool;
	@:optional var autoResize:Bool;
	@:optional var resolution:Float;
	@:optional var clearBeforeRender:Bool;
	@:optional var antialias:Bool;
	@:optional var preserveDrawingBuffer:Bool;
}