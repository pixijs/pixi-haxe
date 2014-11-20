package pixi.filters;

@:native("PIXI.TiltShiftYFilter")
extern class TiltShiftYFilter extends AbstractFilter {

	/**
	 * A TiltShiftYFilter.
	 *
	 * @class TiltShiftYFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the blur.
	 */
	var blur:Float;

	/**
	 * The Y value to end the effect at.
	 */
	var end:Float;

	/**
	 * The strength of the gradient blur.
	 */
	var gradientBlur:Float;

	/**
	 * The Y value to start the effect at.
	 */
	var start:Float;

	/**
	 * Updates the filter delta values.
	 *
	 * @method updateDelta
	 */
	function updateDelta():Void;
}