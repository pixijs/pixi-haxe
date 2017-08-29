package pixi.core.display;

import pixi.core.math.Matrix;
import pixi.core.math.ObservablePoint;

@:native("PIXI.TransformStatic")
extern class TransformStatic extends TransformBase {

	function new();

	/**
	 * The coordinate of the object relative to the local coordinates of the parent.
	 *
	 * @member {ObservablePoint}
	 */
	var position:ObservablePoint;

	/**
	 * The scale factor of the object.
	 *
	 * @member {ObservablePoint}
	 */
	var scale:ObservablePoint;

	/**
	 * The pivot point of the displayObject that it rotates around
	 *
	 * @member {ObservablePoint}
	 */
	var pivot:ObservablePoint;

	/**
	 * The skew amount, on the x and y axis.
	 *
	 * @member {ObservablePoint}
	 */
	var skew:ObservablePoint;

	/**
     * The rotation of the object in radians.
     *
     * @member {Float}
     */
	var rotation:Float;

	/**
     * Decomposes a matrix and sets the transforms properties based on it.
     *
     * @param {Matrix} matrix - The matrix to decompose
     */
	function setFromMatrix(matrix:Matrix):Void;
}