package pixi.core.math.shapes;

@:native("PIXI.Ellipse")
extern class Ellipse extends Shape {

	/**
	 * The Ellipse object can be used to specify a hit area for displayObjects
	 *
	 * @class Ellipse
	 * @constructor
	 * @param x {Float} The X coordinate of the center of the ellipse
	 * @param y {Float} The Y coordinate of the center of the ellipse
	 * @param width {Float} The half width of this ellipse
	 * @param height {Float} The half height of this ellipse
	*/
	function new(x:Float, y:Float, width:Float, height:Float):Void;

	/**
	 * Creates a clone of this Ellipse instance
	 *
	 * @method clone
	 * @return {Ellipse} a copy of the ellipse
	*/
	function clone():Ellipse;

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