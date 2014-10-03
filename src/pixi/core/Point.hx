package pixi.core;

@:native("PIXI.Point")
extern class Point {

	/**
	 * The Point object represents a location in a two-dimensional coordinate system, where x represents the horizontal axis and y represents the vertical axis.
	 *
	 * @class Point
	 * @constructor
	 * @param x {Number} position of the point on the x axis
	 * @param y {Number} position of the point on the y axis
	*/
	function new(x:Float, y:Float):Void;

	/**
	 * Creates a clone of this point
	 *
	 * @method clone
	 * @return {Point} a copy of the point
	*/
	function clone():Point;

	/**
	 * Sets the point to a new x and y position.
	 * If y is ommited, both x and y will be set to x.
	 * 
	 * @method set
	 * @param [x=0] {Number} position of the point on the x axis
	 * @param [y=0] {Number} position of the point on the y axis
	*/
	function set(x:Float, y:Float):Void;
}