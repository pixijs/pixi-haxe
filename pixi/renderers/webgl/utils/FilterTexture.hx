package pixi.renderers.webgl.utils;

@:native("PIXI.FilterTexture")
extern class FilterTexture {

	/**
	 * @class FilterTexture
	 * @constructor
	 * @param gl {WebGLContext} the current WebGL drawing context
	 * @param width {Float} the horizontal range of the filter
	 * @param height {Float} the vertical range of the filter
	 * @param scaleMode {Int} Should be one of the PIXI.scaleMode consts
	*/
	function new(gl:Dynamic, width:Float, height:Float, ?scaleMode:Int);

	/**
     * @property gl
     * @type WebGLContext
     */
	var gl:Dynamic;

	/**
     * @property frameBuffer
     * @type Any
     */
	var frameBuffer:Dynamic;

	/**
     * @property texture
     * @type Any
     */
	var texture:Dynamic;

	/**
     * @property scaleMode
     * @type Number
     */
	var scaleMode:Float;

	/**
	 * Clears the filter texture
	 * @method clear
	 */
	function clear():Void;

	/**
	 * Resizes the texture to the specified width and height
	 *
	 * @method resize
	 * @param width {Number} the new width of the texture
	 * @param height {Number} the new height of the texture
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * Destroys the filter texture
	 * @method destroy
	 */
	function destroy():Void;
}