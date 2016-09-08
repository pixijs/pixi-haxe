package pixi.filters.godray;

import pixi.core.math.Point;
import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.GodrayFilter")
extern class GodrayFilter extends Filter {

	/**
	 * This filter applies a twist effect making display objects appear twisted in the given direction.
	 *
	 * @class
	 * @extends Filter
	 * @memberof PIXI.filters
	 */
	function new();

	/**
     * This point describes the the offset of the twist.
     *
     * @member {Point}
     * @memberof PIXI.filters.GodrayFilter#
     */
	var offset:Point;

	/**
     * This radius of the twist.
     *
     * @member {Float}
     * @memberof PIXI.filters.GodrayFilter#
     */
	var radius:Float;

	/**
     * This angle of the twist.
     *
     * @member {Float}
     * @memberof PIXI.filters.GodrayFilter#
     */
	var angle:Float;
}