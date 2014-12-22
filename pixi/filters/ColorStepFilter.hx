package pixi.filters;

@:native("PIXI.ColorStepFilter")
extern class ColorStepFilter extends AbstractFilter {

	/**
	 * This lowers the color depth of your image by the given amount, producing an image with a smaller palette.
	 *
	 * @class ColorStepFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The number of steps to reduce the palette by.
	 */
	var step:Int;
}