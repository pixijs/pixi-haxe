package pixi.core.renderers.canvas.utils;

import js.html.CanvasRenderingContext2D;
import pixi.core.graphics.Graphics;

@:native("PIXI.CanvasGraphics")
extern class CanvasGraphics {

	/*
	 * Renders a Graphics object to a canvas.
	 *
	 * @param graphics {Graphics} the actual graphics object to render
	 * @param context {CanvasRenderingContext2D} the 2d drawing method of the canvas
	 */
	static function renderGraphics(graphics:Graphics, context:CanvasRenderingContext2D):Void;
}