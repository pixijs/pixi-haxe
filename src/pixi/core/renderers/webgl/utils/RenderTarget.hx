package pixi.core.renderers.webgl.utils;

import pixi.core.graphics.Graphics;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;

@:native("PIXI.RenderTarget")
extern class RenderTarget {

	/**
     * @param {WebGLRenderingContext} gl - The current WebGL drawing context
     * @param {Float} [width=0] - the horizontal range of the filter
     * @param {Float} [height=0] - the vertical range of the filter
     * @param {Int} [scaleMode=PIXI.settings.SCALE_MODE] - See {@link PIXI.SCALE_MODES} for possible values
     * @param {Float} [resolution=1] - The current resolution / device pixel ratio
     * @param {Bool} [root=false] - Whether this object is the root element or not
     */
	function new(gl:Dynamic, ?width:Float, ?height:Float, ?scaleMode:Int, ?resolution:Float, ?root:Bool);

	/**
	 * The current WebGL drawing context.
	 *
	 * @member {WebGLRenderingContext}
	 */
	var gl:Dynamic;

	/**
	 * A frame buffer
	 *
	 * @member {PIXI.glCore.GLFramebuffer}
	 */
	var frameBuffer:Dynamic;

	/**
	 * The texture
	 *
	 * @member {PIXI.glCore.GLTexture}
	 */
	var texture:Dynamic;

	/**
	 * The background colour of this render target, as an array of [r,g,b,a] values
	 *
	 * @member {Array<Int>}
	 */
	var clearColor:Array<Int>;

	/**
	 * The size of the object as a rectangle
	 *
	 * @member {PIXI.Rectangle}
	 */
	var size:Rectangle;

	/**
	 * The current resolution / device pixel ratio
	 *
	 * @member {Float}
	 * @default 1
	 */
	var resolution:Float;

	/**
	 * The projection matrix
	 *
	 * @member {PIXI.Matrix}
	 */
	var projectionMatrix:Matrix;

	/**
	 * The object's transform
	 *
	 * @member {PIXI.Matrix}
	 */
	var transform:Matrix;

	/**
	 * The frame.
	 *
	 * @member {PIXI.Rectangle}
	 */
	var frame:Rectangle;


	/**
	 * The stencil buffer stores masking data for the render target
	 *
	 * @member {glCore.GLBuffer}
	 */
	var stencilBuffer:Dynamic;

	/**
	 * The data structure for the stencil masks
	 *
	 * @member {Array<Graphics>}
	 */
	var stencilMaskStack:Array<Graphics>;

	/**
	 * Stores filter data for the render target
	 *
	 * @member {Array<Dynamic>}
	 */
	var filterData:Array<Dynamic>;

	/**
	 * The scale mode.
	 *
	 * @member {number}
	 * @default PIXI.settings.SCALE_MODE
	 * @see PIXI.SCALE_MODES
	 */
	var scaleMode:Int;

	/**
	 * Whether this object is the root element or not
	 *
	 * @member {Bool}
	 */
	var root:Bool;

	/**
     * Clears the filter texture.
     *
     * @param {Array<Int>} [clearColor=this.clearColor] - Array of [r,g,b,a] to clear the framebuffer
     */
	function clear(?clearColor:Array<Int>):Void;

	/**
     * Binds the stencil buffer.
     *
     */
	function attachStencilBuffer():Void;

	/**
     * Sets the frame of the render target.
     *
     * @param {Rectangle} destinationFrame - The destination frame.
     * @param {Rectangle} sourceFrame - The source frame.
     */
	function setFrame(destinationFrame:Rectangle, sourceFrame:Rectangle):Void;

	/**
     * Binds the buffers and initialises the viewport.
     *
     */
	function activate():Void;

	/**
     * Updates the projection matrix based on a projection frame (which is a rectangle)
     *
     * @param {Rectangle} destinationFrame - The destination frame.
     * @param {Rectangle} sourceFrame - The source frame.
     */
	function calculateProjection(destinationFrame:Rectangle, sourceFrame:Rectangle):Void;

	/**
     * Resizes the texture to the specified width and height
     *
     * @param {Float} width - the new width of the texture
     * @param {Float} height - the new height of the texture
     */
	function resize(width:Float, height:Float):Void;

	/**
     * Destroys the render target.
     *
     */
	function destroy():Void;
}