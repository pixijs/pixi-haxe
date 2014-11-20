package pixi.filters;

@:native("PIXI.SmartBlurFilter")
extern class SmartBlurFilter extends AbstractFilter {

	/**
	 * A Smart Blur Filter.
	 *
	 * @class SmartBlurFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the blur. Default: 2
	 */
	var blur:Float;
}