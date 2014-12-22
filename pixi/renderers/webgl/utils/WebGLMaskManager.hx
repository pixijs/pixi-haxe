package pixi.renderers.webgl.utils;

@:native("PIXI.WebGLMaskManager")
extern class WebGLMaskManager {

	/**
	 * @class WebGLMaskManager
	 */
	function new();

	/**
	* @method setContext
	* @param gl {WebGLContext} the current WebGL drawing context
	*/
	function setContext(gl:Dynamic):Void;

	/**
	* Removes the last filter from the filter stack and doesn't return it.
	*
	* @method popMask
	* @param maskData {Array}
	* @param renderSession {Object} an object containing all the useful parameters
	*/
	function popMask(maskData:Array<Dynamic>, renderSession:Dynamic):Void;

	/**
	* Applies the Mask and adds it to the current filter stack.
	*
	* @method pushMask
	* @param maskData {Array}
	* @param renderSession {Object}
	*/
	function pushMask(maskData:Array<Dynamic>, renderSession:Dynamic):Void;

	/**
	* Destroys this object.
	*
	* @method destroy
	*/
	function destroy():Void;
}