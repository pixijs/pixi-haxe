package pixi.filters.blur;

import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.BlurYFilter")
extern class BlurYFilter  extends Filter {

	/**
	 * TheBlurYFilter applies a vertical Gaussian blur to an object.
	 *
	 * @class
	 * @extends AbstractFilter
	 * @memberof PIXI.filters
	 */
	function new();

	/**
	 * Sets the number of passes for blur. More passes means higher quaility bluring.
	 *
	 * @member {Int}
	 * @memberof BlurYFilter#
	 * @default 1
	 */
	var passes:Int;

	/**
	 * Sets the strength of both the blur.
	 *
	 * @member {Float}
	 * @memberof BlurYFilter#
	 * @default 2
	 */
	var blur:Float;
}