package pixi.filters.color;

import pixi.core.renderers.webgl.filters.AbstractFilter;

@:native("PIXI.filters.ColorStepFilter")
extern class ColorStepFilter extends AbstractFilter {

	/**
	 * This lowers the color depth of your image by the given amount, producing an image with a smaller palette.
	 *
	 * @class
	 * @extends AbstractFilter
	 * @memberof PIXI.filters
	 */
	function new();

	/**
     * The number of steps to reduce the palette by.
     *
     * @member {Int}
     * @memberof ColorStepFilter#
     */
	var step:Int;
}