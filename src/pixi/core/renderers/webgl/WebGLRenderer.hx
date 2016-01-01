package pixi.core.renderers.webgl;

import pixi.core.renderers.webgl.managers.BlendModeManager;
import pixi.core.renderers.webgl.managers.FilterManager;
import pixi.core.renderers.webgl.managers.MaskManager;
import pixi.core.renderers.Detector;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer extends SystemRenderer {

	/**
	 * The WebGLRenderer draws the scene and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatchs.
	 * So no need for Sprite Batches or Sprite Clouds.
	 * Don't forget to add the view to your DOM or you will not see anything :)
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
	 * Counter for the number of draws made each frame
	 *
	 * @member {Int}
	 */
	var drawCount:Int;

	/**
     * Deals with managing the shader programs and their attribs.
     *
     * @member {ShaderManager}
     */
	var shaderManager:Dynamic;

	/**
     * Manages the masks using the stencil buffer.
     *
     * @member {MaskManager}
     */
	var maskManager:MaskManager;

	/**
     * Manages the stencil buffer.
     *
     * @member {StencilManager}
     */
	var stencilManager:Dynamic;

	/**
     * Manages the filters.
     *
     * @member {FilterManager}
     */
	var filterManager:FilterManager;

	/**
     * Manages the blendModes
     * @member {BlendModeManager}
     */
	var blendModeManager:BlendModeManager;

	/**
     * Holds the current render target
     * @member {Object}
     */
	var currentRenderTarget:Dynamic;

	/**
     * object renderer @alvin
     * @member {ObjectRenderer}
     */
	var currentRenderer:Dynamic;
}