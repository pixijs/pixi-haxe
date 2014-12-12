package pixi.filters;

import pixi.geom.Point;

@:native("PIXI.TwistFilter")
extern class TwistFilter extends AbstractFilter {

	/**
	 * This filter applies a twist effect making display objects appear twisted in the given direction.
	 *
	 * @class TwistFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * This point describes the the offset of the twist.
	 */
	var offset:Point;

	/**
	 * The angle of the twist.
	 */
	var angle:Float;

	/**
	 * The radius of the twist.
	 */
	var radius:Float;

}