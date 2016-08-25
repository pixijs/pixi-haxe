package pixi.core.display;

import pixi.core.math.Matrix;
import pixi.core.math.ObservablePoint;

@:native("PIXI.TransformStatic")
extern class TransformStatic extends TransformBase {

	/**
	 * Transform that takes care about its versions
	 *
	 * @class
	 * @extends PIXI.TransformBase
	 * @memberof PIXI
	 */
	public function new();
	
     /**
     * The coordinate of the object relative to the local coordinates of the parent.
     *
     * @member {PIXI.ObservablePoint}
     */
	var position:ObservablePoint;
	
    /**
     * The scale factor of the object.
     *
     * @member {PIXI.ObservablePoint}
     */
	var scale:ObservablePoint;
	
    /**
     * The pivot point of the displayObject that it rotates around
     *
     * @member {PIXI.ObservablePoint}
     */
	var pivot:ObservablePoint;
	
    /**
     * The skew amount, on the x and y axis.
     *
     * @member {PIXI.ObservablePoint}
     */
	var skew:ObservablePoint;
	
	function onChange():Void;
	
	/**
	 * 
	 */
	function updateSkew():Void;
	
	/**
	 * Decomposes a matrix and sets the transforms properties based on it.
	 * @param {PIXI.Matrix} The matrix to decompose
	 */
	function setFromMatrix(matrix:Matrix):Void;
}