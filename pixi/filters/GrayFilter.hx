package pixi.filters;

@:native("PIXI.GrayFilter")
extern class GrayFilter extends AbstractFilter {

	/**
	 * This greyscales the palette of your Display Objects.
	 *
	 * @class GrayFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the gray. 1 will make the object black and white, 0 will make the object its normal color
	 */
	var gray:Float;

}