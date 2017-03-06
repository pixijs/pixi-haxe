package pixi.core.math.shapes;

@:native("PIXI.RoundedRectangle")
extern class RoundedRectangle extends Shape {

	/**
	 * The Rounded Rectangle object is an area defined by its position and has nice rounded corners, as indicated by its top-left corner point (x, y) and by its width and its height.
	 *
	 * @class RoundedRectangle
	 * @constructor
	 * @param x {Number} The X coordinate of the upper-left corner of the rounded rectangle
	 * @param y {Number} The Y coordinate of the upper-left corner of the rounded rectangle
	 * @param width {Number} The overall width of this rounded rectangle
	 * @param height {Number} The overall height of this rounded rectangle
	 * @param radius {Number} The overall radius of this corners of this rounded rectangle
	 */
	function new(x:Float, y:Float, width:Float, height:Float, radius:Float):Void;

	/**
	 * Creates a clone of this Rounded Rectangle
	 *
	 * @method clone
	 * @return {RoundedRectangle} a copy of the rounded rectangle
	 */
	function clone():RoundedRectangle;

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
	 * @property width
	 * @type Float
	 * @default 0
	 */
	var width:Float;

	/**
	 * @property height
	 * @type Float
	 * @default 0
	 */
	var height:Float;

	/**
	 * @property radius
	 * @type Float
	 * @default 20
	 */
	var radius:Float;
}