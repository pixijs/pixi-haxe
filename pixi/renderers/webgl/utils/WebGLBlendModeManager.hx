package pixi.renderers.webgl.utils;

@:native("PIXI.WebGLBlendModeManager")
extern class WebGLBlendModeManager {

	/**
	 * @class WebGLMaskManager
	 * @constructor
	*/
	function new();

	/**
	 * Sets the WebGL Context.
	 *
	 * @method setContext
	 * @param gl {WebGLContext} the current WebGL drawing context
	 */
	function setContext(gl:Dynamic):Void;

	/**
	 * Sets-up the given blendMode from WebGL's point of view
	 * @method setBlendMode
	 *
	 * @param blendMode {Number} the blendMode, should be a Pixi const, such as PIXI.BlendModes.ADD
	 */
	function setBlendMode(blendMode:Float):Void;

	/**
	* Destroys this object.
	*
	* @method destroy
	*/
	function destroy():Void;
}