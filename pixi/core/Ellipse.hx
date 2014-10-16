package pixi.core;

@:native("PIXI.Ellipse")
extern class Ellipse {

	/**
	 * The Ellipse object can be used to specify a hit area for displayObjects
	 *
	 * @class Ellipse
	 * @constructor
	 * @param x {Number} The X coordinate of the center of the ellipse
	 * @param y {Number} The Y coordinate of the center of the ellipse
	 * @param width {Number} The half width of this ellipse
	 * @param height {Number} The half height of this ellipse
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
	 * Checks whether the x and y coordinates passed to this function are contained within this ellipse
	 *
	 * @method contains
	 * @param x {Number} The X coordinate of the point to test
	 * @param y {Number} The Y coordinate of the point to test
	 * @return {Boolean} Whether the x/y coords are within this ellipse
	*/
	function contains(x:Float, y:Float):Bool;

	/**
	 * Returns the framing rectangle of the circle as a PIXI.Rectangle object
	 * 
	 * @method getBounds
	 * @return {Rectangle} the framing rectangle
	*/
	function getBounds():Rectangle;

	/**
     * @property x
     * @type Number
     * @default 0
     */
    var x:Float;

    /**
     * @property y
     * @type Number
     * @default 0
     */
    var y:Float;

    /**
     * @property width
     * @type Number
     * @default 0
     */
    var width:Float;

    /**
     * @property height
     * @type Number
     * @default 0
     */
    var height:Float;
}