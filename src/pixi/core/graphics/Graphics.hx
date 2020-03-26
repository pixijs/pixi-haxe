package pixi.core.graphics;

import js.lib.Float32Array;
import pixi.core.Pixi.BlendModes;
import pixi.core.Pixi.ScaleModes;
import pixi.core.Shader;
import pixi.core.display.Container;
import pixi.core.math.Point;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Circle;
import pixi.core.math.shapes.Ellipse;
import pixi.core.math.shapes.Polygon;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.State;
import pixi.core.textures.Texture;

@:native("PIXI.Graphics")
extern class Graphics extends Container {
	static var CURVES(default, never):{
		/**
		 * flag indicating if the resolution should be adaptive
		 * @default false
		 */
		adaptive:Bool,

		/**
		 * maximal length of a single segment of the curve (if adaptive = false, ignored)
		 * @default 10
		 */
		maxLength:Int,

		/**
		 * minimal number of segments in the curve (if adaptive = false, ignored)
		 * @default 8
		 */
		minSegments:Int,

		/**
		 * maximal number of segments in the curve (if adaptive = false, ignored)
		 * @default 2048
		 */
		maxSegments:Int,
	};

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
	 * A collections of batches! These can be drawn by the renderer batch system.
	 */
	private var batches:Array<Dynamic>;

	/**
	 * Update dirty for limiting calculating tints for batches.
	 */
	private var batchTint:Float;

	/**
	 * Current path
	 */
	private var currentPath:Polygon;

	/**
	 * The blend mode to be applied to the graphic shape. Apply a value of PIXI.BLEND_MODES.NORMAL to reset the blend mode.
	 */
	var blendMode:BlendModes;

	/**
	 * The current fill style.
	 */
	var fill(default, null):FillStyle;

	/**
	 * Includes vertex positions, face indices, normals, colors, UVs, and custom attributes within buffers, reducing the cost of passing all this data to the GPU. Can be shared between multiple Mesh or Graphics objects.
	 */
	var geometry(default, null):GraphicsGeometry;

	/**
	 * The current line style.
	 */
	var line(default, null):LineStyle;

	/**
	 * Renderer plugin for batching
	 */
	var pluginName:String;

	/**
	 * Represents the vertex and fragment shaders that processes the geometry and runs on the GPU. Can be shared between multiple Graphics objects.
	 */
	var shader:Shader;

	/**
	 * Represents the WebGL state the Graphics required to render, excludes shader and geometry. E.g., blend mode, culling, depth testing, direction of rendering triangles, backface, etc.
	 */
	var state:State;

	/**
	 * The tint applied to the graphic shape. This is a hex value. A value of 0xFFFFFF will remove any tint effect.
	 */
	var tint:Int;

	/**
	 *  Copy of the object vertex data.
	 */
	private var vertexData:Float32Array;

	/**
	 * Retrieves the bounds of the graphic shape as a rectangle object
	 */
	private function _calculateBounds():Void;

	/**
	 * Initialize the curve
	 * @param	x
	 * @param	y
	 */
	private function _initCurve(?x:Float, ?y:Float):Void;

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
	 * Begin adding holes to the last draw shape IMPORTANT: holes must be fully inside a shape to work Also weirdness ensues if holes overlap! Ellipses, Circles, Rectangles and Rounded Rectangles cannot be holes or host for holes in CanvasRenderer, please use moveTo lineTo, quadraticCurveTo if you rely on pixi-legacy bundle.
	 * @return Returns itself.
	 */
	function beginHole():Graphics;

	/**
	 * Begin the texture fill
	 * @param	options
	 * @return This Graphics object. Good for chaining method calls
	 */
	function beginTextureFill(options:Dynamic):Graphics;

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
	 * Recalcuate the tint by applying tin to batches using Graphics tint.
	 */
	private function calculateTints():Void;

	/**
	 * If there's a transform update or a change to the shape of the geometry, recaculate the vertices.
	 */
	private function calculateVertices():Void;

	/**
	 * Clears the graphics that were drawn to this Graphics object, and resets fill and line style settings.
	 *
	 * @return {Graphics}
	 */
	function clear():Graphics;

	/**
	 * Creates a new Graphics object with the same values as this one.
	 * Note that the only the properties of the object are cloned, not its transform (position,scale,etc)
	 *
	 * @return {Graphics}
	 */
	function clone():Graphics;

	/**
	 * Tests if a point is inside this graphics object
	 *
	 * @param point {Point} the point to test
	 * @return {Bool} the result of the test
	 */
	function containsPoint(point:Point):Bool;

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
	 * Draw a star shape with an abitrary number of points.
	 *
	 * @param {Float} x - Center X position of the star
	 * @param {Float} y - Center Y position of the star
	 * @param {Int} points - The number of points of the star, must be > 1
	 * @param {Float} radius - The outer radius of the star
	 * @param {Float} [innerRadius] - The inner radius between points, default half `radius`
	 * @param {Float} [rotation=0] - The rotation of the star in radians, where 0 is vertical
	 * @return {Graphics} This Graphics object. Good for chaining method calls
	 */
	function drawStar(x:Float, y:Float, points:Int, radius:Float, ?innerRadius:Float, ?rotation:Float = 0):Graphics;

	/**
	 * Applies a fill to the lines and shapes that were added since the last call to the beginFill() method.
	 *
	 * @return {Graphics}
	 */
	function endFill():Graphics;

	/**
	 * Finish the polygon object.
	 */
	private function finishPoly():Void;

	/**
	 * Generates a canvas texture.
	 *
	 * @param {ScaleModes} scaleMode - The scale mode of the texture.
	 * @param {Float} resolution - The resolution of the texture.
	 * @return {Texture} The new texture.
	 */
	function generateCanvasTexture(scaleMode:ScaleModes, ?resolution:Float):Texture;

	/**
	 * True if graphics consists of one rectangle, and thus, can be drawn like a Sprite and
	 * masked with gl.scissor.
	 *
	 * @return {Bool} True if only 1 rect.
	 */
	function isFastRect():Bool;

	/**
	 * Specifies the line style used for subsequent calls to Graphics methods such as the lineTo() method or the drawCircle() method.
	 *
	 * @param lineWidth {Float} width of the line to draw, will update the objects stored style
	 * @param color {Int} color of the line to draw, will update the objects stored style
	 * @param alpha {Float} alpha of the line to draw, will update the objects stored style
	 * @param alignment {Float} alignment of the line to draw, (0 = inner, 0.5 = middle, 1 = outer)
	 * @param native {Bool} If true the lines will be draw using `LINES` instead of `TRIANGLE_STRIP`
	 * @return {Graphics}
	 */
	function lineStyle(?lineWidth:Float, ?color:Int, ?alpha:Float, ?alignment:Float, ?native:Bool):Graphics;

	/**
	 * Like line style but support texture for line fill.
	 * @param	options width, texture, color, alpha, matrix, alignment, native
	 * @return {Graphics}
	 */
	function lineTextureStyle(options:Dynamic):Graphics;

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
	 * Apply a matrix to the positional data.
	 * @param	matrix Matrix to use for transform current shape.
	 * @return Returns itself.
	 */
	function setMatrix(matrix:Matrix):Graphics;

	/**
	 * Closes the current path.
	 *
	 * @return {Graphics} Returns itself.
	 */
	function closePath():Graphics;
}
