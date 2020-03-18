package pixi.core.renderers.canvas.utils;

import pixi.core.renderers.webgl.Renderer;

@:native("PIXI.CanvasMaskManager")
extern class CanvasMaskManager {
	function new();

	/**
	 * This method adds it to the current stack of masks.
	 *
	 * @param maskData {object} the maskData that will be pushed
	 * @param renderer {Renderer|CanvasRenderer} The renderer context to use.
	 */
	@:overload(function(maskData:Dynamic, renderer:Renderer):Void {})
	function pushMask(maskData:Dynamic, renderer:CanvasRenderer):Void;

	/**
	 * Restores the current drawing context to the state it was before the mask was applied.
	 *
	 * @param renderer {Renderer|CanvasRenderer} The renderer context to use.
	 */
	@:overload(function(renderer:Renderer):Void {})
	function popMask(renderer:CanvasRenderer):Void;
}
