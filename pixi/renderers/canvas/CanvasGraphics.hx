package pixi.renderers.canvas;

import js.html.CanvasRenderingContext2D;
import pixi.primitives.Graphics;

@:native("PIXI.CanvasGraphics")
extern class CanvasGraphics {

	/**
	 * A set of functions used by the canvas renderer to draw the primitive graphics data
	 *
	 * @class CanvasGraphics
	 */
	function new();

	/*
	 * Renders a PIXI.Graphics object to a canvas.
	 *
	 * @method renderGraphics
	 * @static
	 * @param graphics {Graphics} the actual graphics object to render
	 * @param context {CanvasRenderingContext2D} the 2d drawing method of the canvas
	 */
	static function renderGraphics(graphics:Graphics, context:CanvasRenderingContext2D):Void;

	/*
	 * Renders a graphics mask
	 *
	 * @static
	 * @private
	 * @method renderGraphicsMask
	 * @param graphics {Graphics} the graphics which will be used as a mask
	 * @param context {CanvasRenderingContext2D} the context 2d method of the canvas
	 */
	static function renderGraphicsMask(graphics:Graphics, context:CanvasRenderingContext2D):Void;
}