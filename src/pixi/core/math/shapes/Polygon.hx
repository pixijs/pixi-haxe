package pixi.core.math.shapes;

import haxe.extern.EitherType;
@:native("PIXI.Polygon")
extern class Polygon extends Shape{

	/**
     * @param {PIXI.Point[]|number[]} points - This can be an array of Points
     *  that form the polygon, a flat array of numbers that will be interpreted as [x,y, x,y, ...], or
     *  the arguments passed can be all the points of the polygon e.g.
     *  `new PIXI.Polygon(new PIXI.Point(), new PIXI.Point(), ...)`, or the arguments passed can be flat
     *  x,y values e.g. `new Polygon(x,y, x,y, x,y, ...)` where `x` and `y` are Numbers.
     */
	function new(points:EitherType<Array<Point>, Array<Float>>):Void;

	/**
	 * Creates a clone of this polygon
	 *
	 * @method clone
	 * @return {Polygon} a copy of the polygon
	 */
	function clone():Polygon;

	/**
	 * An array of the points of this polygon
	 * @property points
	 * @type Array<Float>
	 *
	 */
	var points:Array<Float>;
}