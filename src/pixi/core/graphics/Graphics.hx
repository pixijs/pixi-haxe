package pixi.core.graphics;

import pixi.core.Pixi.BlendModes;
import pixi.core.textures.Texture;
import pixi.core.math.Point;
import pixi.core.math.shapes.Polygon;
import pixi.core.math.shapes.Ellipse;
import pixi.core.math.shapes.Rectangle;
import pixi.core.math.shapes.Circle;
import pixi.core.display.Container;

@:native("PIXI.Graphics")
extern class Graphics extends Container {

	/**
	 * The Graphics class contains methods used to draw primitive shapes such as lines, circles and
	 * rectangles to the display, and color and fill them.
	 *
	 * @param {Bool} [nativeLines=false] - If true the lines will be draw using LINES instead of TRIANGLE_STRIP
	 *
	 * @class
	 * @extends Container
	 * @namespace PIXI
	 */
	function new(?nativeLines:Bool = false);

	/**
	 * The alpha value used when filling the Graphics object.
	 *
	 * @member {Float}
	 * @default 1
	 */
	var fillAlpha:Float;

	/**
	 * The width (thickness) of any lines drawn.
	 *
	 * @member {Float}
	 * @default 0
	 */
	var lineWidth:Float;

	/**
	 * If true the lines will be draw using LINES instead of TRIANGLE_STRIP
	 *
	 * @member {Bool}
	 */
	var nativeLines:Bool;

	/**
	 * The color of any lines drawn.
	 *
	 * @member {Int}
	 * @default 0
	 */
	var lineColor:Int;

	/**
     * Graphics data
     *
     * @member {Array<GraphicsData>}
     */
	var graphicsData:Array<GraphicsData>;

	/**
	 * The tint applied to the graphic shape. This is a hex value. Apply a value of 0xFFFFFF to reset the tint.
	 *
	 * @member {Int}
	 * @default 0xFFFFFF
	 */
	var tint:Int;

	/**
	 * The blend mode to be applied to the graphic shape. Apply a value of blendModes.NORMAL to reset the blend mode.
	 *
	 * @member {Int}
	 * @default CONST.BLEND_MODES.NORMAL;
	 */
	var blendMode:BlendModes;

	/**
	 * Whether this shape is being used as a mask.
	 *
	 * @member {Bool}
	 */
	var isMask:Bool;

	/**
	 * The bounds' padding used for bounds calculation.
	 *
	 * @member {Float}
	 */
	var boundsPadding:Float;

	/**
	 * Used to detect if we need to do a fast rect check using the id compare method
	 * @type {Int}
	 */
	var fastRectDirty:Int;

	/**
	 * Used to detect if we clear the graphics webGL data
	 * @type {Int}
	 */
	var clearDirty:Int;

	/**
	 * Used to detect if we we need to recalculate local bounds
	 * @type {Int}
	 */
	var boundsDirty:Int;

	/**
	 * Creates a new Graphics object with the same values as this one.
	 * Note that the only the properties of the object are cloned, not its transform (position,scale,etc)
	 *
	 * @return {Graphics}
	 */
	function clone():Graphics;

	/**
	 * Specifies the line style used for subsequent calls to Graphics methods such as the lineTo() method or the drawCircle() method.
	 *
	 * @param lineWidth {Float} width of the line to draw, will update the objects stored style
	 * @param color {Int} color of the line to draw, will update the objects stored style
	 * @param alpha {Float} alpha of the line to draw, will update the objects stored style
	 * @return {Graphics}
	 */
	function lineStyle(?lineWidth:Float, ?color:Int, ?alpha:Float):Graphics;

	/**
	 * Moves the current drawing position to x, y.
	 *
	 * @param x {Float} the X coordinate to move to
	 * @param y {Float} the Y coordinate to move to
	 * @return {Graphics}
	 */
	function moveTo(x:Float, y:Float):Graphics;

	/**
	 * Draws a line using the current line style from the current drawing position to (x, y);
	 * The current drawing position is then set to (x, y).
	 *
	 * @param x {Float} the X coordinate to draw to
	 * @param y {Float} the Y coordinate to draw to
	 * @return {Graphics}
	 */
	function lineTo(x:Float, y:Float):Graphics;

	/**
	 * Calculate the points for a quadratic bezier curve and then draws it.
	 * Based on: https://stackoverflow.com/questions/785097/how-do-i-implement-a-bezier-curve-in-c
	 *
	 * @param cpX {Float} Control point x
	 * @param cpY {Float} Control point y
	 * @param toX {Float} Destination point x
	 * @param toY {Float} Destination point y
	 * @return {Graphics}
	 */
	function quadraticCurveTo(cpX:Float, cpY:Float, toX:Float, toY:Float):Graphics;

	/**
	 * Calculate the points for a bezier curve and then draws it.
	 *
	 * @param cpX {Float} Control point x
	 * @param cpY {Float} Control point y
	 * @param cpX2 {Float} Second Control point x
	 * @param cpY2 {Float} Second Control point y
	 * @param toX {Float} Destination point x
	 * @param toY {Float} Destination point y
	 * @return {Graphics}
	 */
	function bezierCurveTo(cpX:Float, cpY:Float, cpX2:Float, cpY2:Float, toX:Float, toY:Float):Graphics;

	/**
	 * The arcTo() method creates an arc/curve between two tangents on the canvas.
	 *
	 * "borrowed" from https://code.google.com/p/fxcanvas/ - thanks google!
	 *
	 * @param x1 {Float} The x-coordinate of the beginning of the arc
	 * @param y1 {Float} The y-coordinate of the beginning of the arc
	 * @param x2 {Float} The x-coordinate of the end of the arc
	 * @param y2 {Float} The y-coordinate of the end of the arc
	 * @param radius {Float} The radius of the arc
	 * @return {Graphics}
	 */
	function arcTo(x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Graphics;

	/**
	 * The arc method creates an arc/curve (used to create circles, or parts of circles).
	 *
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
	 * Specifies a simple one-color fill that subsequent calls to other Graphics methods
	 * (such as lineTo() or drawCircle()) use when drawing.
	 *
	 * @param color {Int} the color of the fill
	 * @param alpha {Float} the alpha of the fill
	 * @return {Graphics}
	 */
	function beginFill(?color:Int, ?alpha:Float):Graphics;

	/**
	 * Applies a fill to the lines and shapes that were added since the last call to the beginFill() method.
	 *
	 * @return {Graphics}
	 */
	function endFill():Graphics;

	/**
	 *
	 * @param x {Float} The X coord of the top-left of the rectangle
	 * @param y {Float} The Y coord of the top-left of the rectangle
	 * @param width {Float} The width of the rectangle
	 * @param height {Float} The height of the rectangle
	 * @return {Graphics}
	 */
	function drawRect(x:Float, y:Float, width:Float, height:Float):Graphics;

	/**
	 *
	 * @param x {Float} The X coord of the top-left of the rectangle
	 * @param y {Float} The Y coord of the top-left of the rectangle
	 * @param width {Float} The width of the rectangle
	 * @param height {Float} The height of the rectangle
	 * @param radius {Float} Radius of the rectangle corners
 	*/
	function drawRoundedRect(x:Float, y:Float, width:Float, height:Float, radius:Float):Graphics;

	/**
	 * Draws a circle.
	 *
	 * @param x {Float} The X coordinate of the center of the circle
	 * @param y {Float} The Y coordinate of the center of the circle
	 * @param radius {Float} The radius of the circle
	 * @return {Graphics}
	 */
	function drawCircle(x:Float, y:Float, radius:Float):Graphics;

	/**
	 * Draws an ellipse.
	 *
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
	 * @param path {Array} The path data used to construct the polygon.
	 * @return {Graphics}
	 */
	function drawPolygon(path:Array<Float>):Graphics;

	/**
	 * Clears the graphics that were drawn to this Graphics object, and resets fill and line style settings.
	 *
	 * @return {Graphics}
	 */
	function clear():Graphics;

	/**
     * True if graphics consists of one rectangle, and thus, can be drawn like a Sprite and
     * masked with gl.scissor.
     *
     * @returns {Bool} True if only 1 rect.
     */
	function isFastRect():Bool;

	/**
	* Tests if a point is inside this graphics object
	*
	* @param point {Point} the point to test
	* @return {Bool} the result of the test
	*/
	function containsPoint(point:Point):Bool;

	/**
	 * Update the bounds of the object
	 *
	 */
	function updateLocalBounds():Graphics;

	/**
	 * Draws the given shape to this Graphics object. Can be any of Circle, Rectangle, Ellipse, Line or Polygon.
	 *
	 * @param {Circle|Rectangle|Ellipse|Line|Polygon} shape The Shape object to draw.
	 * @return {GraphicsData} The generated GraphicsData object.
	 */
	@:overload(function(shape:Rectangle):GraphicsData {})
	@:overload(function(shape:Ellipse):GraphicsData {})
	@:overload(function(shape:Polygon):GraphicsData {})
	function drawShape(shape:Circle):GraphicsData;

	/**
     * Generates a canvas texture.
     *
     * @param {Int} scaleMode - The scale mode of the texture.
     * @param {Float} resolution - The resolution of the texture.
     * @return {Texture} The new texture.
     */
	function generateCanvasTexture(scaleMode:Int, ?resolution:Float):Texture;

	/**
     * Closes the current path.
     *
     * @return {Graphics} Returns itself.
     */
	function closePath():Graphics;

	/**
     * Adds a hole in the current path.
     *
     * @return {Graphics} Returns itself.
     */
	function addHole():Graphics;
}