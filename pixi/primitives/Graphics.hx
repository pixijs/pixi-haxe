package pixi.primitives;

import pixi.display.DisplayObjectContainer;
import pixi.core.Polygon;
import pixi.core.Ellipse;
import pixi.core.Circle;
import pixi.core.Rectangle;

@:native("PIXI.Graphics")
extern class Graphics extends DisplayObjectContainer {

	static var POLY:Int;
	static var RECT:Int;
	static var CIRC:Int;
	static var ELIP:Int;
	static var RREC:Int;

	/**
	 * The Graphics class contains a set of methods that you can use to create primitive shapes and lines.
	 * It is important to know that with the webGL renderer only simple polygons can be filled at this stage
	 * Complex polygons will not be filled. Heres an example of a complex polygon: http://www.goodboydigital.com/wp-content/uploads/2013/06/complexPolygon.png
	 *
	 * @class Graphics
	 * @extends DisplayObjectContainer
	 * @constructor
	 */
	function new():Void;

	/**
	 * The arc method creates an arc/curve (used to create circles, or parts of circles).
	 *
	 * @method arc
	 * @param cx {Float} The x-coordinate of the center of the circle
	 * @param cy {Float} The y-coordinate of the center of the circle
	 * @param radius {Float} The radius of the circle
	 * @param startAngle {Float} The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle)
	 * @param endAngle {Float} The ending angle, in radians
	 * @param anticlockwise {Bool} Optional. Specifies whether the drawing should be counterclockwise or clockwise. False is default, and indicates clockwise, while true indicates counter-clockwise.
	 * @return {Graphics}
	 */
	function arc(cx:Float, cy:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Bool):Graphics;

	/**
	 * Specifies the line style used for subsequent calls to Graphics methods such as the lineTo() method or the drawCircle() method.
	 *
	 * @method lineStyle
	 * @param lineWidth {Float} width of the line to draw, will update the object's stored style
	 * @param color {Int} color of the line to draw, will update the object's stored style
	 * @param alpha {Float} alpha of the line to draw, will update the object's stored style
	 */
	function lineStyle(lineWidth:Float, ?color:Int, ?alpha:Float):Graphics;

	/**
	 * Moves the current drawing position to (x, y).
	 *
	 * @method moveTo
	 * @param x {Float} the X coordinate to move to
	 * @param y {Float} the Y coordinate to move to
	 */
	function moveTo(x:Float, y:Float):Graphics;

	/**
	 * Draws a line using the current line style from the current drawing position to (x, y);
	 * the current drawing position is then set to (x, y).
	 *
	 * @method lineTo
	 * @param x {Float} the X coordinate to draw to
	 * @param y {Float} the Y coordinate to draw to
	 */
	function lineTo(x:Float, y:Float):Graphics;

	/**
	 * Calculate the points for a bezier curve.
	 *
	 * @method bezierCurveTo
	 * @param  {Float}   cpX    Control point x
	 * @param  {Float}   cpY    Control point y
	 * @param  {Float}   cpX2   Second Control point x
	 * @param  {Float}   cpY2   Second Control point y
	 * @param  {Float}   toX    Destination point x
	 * @param  {Float}   toY    Destination point y
	 * @return {Graphics}
	 */
	function bezierCurveTo(cpX:Float, cpY:Float, cpX2:Float, cpY2:Float, toX:Float, toY:Float):Graphics;

	/**
	 * the arcTo() method creates an arc/curve between two tangents on the canvas.
	 *
	 * "borrowed" from https://code.google.com/p/fxcanvas/ - thanks google!
	 *
	 * @method arcTo
	 * @param  {Float}   x1        The x-coordinate of the beginning of the arc
	 * @param  {Float}   y1        The y-coordinate of the beginning of the arc
	 * @param  {Float}   x2        The x-coordinate of the end of the arc
	 * @param  {Float}   y2        The y-coordinate of the end of the arc
	 * @param  {Float}   radius    The radius of the arc
	 * @return {Graphics}
	 */
	function arcTo(x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Graphics;


	/**
	 * The arc() method creates an arc/curve (used to create circles, or parts of circles).
	 *
	 * @method arc
	 * @param  {Float}   cx                The x-coordinate of the center of the circle
	 * @param  {Float}   cy                The y-coordinate of the center of the circle
	 * @param  {Float}   radius            The radius of the circle
	 * @param  {Float}   startAngle        The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle)
	 * @param  {Float}   endAngle          The ending angle, in radians
	 * @param  {Float}   anticlockwise     Optional. Specifies whether the drawing should be counterclockwise or clockwise. False is default, and indicates clockwise, while true indicates counter-clockwise.
	 * @return {Graphics}
	 */
	function quadraticCurveTo(cx:Float, cy:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Float):Graphics;

	/**
	 * Specifies a simple one-color fill that subsequent calls to other Graphics methods
	 * (such as lineTo() or drawCircle()) use when drawing.
	 *
	 * @method beginFill
	 * @param color {Int} the color of the fill
	 * @param alpha {Float} the alpha of the fill
	 * @return {Graphics}
	 */
	function beginFill(color:Int, ?alpha:Float):Graphics;

	/**
	 * Applies a fill to the lines and shapes that were added since the last call to the beginFill() method.
	 *
	 * @method endFill
	 * @return {Graphics}
	 */
	function endFill():Graphics;

	/**
	 * @method drawRect
	 *
	 * @param x {Float} The X coord of the top-left of the rectangle
	 * @param y {Float} The Y coord of the top-left of the rectangle
	 * @param width {Float} The width of the rectangle
	 * @param height {Float} The height of the rectangle
	 * @return {Graphics}
	 */
	function drawRect(x:Float, y:Float, width:Float, height:Float):Graphics;

	/**
	 * @method drawRoundedRect
	 *
	 * @param x {Float} The X coord of the top-left of the rectangle
	 * @param y {Float} The Y coord of the top-left of the rectangle
	 * @param width {Float} The width of the rectangle
	 * @param height {Float} The height of the rectangle
	 * @param radius {Float} Radius of the rectangle corners
	 * @return {Graphics}
	 */
	function drawRoundedRect(x:Float, y:Float, width:Float, height:Float, radius:Float):Graphics;

	/**
	 * Draws a circle.
	 *
	 * @method drawCircle
	 * @param x {Float} The X coordinate of the center of the circle
	 * @param y {Float} The Y coordinate of the center of the circle
	 * @param radius {Float} The radius of the circle
	 * @return {Graphics}
	 */
	function drawCircle(x:Float, y:Float, radius:Float):Graphics;

	/**
	 * Draws an ellipse.
	 *
	 * @method drawEllipse
	 * @param x {Float} The X coordinate of the center of the ellipse
	 * @param y {Float} The Y coordinate of the center of the ellipse
	 * @param width {Float} The half width of the ellipse
	 * @param height {Float} The half height of the ellipse
	 * @return {Graphics}
	 */
	function drawEllipse(x:Float, y:Float, width:Float, height:Float):Graphics;

	/**
	 * Draws a polygon using the given path.
	 *
	 * @method drawPolygon
	 * @param path {Array} The path data used to construct the polygon.
	 * @return {Graphics}
	 */
	function drawPolygon(path:Array<Float>):Graphics;

	/**
	 * Clears the graphics that were drawn to this Graphics object, and resets fill and line style settings.
	 *
	 * @method clear
	 * @return {Graphics}
	 */
	function clear():Graphics;

	/**
	 * Updates texture size based on canvas size
	 *
	 * @method updateCachedSpriteTexture
	 */
	function updateCachedSpriteTexture():Void;

	/**
	 * Destroys a previous cached sprite.
	 *
	 * @method destroyCachedSprite
	 */
	function destroyCachedSprite():Void;

	/**
	 * Update the bounds of the object
	 *
	 * @method updateBounds
	 */
	function updateBounds():Void;

	/**
	 * Draws the given shape to this Graphics object. Can be any of Circle, Rectangle, Ellipse, Line or Polygon.
	 *
	 * @method drawShape
	 * @param {Circle|Rectangle|Ellipse|Line|Polygon} shape The Shape object to draw.
	 * @return {GraphicsData} The generated GraphicsData object.
	 */
	@:overload(function(shape:Rectangle):GraphicsData {})
	@:overload(function(shape:Ellipse):GraphicsData {})
	@:overload(function(shape:Polygon):GraphicsData {})
	function drawShape(shape:Circle):GraphicsData;

	/**
	 * The alpha of the fill of this graphics object
	 */
	var fillAlpha:Float;

	/**
	 * The width of any lines drawn
	 */
	var lineWidth:Float;

	/**
	 * The color of any lines drawn
	 */
	var lineColor:String;

	/**
	 * Graphics data
	 */
	var graphicsData:Array<Dynamic>;

	/**
	 * The tint applied to the graphic shape. This is a hex value
	 */
	var tint:Float;

	/**
	 * The blend mode to be applied to the graphic shape
	 */
	var blendMode:Float;

	/**
	 * Current path
	 */
	var currentPath:Dynamic;

	/**
	 * Array containing some WebGL-related properties used by the WebGL renderer
	 */
	var webGL:Array<Dynamic>;

	/**
	 * Whether this shape is being used as a mask
	 */
	var isMask:Dynamic;

	/**
	 * the bounds' padding used for bounds calculation
	 */
	var boundsPadding:Float;

	/**
	 * Used to detect if the graphics object has changed if this is set to true then the graphics object will be recalculated
	 */
	var dirty:Dynamic;
}

@:native("PIXI.GraphicsData")
extern class GraphicsData {

	var lineWidth:Float;
	var lineColor:String;
	var lineAlpha:Float;
	var fillColor:String;
	var fillAlpha:Float;
	var fill:String;
	var shape:Dynamic;
	var type:Int;

	function new(lineWidth:Float, lineColor:String, lineAlpha:Float, fillColor:String, fillAlpha:Float, fill:String, shape:Dynamic);
}