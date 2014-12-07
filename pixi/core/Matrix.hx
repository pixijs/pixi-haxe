package pixi.core;

@:native("PIXI.Matrix")
extern class Matrix {

	/**
	 * The Matrix class is now an object, which makes it a lot faster,
	 * here is a representation of it :
	 * | a | b | tx|
	 * | c | d | ty|
	 * | 0 | 0 | 1 |
	 *
	 * @class Matrix
	 * @constructor
	 */
	function new():Void;

	/**
	 * @property a
	 * @type Int
	 * @default 1
	 */
	var a:Float;

	/**
	 * @property b
	 * @type Int
	 * @default 0
	 */
	var b:Float;

	/**
	 * @property c
	 * @type Int
	 * @default 0
	 */
	var c:Float;

	/**
	 * @property d
	 * @type Number
	 * @default 1
	 */
	var d:Float;

	/**
	 * @property tx
	 * @type Number
	 * @default 0
	 */
	var tx:Float;

	/**
	 * @property ty
	 * @type Number
	 * @default 0
	 */
	var ty:Float;

	/**
	 * Creates a pixi matrix object based on the array given as a parameter
	 *
	 * @method fromArray
	 * @param array {Array} The array that the matrix will be filled with
	 */
	function fromArray(array:Array<Float>):Void;

	/**
	 * Creates an array from the current Matrix object
	 *
	 * @method toArray
	 * @param transpose {Bool} Whether we need to transpose the matrix or not
	 * @return {Array} the newly created array which contains the matrix
	 */
	function toArray(transpose:Bool):Array<Float>;

	/**
	 * Get a new position with the current transformation applied.
	 * Can be used to go from a child's coordinate space to the world coordinate space. (e.g. rendering)
	 *
	 * @method apply
	 * @param pos {Point} The origin
	 * @param [newPos] {Point} The point that the new position is assigned to (allowed to be same as input)
	 * @return {Point} The new point, transformed through this matrix
	 */
	function apply(pos:Point, ?newPos:Point):Point;

	/**
	 * Get a new position with the inverse of the current transformation applied.
	 * Can be used to go from the world coordinate space to a child's coordinate space. (e.g. input)
	 *
	 * @method applyInverse
	 * @param pos {Point} The origin
	 * @param [newPos] {Point} The point that the new position is assigned to (allowed to be same as input)
	 * @return {Point} The new point, inverse-transformed through this matrix
	 */
	function applyInverse(pos:Point, ?newPos:Point):Point;

	/**
	 * Translates the matrix on the x and y.
	 *
	 * @method translate
	 * @param {Float} x
	 * @param {Float} y
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 **/
	function translate(x:Float, y:Float):Matrix;

	/**
	 * Applies a scale transformation to the matrix.
	 *
	 * @method scale
	 * @param {Float} x The amount to scale horizontally
	 * @param {Float} y The amount to scale vertically
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 **/
	function scale(x:Float, y:Float):Matrix;

	/**
	 * Applies a rotation transformation to the matrix.
	 * @method rotate
	 * @param {Float} angle The angle in radians.
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 **/
	function rotate(angle:Float):Matrix;

	/**
	 * Appends the given Matrix to this Matrix.
	 *
	 * @method append
	 * @param {Matrix} matrix
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function append(matrix:Matrix):Matrix;

	/**
	 * Resets this Matix to an identity (default) matrix.
	 *
	 * @method identity
	 * @return {Matrix} This matrix. Good for chaining method calls.
	 */
	function identity():Matrix;
}