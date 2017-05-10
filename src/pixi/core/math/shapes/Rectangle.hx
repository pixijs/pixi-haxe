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
	 * Copies another Rectangle to this one.
	 *
	 * @param  rectangle {Rectangle} The rectangle to copy
	 * @return {Rectangle} Returns itself.
	 */
	function copy(rectangle:Rectangle):Rectangle;

	/**
	 * Checks whether the x and y coordinates given are contained within the rectangle.
	 *
	 * @param  x {Float} x coordinate of the point to test.
	 * @param  y {Float} y coordinate of the point to test.
	 * @return {Bool} whether the x and y coordinates are within this Rectangle.
	 */
	override function contains(x:Float, y:Float):Bool;

	/**
	 * Pads this rectangle, making it grow in all directions.
	 *
	 * @param  padX {Float} The horizontal padding amount.
	 * @param  padY {Float} The vertical padding amount.
	 */
	function pad(padX:Float, padY:Float):Void;

	/**
	 * Fits this rectangle around the passed one.
	 *
	 * @param  rectangle {Rectangle} The rectangle to fit.
	 */
	function fit(rectangle:Rectangle):Void;

	/**
	 * Enlarges this rectangle to fit around the passed one.
	 *
	 * @param  rectangle {Rectangle} The rectangle to include.
	 */
	function enlarge(rectangle:Rectangle):Void;

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
	 * @property left
	 * @type Float
	 * @default 0
	 */
	var left:Float;

	/**
	 * @property right
	 * @type Float
	 * @default 0
	 */
	var right:Float;

	/**
	 * @property top
	 * @type Float
	 * @default 0
	 */
	var top:Float;

	/**
	 * @property bottom
	 * @type Float
	 * @default 0
	 */
	var bottom:Float;
}