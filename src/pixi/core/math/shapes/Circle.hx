package pixi.core.math.shapes;

@:native("PIXI.Circle")
extern class Circle extends Shape {

	/**
	 * The Circle object can be used to specify a hit area for displayObjects
	 *
	 * @class Circle
	 * @constructor
	 * @param x {Float} The X coordinate of the center of this circle
	 * @param y {Float} The Y coordinate of the center of this circle
	 * @param radius {Float} The radius of the circle
	 */
	function new(x:Float, y:Float, radius:Float):Void;

	/**
	 * Creates a clone of this Circle instance
	 *
	 * @method clone
	 * @return {Circle} a copy of the circle
	 */
	function clone():Circle;

	/**
	 * Returns the framing rectangle of the circle as a PIXI.Rectangle object
	 *
	 * @method getBounds
	 * @return {Rectangle} the framing rectangle
	 */
	function getBounds():Rectangle;

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

	/**
	 * @property radius
	 * @type Float
	 * @default 0
	 */
	var radius:Float;
}