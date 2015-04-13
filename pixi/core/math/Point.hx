package pixi.core.math;

@:native("PIXI.Point")
extern class Point {

	/**
	 * The Point object represents a location in a two-dimensional coordinate system, where x represents
	 * the horizontal axis and y represents the vertical axis.
	 *
	 * @class
	 * @namespace PIXI
	 * @param [x=0] {number} position of the point on the x axis
	 * @param [y=0] {number} position of the point on the y axis
	 */
	function new(?x:Float, ?y:Float);

	/**
	 * Creates a clone of this point
	 *
	 * @return {Point} a copy of the point
	 */
	function clone():Point;

	/**
	 * Sets the point to a new x and y position.
	 * If y is ommited, both x and y will be set to x.
	 *
	 * @method set
	 * @param [x=0] {Float} position of the point on the x axis
	 * @param [y=0] {Float} position of the point on the y axis
	 */
	function set(?x:Float, ?y:Float):Void;

	/**
	 * @property x
	 * @type Float
	 * @default 0
	 */
	var x:Float;

	/**
	 * @property y
	 * @type Float
	 * @default 0
	 */
	var y:Float;
}