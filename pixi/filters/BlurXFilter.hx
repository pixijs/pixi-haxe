package pixi.filters;

@:native("PIXI.BlurXFilter")
extern class BlurXFilter extends AbstractFilter {

	/**
	 * The BlurXFilter applies a horizontal Gaussian blur to an object.
	 *
	 * @class BlurXFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * Sets the strength of both the blur. Default: 2
	 */
	var blur:Float;
}