package pixi.core.graphics;

@:native("PIXI.GraphicsData")
extern class GraphicsData {

	/**
	 * A GraphicsData object.
	 *
	 * @class
	 * @memberof PIXI
	 * @param lineWidth {Float} the width of the line to draw
	 * @param lineColor {Int} the color of the line to draw
	 * @param lineAlpha {Float} the alpha of the line to draw
	 * @param fillColor {Int} the color of the fill
	 * @param fillAlpha {Float} the alpha of the fill
	 * @param fill      {Bool} whether or not the shape is filled with a colour
	 * @param shape     {Circle|Rectangle|Ellipse|Line|Polygon} The shape object to draw.
	 */
	function new(lineWidth:Float, lineColor:Int, lineAlpha:Float, fillColor:Int, fillAlpha:Float, fill:Int, shape:Dynamic);

	/*
     * @member {number} the width of the line to draw
     */
	var lineWidth:Float;

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

	/*
     * @member {Circle|Ellipse|Polygon|Rectangle|RoundedRectangle} The shape object to draw.
     */
	var shape:Dynamic;

	/*
     * @member {Int} The type of the shape, see the Const.Shapes file for all the existing types,
     */
	var type:Int;

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