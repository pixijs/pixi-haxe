package phaser.pixi.renderers.canvas;

@:native("PIXI.CanvasGraphics")
extern class CanvasGraphics {
	
	/**
	 * A set of functions used by the canvas renderer to draw the primitive graphics data
	 *
	 * @class CanvasGraphics
	 */
	function new();

	/*
	 * Renders the graphics object
	 *
	 * @static
	 * @private
	 * @method renderGraphics
	 * @param graphics {Graphics} the actual graphics object to render
	 * @param context {Context2D} the 2d drawing method of the canvas
	 */
	function renderGraphics(graphics:pixi.primitives.Graphics, context:Dynamic):Void;

	/*
	 * Renders a graphics mask
	 *
	 * @static
	 * @private
	 * @method renderGraphicsMask
	 * @param graphics {Graphics} the graphics which will be used as a mask
	 * @param context {Context2D} the context 2d method of the canvas
	 */
	 function renderGraphicsMask(graphics:pixi.primitives.Graphics, context:Dynamic):Void;
}