package pixi.core.renderers.canvas.utils;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;

@:native("PIXI.CanvasBuffer")
extern class CanvasBuffer {

	/**
	 * Creates a Canvas element of the given size.
	 *
	 * @class
	 * @memberof PIXI
	 * @param width {Float} the width for the newly created canvas
	 * @param height {Float} the height for the newly created canvas
	 */
	function new(width:Float, height:Float);

	/**
     * The Canvas object that belongs to this CanvasBuffer.
     *
     * @member {HTMLCanvasElement}
     */
	var canvas:CanvasElement;

	/**
	 * A CanvasRenderingContext2D object representing a two-dimensional rendering context.
	 *
	 * @member {CanvasRenderingContext2D}
	 */
	var context:CanvasRenderingContext2D;

	/**
	 * The width of the canvas buffer in pixels.
	 *
	 * @member {number}
	 * @memberof CanvasBuffer#
	 */
	var width:Float;

	/**
	 * The height of the canvas buffer in pixels.
	 *
	 * @member {number}
	 * @memberof CanvasBuffer#
	 */
	var height:Float;

	/**
	 * Resizes the canvas to the specified width and height.
	 *
	 * @param width {number} the new width of the canvas
	 * @param height {number} the new height of the canvas
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * Destroys this canvas.
	 *
	 */
	function destroy():Void;
}