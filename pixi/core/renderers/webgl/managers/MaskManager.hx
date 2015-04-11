package pixi.core.renderers.webgl.managers;

extern class MaskManager extends WebGLManager {

	/**
	 * @class
	 * @memberof PIXI
	 * @param renderer {WebGLRenderer} The renderer this manager works for.
	 */
	function new(renderer:WebGLRenderer);

	/**
	 * Applies the Mask and adds it to the current filter stack.
	 *
	 * @param graphics {Graphics}
	 * @param webGLData {any[]}
	 */
	function pushMask(target:Dynamic, maskData:Dynamic):Void;

	/**
	 * Removes the last mask from the mask stack and doesn't return it.
	 *
	 * @param target {RenderTarget}
	 * @param maskData {any[]}
	 */
	function popMask(target:Dynamic, maskData:Dynamic):Void;

	/**
	 * Applies the Mask and adds it to the current filter stack.
	 *
	 * @param target {RenderTarget}
	 * @param maskData {any[]}
	 */
	function pushSpriteMask(target:Dynamic, maskData:Dynamic):Void;

	/**
	 * Removes the last filter from the filter stack and doesn't return it.
	 *
	 */
	function popSpriteMask():Void;

	/**
	 * Applies the Mask and adds it to the current filter stack.
	 *
	 * @param target {RenderTarget}
	 * @param maskData {any[]}
	 */
	function pushStencilMask(target:Dynamic, maskData:Dynamic):Void;

	/**
	 * Removes the last filter from the filter stack and doesn't return it.
	 * @param target {RenderTarget}
	 * @param maskData {any[]}
	 */
	function popStencilMask(target:Dynamic, maskData:Dynamic):Void;
}