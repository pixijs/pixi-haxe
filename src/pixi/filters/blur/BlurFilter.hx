package pixi.filters.blur;

import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.BlurFilter")
extern class BlurFilter extends Filter {

	/**
	 * The BlurFilter applies a Gaussian blur to an object.
	 * The strength of the blur can be set for x- and y-axis separately.
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
     * Sets the strength of both the blurX and blurY properties simultaneously
     *
     * @member {Float}
     * @memberOf BlurFilter#
     * @default 2
     */
	var blur:Float;

	/**
     * Sets the strength of the blurX property
     *
     * @member {Float}
     * @memberOf BlurFilter#
     * @default 2
     */
	var blurX:Float;

	/**
     * Sets the strength of the blurY property
     *
     * @member {Float}
     * @memberOf BlurFilter#
     * @default 2
     */
	var blurY:Float;
}