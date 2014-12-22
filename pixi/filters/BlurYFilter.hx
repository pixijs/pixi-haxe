package pixi.filters;

@:native("PIXI.BlurYFilter")
extern class BlurYFilter extends AbstractFilter {

	/**
	 * The BlurYFilter applies a vertical Gaussian blur to an object.
	 *
	 * @class BlurYFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * Sets the strength of both the blur. Default: 2
	 */
	var blur:Float;
}