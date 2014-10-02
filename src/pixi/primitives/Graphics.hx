package pixi.primitives;

import pixi.Gr;

@:native("PIXI.Graphics")
extern class Graphics {

	/**
	 * The Graphics class contains a set of methods that you can use to create primitive shapes and lines.
	 * It is important to know that with the webGL renderer only simple polygons can be filled at this stage
	 * Complex polygons will not be filled. Heres an example of a complex polygon: http://www.goodboydigital.com/wp-content/uploads/2013/06/complexPolygon.png
	 *
	 * @class Graphics
	 * @extends DisplayObjectContainer
	 * @constructor
	*/
	public function new():Void;

	/**
	 * Specifies the line style used for subsequent calls to Graphics methods such as the lineTo() method or the drawCircle() method.
	 *
	 * @method lineStyle
	 * @param lineWidth {Number} width of the line to draw, will update the object's stored style
	 * @param color {Number} color of the line to draw, will update the object's stored style
	 * @param alpha {Number} alpha of the line to draw, will update the object's stored style
	*/
	public function lineStyle(lineWidth:Float, color:Float, alpha:Float):Void;

	/**
	 * Moves the current drawing position to (x, y).
	 *
	 * @method moveTo
	 * @param x {Number} the X coordinate to move to
	 * @param y {Number} the Y coordinate to move to
	*/
	public function moveTo(x:Float, y:Float):Void;

	/**
	 * Draws a line using the current line style from the current drawing position to (x, y);
	 * the current drawing position is then set to (x, y).
	 *
	 * @method lineTo
	 * @param x {Number} the X coordinate to draw to
	 * @param y {Number} the Y coordinate to draw to
	*/
	public function lineTo(x:Float, y:Float):Void;

	/**
	 * Calculate the points for a quadratic bezier curve.
	 * Based on : https://stackoverflow.com/questions/785097/how-do-i-implement-a-bezier-curve-in-c
	 *
	 * @method quadraticCurveTo
	 * @param  {number}   cpX   Control point x
	 * @param  {number}   cpY   Control point y
	 * @param  {number}   toX   Destination point x
	 * @param  {number}   toY   Destination point y
	 * @return {PIXI.Graphics}
	*/
	public function quadraticCurveTo(cpX:Float, cpY:Float, toX:Float, toY:Float):Graphics;

	/**
	 * Calculate the points for a bezier curve.
	 *
	 * @method bezierCurveTo
	 * @param  {number}   cpX    Control point x
	 * @param  {number}   cpY    Control point y
	 * @param  {number}   cpX2   Second Control point x
	 * @param  {number}   cpY2   Second Control point y
	 * @param  {number}   toX    Destination point x
	 * @param  {number}   toY    Destination point y
	 * @return {PIXI.Graphics}
	*/
	public function bezierCurveTo(cpX:Float, cpY:Float, cpX2:Float, cpY2:Float, toX:Float, toY:Float):Graphics;

	/*
	 * the arcTo() method creates an arc/curve between two tangents on the canvas.
	 * 
	 * "borrowed" from https://code.google.com/p/fxcanvas/ - thanks google!
	 *
	 * @method arcTo
	 * @param  {number}   x1        The x-coordinate of the beginning of the arc
	 * @param  {number}   y1        The y-coordinate of the beginning of the arc
	 * @param  {number}   x2        The x-coordinate of the end of the arc
	 * @param  {number}   y2        The y-coordinate of the end of the arc
	 * @param  {number}   radius    The radius of the arc
	 * @return {PIXI.Graphics}
	*/
	public function arcTo(x1:Float, y1:Float, x2:Float, y2:Float, radius):Graphics;

	
	/**
	 * The arc() method creates an arc/curve (used to create circles, or parts of circles).
	 *
	 * @method arc
	 * @param  {number}   cx                The x-coordinate of the center of the circle
	 * @param  {number}   cy                The y-coordinate of the center of the circle
	 * @param  {number}   radius            The radius of the circle
	 * @param  {number}   startAngle        The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle)
	 * @param  {number}   endAngle          The ending angle, in radians
	 * @param  {number}   anticlockwise     Optional. Specifies whether the drawing should be counterclockwise or clockwise. False is default, and indicates clockwise, while true indicates counter-clockwise.
	 * @return {PIXI.Graphics}
	*/
	public function quadraticCurveTo(cx:Float, cy:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Float):Graphics;

	/**
	 * @method drawPath
	 * @param path {Number}
	*/
	public function drawPath(path:Dynamic):Void;

	/**
	 * Specifies a simple one-color fill that subsequent calls to other Graphics methods
	 * (such as lineTo() or drawCircle()) use when drawing.
	 *
	 * @method beginFill
	 * @param color {Number} the color of the fill
	 * @param alpha {Number} the alpha of the fill
	*/
	public function beginFill(color:Float, alpha:Float):Void;

	/**
	 * Applies a fill to the lines and shapes that were added since the last call to the beginFill() method.
	 *
	 * @method endFill
	*/
	public function endFill():Void;

	/**
	 * @method drawRect
	 *
	 * @param x {Number} The X coord of the top-left of the rectangle
	 * @param y {Number} The Y coord of the top-left of the rectangle
	 * @param width {Number} The width of the rectangle
	 * @param height {Number} The height of the rectangle
	*/
	public function drawRect(x:Float, y:Float, width:Float, height:Float):Void;

	/**
	 * @method drawRoundedRect
	 *
	 * @param x {Number} The X coord of the top-left of the rectangle
	 * @param y {Number} The Y coord of the top-left of the rectangle
	 * @param width {Number} The width of the rectangle
	 * @param height {Number} The height of the rectangle
	 * @param radius {Number} Radius of the rectangle corners
	*/
	public function drawRoundedRect(x:Float, y:Float, width:Float, height:Float, radius:Float):Void;

	/**
	 * Draws a circle.
	 *
	 * @method drawCircle
	 * @param x {Number} The X coordinate of the center of the circle
	 * @param y {Number} The Y coordinate of the center of the circle
	 * @param radius {Number} The radius of the circle
	*/
	public function drawCircle(x:Float, y:Float, radius:Float):Void;

	/**
	 * Draws an ellipse.
	 *
	 * @method drawEllipse
	 * @param x {Number} The X coordinate of the center of the ellipse
	 * @param y {Number} The Y coordinate of the center of the ellipse
	 * @param width {Number} The half width of the ellipse
	 * @param height {Number} The half height of the ellipse
	*/
	public function drawEllipse(x:Float, y:Float, width:Float, height:Float):Void;

	/**
	 * Clears the graphics that were drawn to this Graphics object, and resets fill and line style settings.
	 *
	 * @method clear
	*/
	public function clear():Void;

	/**
	 * Useful function that returns a texture of the graphics object that can then be used to create sprites
	 * This can be quite useful if your geometry is complicated and needs to be reused multiple times.
	 *
	 * @method generateTexture
	 * @return {Texture} a texture of the graphics object
	*/
	public function generateTexture():Dynamic;

	/**
	 * Retrieves the bounds of the graphic shape as a rectangle object
	 *
	 * @method getBounds
	 * @return {Rectangle} the rectangular bounding area
	*/
	public function getBounds(matrix:Dynamic):pixi.core.Rectangle;

	/**
	 * Update the bounds of the object
	 *
	 * @method updateBounds
	*/
	public function updateBounds():Void;

	public function destroyCachedSprite():Void;
}