package pixi.renderers.webgl.utils;

@:native("PIXI.FilterTexture")
extern class FilterTexture {
	
	/**
	 * @class FilterTexture
	 * @constructor
	 * @param gl {WebGLContext} the current WebGL drawing context
	 * @param width {Number} the horizontal range of the filter
	 * @param height {Number} the vertical range of the filter
	 * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
	*/
	function new (gl:Dynamic, width:Float, height:Float, ?scaleMode:Float);
	
	/**
     * @property gl
     * @type WebGLContext
     */
	var gl:Dynamic;

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