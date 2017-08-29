package pixi.core.renderers.canvas.utils;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;

@:native("CanvasRenderTarget")
extern class CanvasRenderTarget {

	/**
	 * Creates a Canvas element of the given size.
	 *
	 * @class
	 * @memberof PIXI
	 * @param width {number} the width for the newly created canvas
	 * @param height {number} the height for the newly created canvas
	 * @param [resolution=1] The resolution / device pixel ratio of the canvas
	 */
	function new(width:Float, height:Float, ?resolution:Float);

	/**
     * The Canvas object that belongs to this to this CanvasRenderTarget.
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
	 * @member {Float}
	 * @memberof CanvasRenderTarget#
	 */
	var width:Float;

	/**
	 * The height of the canvas buffer in pixels.
	 *
	 * @member {Float}
	 * @memberof CanvasRenderTarget#
	 */
	var height:Float;

	/**
	 * The resolution of this CanvasRenderTarget.
	 *
	 * @member {Float}
	 * @memberof CanvasRenderTarget#
	 */
	var resolution:Float;

	/**
	 * Resizes the canvas to the specified width and height.
	 *
	 * @param width {Float} the new width of the canvas
	 * @param height {Float} the new height of the canvas
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * Destroys this canvas.
	 *
	 */
	function destroy():Void;
}