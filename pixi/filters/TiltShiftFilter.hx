package pixi.filters;

@:native("PIXI.TiltShiftFilter")
extern class TiltShiftFilter extends AbstractFilter {

	/**
	 * A TiltShift Filter. Manages the pass of both a TiltShiftXFilter and TiltShiftYFilter.
	 *
	 * @class TiltShiftFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the blur.
	 */
	var blur:Float;

	/**
	 * The X and Y value to end the effect at.
	 */
	var end:Float;

	/**
	 * The strength of the gradient blur.
	 */
	var gradientBlur:Float;

	/**
	 * The X and Y value to start the effect at.
	 */
	var start:Float;
}