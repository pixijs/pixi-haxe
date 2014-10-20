package pixi.renderers.canvas.utils;

@:native("PIXI.CanvasMaskManager")
extern class CanvasMaskManager {

	/**
	 * A set of functions used to handle masking
	 *
	 * @class CanvasMaskManager
	 */
	function new();

	/**
	 * This method adds it to the current stack of masks
	 *
	 * @method pushMask
	 * @param maskData the maskData that will be pushed
	 * @param context {Context2D} the 2d drawing method of the canvas
	 */
	function pushMask(maskData:Dynamic, context:Dynamic):Void;

	/**
	 * Restores the current drawing context to the state it was before the mask was applied
	 *
	 * @method popMask
	 * @param context {Context2D} the 2d drawing method of the canvas
	 */
	function popMask(context:Dynamic):Void;
}