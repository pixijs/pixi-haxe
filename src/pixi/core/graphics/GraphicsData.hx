package pixi.core.graphics;

@:native("PIXI.GraphicsData")
extern class GraphicsData {

	/**
	 * A GraphicsData object.
	 *
	 * @class
	 * @memberof PIXI
	 * @param {Float} lineWidth - the width of the line to draw
     * @param {Int} lineColor - the color of the line to draw
     * @param {Float} lineAlpha - the alpha of the line to draw
     * @param {Int} fillColor - the color of the fill
     * @param {Float} fillAlpha - the alpha of the fill
     * @param {Bool} fill - whether or not the shape is filled with a colour
     * @param {Bool} nativeLines - the method for drawing lines
     * @param {Circle|Rectangle|Ellipse|Polygon} shape - The shape object to draw.
	 */
	function new(lineWidth:Float, lineColor:Int, lineAlpha:Float, fillColor:Int, fillAlpha:Float, fill:Bool, nativeLines:Bool, shape:Dynamic);

	/*
     * @member {number} the width of the line to draw
     */
	var lineWidth:Float;

	/**
	 * If true the lines will be draw using LINES instead of TRIANGLE_STRIP
	 *
	 * @member {Bool}
	 */
	var nativeLines:Bool;

	/*
     * @member {Int} the color of the line to draw
     */
	var lineColor:Int;

	/*
     * @member {Float} the alpha of the line to draw
     */
	var lineAlpha:Float;

	/*
     * @member {Int} the color of the fill
     */
	var fillColor:Int;

	/*
     * @member {Float} the alpha of the fill
     */
	var fillAlpha:Float;

	/*
     * @member {Bool} whether or not the shape is filled with a colour
     */
	var fill:Bool;

	var holes:Array<Dynamic>;

	/*
     * @member {Circle|Ellipse|Polygon|Rectangle|RoundedRectangle} The shape object to draw.
     */
	var shape:Dynamic;

	/*
     * @member {Int} The type of the shape, see the Const.Shapes file for all the existing types,
     */
	var type:Int;

	/**
     * Adds a hole to the shape.
     *
     * @param {Rectangle|Circle} shape - The shape of the hole.
     */
	function addHole(shape:Dynamic):Void;

	/**
	 * Creates a new GraphicsData object with the same values as this one.
	 *
	 * @return {GraphicsData}
	 */
	function clone():GraphicsData;

	/**
	 * Destroys the Graphics data.
	 */
	function destroy():Void;
}