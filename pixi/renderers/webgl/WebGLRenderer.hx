package pixi.renderers.webgl;

import pixi.utils.Detector.RenderingOptions;
import js.html.CanvasElement;
import pixi.textures.Texture;
import pixi.core.Point;
import pixi.display.DisplayObject;
import pixi.display.Stage;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer {

    /**
     * The WebGLRenderer draws the stage and all its content onto a webGL enabled canvas. This renderer
     * should be used for browsers that support webGL. This Render works by automatically managing webGLBatchs.
     * So no need for Sprite Batches or Sprite Clouds.
     * Don't forget to add the view to your DOM or you will not see anything :)
     *
     * @class WebGLRenderer
     * @constructor
     * @param [width=0] {Number} the width of the canvas view
     * @param [height=0] {Number} the height of the canvas view
     * @param [options] {Object} The optional renderer parameters
     * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
     * @param [options.transparent=false] {Bool} If the render view is transparent, default false
     * @param [options.antialias=false] {Bool} sets antialias (only applicable in chrome at the moment)
     * @param [options.preserveDrawingBuffer=false] {Bool} enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
     * @param [options.resolution=1] {Number} the resolution of the renderer retina would be 2
     */
	function new(width:Float, height:Float, ?options:RenderingOptions);

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
	var view:CanvasElement;

	/**
	 * Renders the stage to its webGL view
	 *
	 * @method render
	 * @param stage {Stage} the Stage element to be rendered
	 */
	function render(stage:Stage):Void;

    /**
     * Renders a Display Object.
     *
     * @method renderDisplayObject
     * @param displayObject {DisplayObject} The DisplayObject to render
     * @param projection {Point} The projection
     * @param buffer {Array} a standard WebGL buffer
     */
    function renderDisplayObject(displayObject:DisplayObject, projection:Point, buffer:Array<Dynamic>):Void;

	/**
	 * resizes the webGL view to the specified width and height
	 *
	 * @method resize
	 * @param width {Number} the new width of the webGL view
	 * @param height {Number} the new height of the webGL view
	 */
	function resize(width:Float, height:Float):Void;

    /**
     * Updates and Creates a WebGL texture for the renderers context.
     *
     * @method updateTexture
     * @param texture {Texture} the texture to update
     */
    function updateTexture(texture:Texture):Texture;

	/**
	 * Removes everything from the renderer (event listeners, spritebatch, etc...)
	 *
	 * @method destroy
	 */
	function destroy():Void;

    /**
     * Maps Pixi blend modes to WebGL blend modes.
     *
     * @method mapBlendModes
     */
    function mapBlendModes():Void;
}