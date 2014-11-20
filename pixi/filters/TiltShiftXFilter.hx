package pixi.filters;

@:native("PIXI.TiltShiftXFilter")
extern class TiltShiftXFilter extends AbstractFilter {

	/**
	 * A TiltShiftXFilter.
	 *
	 * @class TiltShiftXFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the blur.
	 */
	var blur:Float;

	/**
	 * The X value to end the effect at.
	 */
	var end:Float;

	/**
	 * The strength of the gradient blur.
	 */
	var gradientBlur:Float;

	/**
	 * The X value to start the effect at.
	 */
	var start:Float;

	/**
	 * Updates the filter delta values.
	 *
	 * @method updateDelta
	 */
	function updateDelta():Void;
}