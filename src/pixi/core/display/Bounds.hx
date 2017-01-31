package pixi.core.display;

import js.html.Float32Array;
import pixi.core.math.Point;
import pixi.core.math.shapes.Rectangle;

@:native("PIXI.Bounds")
extern class Bounds {

	/**
	 * 'Builder' pattern for bounds rectangles
	 * Axis-Aligned Bounding Box
	 * It is not a shape! Its mutable thing, no 'EMPTY' or that kind of problems
	 *
	 * @class
	 * @memberof PIXI
	 */
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
	
	/**
	 * 
	 * @return
	 */
	function isEmpty():Bool;
	
	/**
	 * 
	 */
	function clear():Void;
	
	/**
	 * Can return Rectangle.EMPTY constant, either construct new rectangle, either use your rectangle
	 * It is not guaranteed that it will return tempRect
	 * @param tempRect {PIXI.Rectangle} temporary object will be used if AABB is not empty
	 * @returns {PIXI.Rectangle}
	 */
	function getRectangle(rect:Rectangle):Rectangle;
	
	/**
	 * This function should be inlined when its possible
	 * @param point {PIXI.Point}
	 */
	function addPoint(point:Point):Void;
	
	/**
	 * Adds a quad, not transformed
	 * @param vertices {Float32Array}
	 * @returns {PIXI.Bounds}
	 */
	function addQuad(vertices:Float32Array):Bounds;
	
	/**
	 * Adds sprite frame, transformed
	 * @param transform {PIXI.TransformBase}
	 * @param x0 {number}
	 * @param y0 {number}
	 * @param x1 {number}
	 * @param y1 {number}
	 */
	function addFrame(transform:TransformBase, x0:Float, y0:Float, x1:Float, y1:Float):Void;
	
	/**
	 * add an array of vertices
	 * @param transform {PIXI.TransformBase}
	 * @param vertices {Float32Array}
	 * @param beginOffset {number}
	 * @param endOffset {number}
	 */
	function addVertices(transform:TransformBase, vertices:Float32Array, beginOffset:Int, endOffset:Int):Void;
	
	/**
	 * 
	 * @param	bounds {PIXI.Bounds}
	 */
	function addBounds(bounds:Bounds):Void;
}