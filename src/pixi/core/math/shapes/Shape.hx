package pixi.core.math.shapes;

@:native("PIXI.SHAPES")
extern enum ShapeType
{
	POLY;
    RECT;
    CIRC;
    ELIP;
    RREC;
}

extern class Shape 
{
	/**
	 * Defines the type of the shape to avoid instanceof (Std.is) checks
	 */
	var type:ShapeType;

	/**
	 * Checks whether the x and y coordinates passed to this function are contained within this Shape
	 *
	 * @method contains
	 * @param x {Float} The X coordinate of the point to test
	 * @param y {Float} The Y coordinate of the point to test
	 * @return {Bool} Whether the x/y coords are within this Rectangle
	 */
	function contains(x:Float, y:Float):Bool;

}