package pixi.filters;

@:native("PIXI.CrossHatchFilter")
extern class CrossHatchFilter extends AbstractFilter {

	/**
	 * A Cross Hatch effect filter.
	 *
	 * @class CrossHatchFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * Sets the strength of both the blur. Default: 2
	 */
	var blur:Float;
}