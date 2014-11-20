package pixi.filters;

@:native("PIXI.InvertFilter")
extern class InvertFilter extends AbstractFilter {

	/**
	 * This inverts your Display Objects colors.
	 *
	 * @class InvertFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the invert. 1 will fully invert the colors, 0 will make the object its normal color
	 */
	var invert:Float;

}