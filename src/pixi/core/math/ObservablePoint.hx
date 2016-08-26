package pixi.core.math;

@:native("PIXI.ObservablePoint")
extern class ObservablePoint extends Point {

	/**
	 * The Point object represents a location in a two-dimensional coordinate system, where x represents
	 * the horizontal axis and y represents the vertical axis.
	 * An observable point is a point that triggers a callback when the point's position is changed.
	 *
	 * @class
	 * @memberof PIXI
	 * @param cb {Function} callback when changed
	 * @param scope {Object} owner of callback
	 * @param [x=0] {number} position of the point on the x axis
	 * @param [y=0] {number} position of the point on the y axis
	 */
	function new(cb:Void->Void, scope:Dynamic, ?x:Float, ?y:Float);
	
    /**
     * The position of the displayObject on the x axis relative to the local coordinates of the parent.
     *
     * @member {number}
     * @memberof PIXI.ObservablePoint#
     */
	var x:Float;
	
    /**
     * The position of the displayObject on the x axis relative to the local coordinates of the parent.
     *
     * @member {number}
     * @memberof PIXI.ObservablePoint#
     */
	var y:Float;
}