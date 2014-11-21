package pixi.renderers.webgl.utils;

import pixi.primitives.Graphics;
@:native("PIXI.WebGLStencilManager")
extern class WebGLStencilManager {

	/**
	 * @class WebGLStencilManager
	 */
	function new();

	/**
	* @method setContext
	* @param gl {WebGLContext} the current WebGL drawing context
	*/
	function setContext(gl:Dynamic):Void;

	/**
	* Applies the Mask and adds it to the current filter stack.
	*
	* @method pushStencil
	* @param graphics {Graphics}
	* @param webGLData {Array}
	* @param renderSession {Object}
	*/
	function pushStencil(graphics:Graphics, webGLData:Array<Dynamic>, renderSession:Dynamic):Void;

	/**
	 * @method popStencil
	 * @param graphics {Graphics}
	 * @param webGLData {Array}
	 * @param renderSession {Object}
	 */
	function popStencil(graphics:Graphics, webGLData:Array<Dynamic>, renderSession:Dynamic):Void;

	/**
	 * TODO this does not belong here!
	 *
	 * @method bindGraphics
	 * @param graphics {Graphics}
	 * @param webGLData {Array}
	 * @param renderSession {Object}
	 */
	function bindGraphics(graphics:Graphics, webGLData:Array<Dynamic>, renderSession:Dynamic):Void;

	/**
	* Destroys this object.
	*
	* @method destroy
	*/
	function destroy():Void;

}