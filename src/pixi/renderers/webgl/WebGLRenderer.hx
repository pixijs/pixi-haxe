package phaser.pixi.renderers.webgl;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer {
	
	/**
	 * the WebGLRenderer draws the stage and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatch's.
	 * So no need for Sprite Batch's or Sprite Cloud's
	 * Dont forget to add the view to your DOM or you will not see anything :)
	 *
	 * @class WebGLRenderer
	 * @constructor
	 * @param width=0 {Number} the width of the canvas view
	 * @param height=0 {Number} the height of the canvas view
	 * @param view {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param transparent=false {Boolean} If the render view is transparent, default false
	 * @param antialias=false {Boolean} sets antialias (only applicable in chrome at the moment)
	 * @param preserveDrawingBuffer=false {Boolean} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	 *
	 */
	function new(?width:Float, ?height:Float, ?view:Dynamic, ?transparent:Bool, ?antialias:Bool, ?preserveDrawingBuffer:Bool);
	
	/**
     * Whether the render view is transparent
     *
     * @property transparent
     * @type Boolean
     */
	var transparent:Bool;
	
	/**
     * The value of the preserveDrawingBuffer flag affects whether or not the contents of the stencil buffer is retained after rendering.
     *
     * @property preserveDrawingBuffer
     * @type Boolean
     */
	var preserveDrawingBuffer:Bool;
	
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
	 * Renders the stage to its webGL view
	 *
	 * @method render
	 * @param stage {Stage} the Stage element to be rendered
	 */
	function render(stage:Dynamic):Void;

	/**
	 * resizes the webGL view to the specified width and height
	 *
	 * @method resize
	 * @param width {Number} the new width of the webGL view
	 * @param height {Number} the new height of the webGL view
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * Removes everything from the renderer (event listeners, spritebatch, etc...)
	 *
	 * @method destroy
	 */
	function destroy():Void;
}