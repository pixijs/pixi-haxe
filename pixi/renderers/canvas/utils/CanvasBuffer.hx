package pixi.renderers.canvas.utils;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;

@:native("PIXI.CanvasBuffer")
extern class CanvasBuffer {

	/**
	 * Creates a Canvas element of the given size.
	 *
	 * @class CanvasBuffer
	 * @constructor
	 * @param width {Number} the width for the newly created canvas
	 * @param height {Number} the height for the newly created canvas
	 */
	function new(width:Float, height:Float);

	/**
	 * Resizes the canvas to the specified width and height.
	 *
	 * @method resize
	 * @param width {Number} the new width of the canvas
	 * @param height {Number} the new height of the canvas
	 */
	function resize(width:Float, height:Float):Void;

	/**
     * The width of the Canvas in pixels.
     *
     * @property width
     * @type Number
     */
	var width:Float;

	/**
     * The height of the Canvas in pixels.
     *
     * @property height
     * @type Number
     */
	var height:Float;

	/**
     * The Canvas object that belongs to this CanvasBuffer.
     *
     * @property canvas
     * @type HTMLCanvasElement
     */
	var canvas:CanvasElement;

	/**
     * A CanvasRenderingContext2D object representing a two-dimensional rendering context.
     *
     * @property context
     * @type CanvasRenderingContext2D
     */
	var context:CanvasRenderingContext2D;
}