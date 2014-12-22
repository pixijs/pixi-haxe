package pixi.filters;

@:native("PIXI.BlurFilter")
extern class BlurFilter extends AbstractFilter {

	/**
	 * The BlurFilter applies a Gaussian blur to an object.
	 * The strength of the blur can be set for x- and y-axis separately (always relative to the stage).
	 *
	 * @class BlurFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * Sets the strength of both the blurX and blurY properties simultaneously
	 */
	var blur:Float;

	/**
	 * Sets the strength of the blurX property
	 */
	var blurX:Float;

	/**
	 * Sets the strength of the blurX property
	 */
	var blurY:Float;

}