package pixi.core.math.shapes;

@:native("PIXI.Rectangle")
extern class Rectangle extends Shape {

	/**
	 * the Rectangle object is an area defined by its position, as indicated by its top-left corner point (x, y) and by its width and its height.
	 *
	 * @class Rectangle
	 * @constructor
	 * @param x {Float} The X coord of the upper-left corner of the rectangle
	 * @param y {Float} The Y coord of the upper-left corner of the rectangle
	 * @param width {Float} The overall width of this rectangle
	 * @param height {Float} The overall height of this rectangle
	 */
	function new(?x:Float, ?y:Float, ?width:Float, ?height:Float):Void;

	/**
	 * Creates a clone of this Rectangle instance
	 *
	 * @method clone
	 * @return {Rectangle} a copy of the rectangle
	 */
	function clone():Rectangle;

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
}