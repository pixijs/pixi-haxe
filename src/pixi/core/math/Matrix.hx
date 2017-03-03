package pixi.core.math;

@:native("PIXI.Matrix")
extern class Matrix {

	/**
	 * The Matrix class is now an object, which makes it a lot faster,
	 * here is a representation of it :
	 * | a | b | tx|
	 * | c | d | ty|
	 * | 0 | 0 | 1 |
	 *
	 * @param {number} [a=1] - x scale
     * @param {number} [b=0] - y skew
     * @param {number} [c=0] - x skew
     * @param {number} [d=1] - y scale
     * @param {number} [tx=0] - x translation
     * @param {number} [ty=0] - y translation
	 *
	 * @class
	 * @namespace PIXI
	 */
	function new(?a:Float = 1, ?b:Float = 0, ?c:Float = 0, ?d:Float = 1, ?tx:Float = 0, ?ty:Float = 0):Void;

	/**
	 * @member {Float}
	 * @default 1
	 */
	var a:Float;

	/**
	 * @member {Float}
	 * @default 0
	 */
	var b:Float;

	/**
	 * @member {Float}
	 * @default 0
	 */
	var c:Float;

	/**
	 * @member {Float}
	 * @default 1
	 */
	var d:Float;

	/**
	 * @member {Float}
	 * @default 0
	 */
	var tx:Float;

	/**
	 * @member {Float}
	 * @default 0
	 */
	var ty:Float;

	/**
	 * Creates a Matrix object based on the given array. The Element to Matrix mapping order is as follows:
	 *
	 * a = array[0]
	 * b = array[1]
	 * c = array[3]
	 * d = array[4]
	 * tx = array[2]
	 * ty = array[5]
	 *
	 * @param array {Float[]} The array that the matrix will be populated from.
	 */
	function fromArray(array:Array<Float>):Void;

	/**
	 * Creates an array from the current Matrix object.
	 *
	 * @param transpose {Bool} Whether we need to transpose the matrix or not
	 * @return {Float[]} the newly created array which contains the matrix
	 */
	function toArray(transpose:Bool):Array<Float>;

	/**
	 * Get a new position with the current transformation applied.
	 * Can be used to go from a child's coordinate space to the world coordinate space. (e.g. rendering)
	 *
	 * @param pos {Point} The origin
	 * @param [newPos] {Point} The point that the new position is assigned to (allowed to be same as input)
	 * @return {Point} The new point, transformed through this matrix
	 */
	function apply(pos:Point, ?newPos:Point):Point;

	/**
	 * Get a new position with the inverse of the current transformation applied.
	 * Can be used to go from the world coordinate space to a child's coordinate space. (e.g. input)
	 *
	 * @param pos {Point} The origin
	 * @param [newPos] {Point} The point that the new position is assigned to (allowed to be same as input)
	 * @return {Point} The new point, inverse-transformed through this matrix
	 */
	function applyInverse(pos:Point, ?newPos:Point):Point;

	/**
	 * Translates the matrix on the x and y.
	 *
	 * @param {Float} x
	 * @param {Float} y
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function translate(x:Float, y:Float):Matrix;

	/**
	 * Applies a scale transformation to the matrix.
	 *
	 * @param {Float} x The amount to scale horizontally
	 * @param {Float} y The amount to scale vertically
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function scale(x:Float, y:Float):Matrix;

	/**
	 * Applies a rotation transformation to the matrix.
	 *
	 * @param {Float} angle - The angle in radians.
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function rotate(angle:Float):Matrix;

	/**
	 * Appends the given Matrix to this Matrix.
	 *
	 * @param {Matrix} matrix
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function append(matrix:Matrix):Matrix;

	/**
	 * Prepends the given Matrix to this Matrix.
	 *
	 * @param {Matrix} matrix
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function prepend(matrix:Matrix):Matrix;

	/**
	 * Resets this Matix to an identity (default) matrix.
	 *
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function identity():Matrix;

	function invert():Matrix;

	function clone():Matrix;

	function copy(matrix:Matrix):Matrix;
}