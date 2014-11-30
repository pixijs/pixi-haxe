package pixi.renderers.canvas;

import pixi.utils.Detector.RenderingOptions;
import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import pixi.display.Stage;
import pixi.renderers.canvas.utils.CanvasMaskManager;

@:native("PIXI.CanvasRenderer")
extern class CanvasRenderer {

    /**
     * The CanvasRenderer draws the Stage and all its content onto a 2d canvas. This renderer should be used for browsers that do not support webGL.
     * Don't forget to add the CanvasRenderer.view to your DOM or you will not see anything :)
     *
     * @class CanvasRenderer
     * @constructor
     * @param [width=800] {Number} the width of the canvas view
     * @param [height=600] {Number} the height of the canvas view
     * @param [options] {Object} The optional renderer parameters
     * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
     * @param [options.transparent=false] {Bool} If the render view is transparent, default false
     * @param [options.resolution=1] {Number} the resolution of the renderer retina would be 2
     * @param [options.clearBeforeRender=true] {Bool} This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
     */
	function new(width:Float, height:Float, ?options:RenderingOptions);

	/**
     * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
     * If the Stage is NOT transparent Pixi will use a canvas sized fillRect operation every frame to set the canvas background color.
     * If the Stage is transparent Pixi will use clearRect to clear the canvas every frame.
     * Disable this by setting this to false. For example if your game has a canvas filling background image you often don't need this set.
     *
     * @property clearBeforeRender
     * @type Boolean
     * @default
     */
	var clearBeforeRender:Bool;

	/**
     * Whether the render view is transparent
     *
     * @property transparent
     * @type Boolean
     */
	var transparent:Bool;

	/**
     * The width of the canvas view
     *
     * @property width
     * @type Number
     * @default 800
     */
	var width:Float;

	/**
     * The height of the canvas view
     *
     * @property height
     * @type Number
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
     * The canvas 2d context that everything is drawn with
     * @property context
     * @type HTMLCanvasElement 2d Context
     */
	var context:CanvasRenderingContext2D;

	/**
     * Instance of a PIXI.CanvasMaskManager, handles masking when using the canvas renderer
     * @property maskManager
     * @type CanvasMaskManager
     */
	var maskManager:CanvasMaskManager;

	/**
     * The render session is just a bunch of parameter used for rendering
     * @property renderSession
     * @type Object
     */
	var renderSession:Dynamic;

	/**
	 * Renders the stage to its canvas view
	 *
	 * @method render
	 * @param stage {Stage} the Stage element to be rendered
	 */
	function render(stage:Stage):Void;

	/**
	 * Resizes the canvas view to the specified width and height
	 *
	 * @method resize
	 * @param width {Number} the new width of the canvas view
	 * @param height {Number} the new height of the canvas view
	 */
	function resize(width:Float, height:Float):Void;

    /**
     * Removes everything from the renderer and optionally removes the Canvas DOM element.
     *
     * @method destroy
     * @param [removeView=true] {Bool} Removes the Canvas element from the DOM.
     */
    function destroy(?removeView:Bool = true):Void;
}