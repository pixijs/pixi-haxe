package pixi.core.display;

import js.html.Float32Array;
import pixi.core.math.Point;
import pixi.core.math.shapes.Rectangle;

@:native("PIXI.Bounds")
extern class Bounds {

	function new();

	/**
	 * @member {number}
	 * @default 0
	 */
	var minX:Float;

	/**
	 * @member {number}
	 * @default 0
	 */
	var minY:Float;

	/**
	 * @member {number}
	 * @default 0
	 */
	var maxX:Float;

	/**
	 * @member {number}
	 * @default 0
	 */
	var maxY:Float;

	var rect:Rectangle;

	/**
     * Checks if bounds are empty.
     *
     * @return {Bool} True if empty.
     */
	function isEmpty():Bool;

	/**
     * Clears the bounds and resets.
     *
     */
	function clear():Void;

	/**
     * Can return Rectangle.EMPTY constant, either construct new rectangle, either use your rectangle
     * It is not guaranteed that it will return tempRect
     *
     * @param {Rectangle} rect - temporary object will be used if AABB is not empty
     * @returns {Rectangle} A rectangle of the bounds
     */
	function getRectangle(rect:Rectangle):Rectangle;

	/**
     * This function should be inlined when its possible.
     *
     * @param {Point} point - The point to add.
     */
	function addPoint(point:Point):Void;

	/**
     * Adds a quad, not transformed
     *
     * @param {Float32Array} vertices - The verts to add.
     */
	function addQuad(vertices:Float32Array):Void;

	/**
     * Adds sprite frame, transformed.
     *
     * @param {TransformBase} transform - TODO
     * @param {Float} x0 - TODO
     * @param {Float} y0 - TODO
     * @param {Float} x1 - TODO
     * @param {Float} y1 - TODO
     */
	function addFrame(transform:TransformBase, x0:Float, y0:Float, x1:Float, y1:Float):Void;

	/**
     * Add an array of vertices
     *
     * @param {TransformBase} transform - TODO
     * @param {Float32Array} vertices - TODO
     * @param {Float} beginOffset - TODO
     * @param {Float} endOffset - TODO
     */
	function addVertices(transform:TransformBase, vertices:Float32Array, beginOffset:Float, endOffset:Float):Void;

	/**
     * Adds other Bounds
     *
     * @param {Bounds} bounds - TODO
     */
	function addBounds(bounds:Bounds):Void;

	/**
     * Adds other Bounds, masked with Bounds
     *
     * @param {Bounds} bounds - TODO
     * @param {Bounds} mask - TODO
     */
	function addBoundsMask(bounds:Bounds, mask:Bounds):Void;

	/**
     * Adds other Bounds, masked with Rectangle
     *
     * @param {Bounds} bounds - TODO
     * @param {Rectangle} area - TODO
     */
	function addBoundsArea(bounds:Bounds, area:Rectangle):Void;

}