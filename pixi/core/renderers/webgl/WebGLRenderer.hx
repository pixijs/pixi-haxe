package pixi.core.renderers.webgl;

import pixi.core.renderers.Detector;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer extends SystemRenderer {

	/**
	 * The WebGLRenderer draws the scene and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatchs.
	 * So no need for Sprite Batches or Sprite Clouds.
	 * Don't forget to add the view to your DOM or you will not see anything :)
	 *
	 * @class
	 * @namespace PIXI
	 * @param [width=0] {number} the width of the canvas view
	 * @param [height=0] {number} the height of the canvas view
	 * @param [options] {object} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {boolean} If the render view is transparent, default false
	 * @param [options.autoResize=false] {boolean} If the render view is automatically resized, default false
	 * @param [options.antialias=false] {boolean} sets antialias (only applicable in chrome at the moment)
	 * @param [options.resolution=1] {number} the resolution of the renderer retina would be 2
	 * @param [options.clearBeforeRender=true] {boolean} This sets if the CanvasRenderer will clear the canvas or
	 *      not before the new render pass.
	 * @param [options.preserveDrawingBuffer=false] {boolean} enables drawing buffer preservation, enable this if
	 *      you need to call toDataUrl on the webgl context.
	 */
	function new(width:Float, height:Float, ?options:RenderingOptions);

	/**
     * Counter for the number of draws made each frame
     *
     * @member {Int}
     */
	var drawCount:Int;
}