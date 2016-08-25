package pixi.core.display;

import pixi.core.math.Matrix;
import pixi.core.math.ObservablePoint;
import pixi.core.math.Point;

@:native("PIXI.Transform")
extern class Transform extends TransformBase {

	/**
	 * Generic class to deal with traditional 2D matrix transforms
	 * local transformation is calculated from position,scale,skew and rotation
	 *
	 * @class
	 * @extends PIXI.TransformBase
	 * @memberof PIXI
	 */
	function new();
	
     /**
     * The coordinate of the object relative to the local coordinates of the parent.
     *
     * @member {PIXI.Point}
     */
	var position:Point;
	
    /**
     * The scale factor of the object.
     *
     * @member {PIXI.Point}
     */
	var scale:Point;
	
    /**
     * The skew amount, on the x and y axis.
     *
     * @member {PIXI.ObservablePoint}
     */
	var skew:ObservablePoint; //ObservablePoint
	
    /**
     * The pivot point of the displayObject that it rotates around
     *
     * @member {PIXI.Point}
     */
	var pivot:Point;
	
    /**
     * The rotation value of the object, in radians
     *
     * @member {Number}
     * @private
     */
	var _rotation:Float;
	
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