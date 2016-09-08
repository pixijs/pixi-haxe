package pixi.filters.blur;

import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.BlurXFilter")
extern class BlurXFilter extends Filter {

	/**
	 * The BlurXFilter applies a horizontal Gaussian blur to an object.
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
	 * @memberof BlurXFilter#
	 * @default 1
	 */
	var passes:Int;

	/**
	 * Sets the strength for blur.
	 *
	 * @member {Float}
	 * @memberof BlurYFilter#
	 * @default 4
	 */
	var strendth:Float;

	/**
	 * Sets the strength of both the blur.
	 *
	 * @member {Float}
	 * @memberof BlurXFilter#
	 * @default 2
	 */
	var blur:Float;
}