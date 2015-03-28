package pixi.core.math.shapes;

@:native("PIXI.Polygon")
extern class Polygon {

	/**
	 * @class Polygon
	 * @constructor
	 * @param points* {Array<Point>|Array<Number>|Point...|Number...} This can be an array of Points that form the polygon,
	 *      a flat array of numbers that will be interpreted as [x,y, x,y, ...], or the arguments passed can be
	 *      all the points of the polygon e.g. `new PIXI.Polygon(new PIXI.Point(), new PIXI.Point(), ...)`, or the
	 *      arguments passed can be flat x,y values e.g. `new PIXI.Polygon(x,y, x,y, x,y, ...)` where `x` and `y` are
	 *      Numbers.
	 */
	@:overload(function(points:Array<Float>):Void {})
	function new(points:Array<Point>):Void;

	/**
	 * Creates a clone of this polygon
	 *
	 * @method clone
	 * @return {Polygon} a copy of the polygon
	 */
	function clone():Polygon;

	/**
	 * Checks whether the x and y coordinates passed to this function are contained within this polygon
	 *
	 * @method contains
	 * @param x {Float} The X coordinate of the point to test
	 * @param y {Float} The Y coordinate of the point to test
	 * @return {Bool} Whether the x/y coordinates are within this polygon
	 */
	function contains(x:Float, y:Float):Bool;

	/**
	 * An array of the points of this polygon
	 * @property points
	 * @type Array<Point>
	 *
	 */
	var points:Array<Point>;
}