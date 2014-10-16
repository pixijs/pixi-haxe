package phaser.pixi.renderers.canvas;

@:native("PIXI.CanvasRenderer")
extern class CanvasRenderer {
	
	/**
	 * the CanvasRenderer draws the stage and all its content onto a 2d canvas. This renderer should be used for browsers that do not support webGL.
	 * Dont forget to add the view to your DOM or you will not see anything :)
	 *
	 * @class CanvasRenderer
	 * @constructor
	 * @param width=800 {Number} the width of the canvas view
	 * @param height=600 {Number} the height of the canvas view
	 * @param [view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [transparent=false] {Boolean} the transparency of the render view, default false
	 */
	function new (?width:Float, ?height:Float, ?view:Dynamic, ?transparent:Bool);
	
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
	var view:Dynamic;
	
	/**
     * The canvas 2d context that everything is drawn with
     * @property context
     * @type HTMLCanvasElement 2d Context
     */
	var context:Dynamic;
	
	/**
     * Instance of a PIXI.CanvasMaskManager, handles masking when using the canvas renderer
     * @property maskManager
     * @type CanvasMaskManager
     */
	var maskManager:Dynamic;
	
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
	function render(stage:Dynamic):Void;

	/**
	 * Resizes the canvas view to the specified width and height
	 *
	 * @method resize
	 * @param width {Number} the new width of the canvas view
	 * @param height {Number} the new height of the canvas view
	 */
	function resize(width:Float, height:Float):Void;
}