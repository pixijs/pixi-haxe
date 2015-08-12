package pixi.core.renderers.canvas.utils;

import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI.CanvasMaskManager")
extern class CanvasMaskManager {

	function new();

	/**
	 * This method adds it to the current stack of masks.
	 *
	 * @param maskData {object} the maskData that will be pushed
	 * @param renderer {WebGLRenderer|CanvasRenderer} The renderer context to use.
	 */
	@:overload(function(maskData:Dynamic, renderer:WebGLRenderer):Void {})
	function pushMask(maskData:Dynamic, renderer:CanvasRenderer):Void;

	/**
	 * Restores the current drawing context to the state it was before the mask was applied.
	 *
	 * @param renderer {WebGLRenderer|CanvasRenderer} The renderer context to use.
	 */
	@:overload(function(renderer:WebGLRenderer):Void {})
	function popMask(renderer:CanvasRenderer):Void;

}