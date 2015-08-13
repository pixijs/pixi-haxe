package pixi.core.graphics;

@:native("PIXI.GraphicsData")
extern class GraphicsData {

	/**
	 * A GraphicsData object.
	 *
	 * @class
	 * @namespace PIXI
	 */
	function new(lineWidth:Float, lineColor:Int, lineAlpha:Float, fillColor:Int, fillAlpha:Float, fill:Int, shape:Dynamic);

	var lineWidth:Float;
	var lineColor:String;
	var lineAlpha:Float;
	var fillColor:String;
	var fillAlpha:Float;
	var fill:String;
	var shape:Dynamic;
	var type:Int;

	/**
	 * Creates a new GraphicsData object with the same values as this one.
	 *
	 * @return {GraphicsData}
	 */
	function clone():GraphicsData;
}