package pixi.core.display;

import pixi.core.math.Matrix;
import pixi.core.math.ObservablePoint;
import pixi.core.math.Point;

@:native("PIXI.Transform")
extern class Transform {
	/**
	 * Transform that takes care about its versions
	 *
	 * @class
	 * @memberof PIXI
	 */
	function new();

	/**
	 * A default (identity) transform
	 */
	static var IDENTITY:Transform;

	/**
	 * The locally unique ID of the local transform used to calculate the current local transformation matrix.
	 */
	private var _currentLocalID:Float;

	/**
	 * The X-coordinate value of the normalized local X axis, the first column of the local transformation matrix without a scale.
	 */
	private var _cx:Float;

	/**
	 * The Y-coordinate value of the normalized local Y axis, the first column of the local transformation matrix without a scale.
	 */
	private var _cy:Float;

	/**
	 * The locally unique ID of the local transform.
	 */
	private var _localID:Float;

	/**
	 * The locally unique ID of the parent's world transform used to calculate the current world transformation matrix.
	 */
	private var _parentID:Float;

	/**
	 * The rotation amount.
	 */
	private var _roation:Float;

	/**
	 * The Y-coordinate value of the normalized local X axis, the first column of the local transformation matrix without a scale.
	 */
	private var _sx:Float;

	/**
	 * The Y-coordinate value of the normalized local Y axis, the first column of the local transformation matrix without a scale.
	 */
	private var _sy:Float;

	/**
	 * The locally unique ID of the world transform.
	 */
	private var _worldID:Float;

	/**
	 * The local transformation matrix.
	 */
	var localTransform:Matrix;

	/**
	 * The pivot point of the displayObject that it rotates around.
	 */
	var pivot:ObservablePoint;

	/**
	 * The coordinate of the object relative to the local coordinates of the parent.
	 */
	var position:ObservablePoint;

	/**
	 * The rotation of the object in radians.
	 */
	var rotation:Float;

	/**
	 * The scale factor of the object.
	 */
	var scale:ObservablePoint;

	/**
	 * The skew amount, on the x and y axis.
	 */
	var skew:ObservablePoint;

	/**
	 * The world transformation matrix.
	 */
	var worldTransform:Matrix;

	/**
	 * Called when a value changes.
	 */
	private function onChange():Void;

	/**
	 * Decomposes a matrix and sets the transforms properties based on it.
	 * @param	matrix The matrix to decompose
	 */
	function setFromMatrix(matrix:Matrix):Void;

	/**
	 * Updates the local transformation matrix.
	 */
	function updateLocalTransform():Void;

	/**
	 * Called when the skew or the rotation changes.
	 */
	function updateSkew():Void;

	/**
	 * Updates the local and the world transformation matrices.
	 * @param	parentTransform The parent transform
	 */
	function updateTransform(parentTransform:Transform):Void;
}
