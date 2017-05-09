package pixi.core.math;

import haxe.extern.EitherType;

@:native("PIXI.ObservablePoint")
extern class ObservablePoint {

	/**
	 * The Point object represents a location in a two-dimensional coordinate system, where x represents
	 * the horizontal axis and y represents the vertical axis.
	 * An observable point is a point that triggers a callback when the point's position is changed.
	 *
	 * @class
	 * @memberof PIXI
	 *
	 * @param {Function} cb - callback when changed
     * @param {object} scope - owner of callback
     * @param {Float} [x=0] - position of the point on the x axis
     * @param {Float} [y=0] - position of the point on the y axis
	 */
	function new(cb:Dynamic, scope:Dynamic, ?x:Float, ?y:Float);

	/**
     * Sets the point to a new x and y position.
     * If y is omitted, both x and y will be set to x.
     *
     * @param {Float} [x=0] - position of the point on the x axis
     * @param {Float} [y=0] - position of the point on the y axis
     */
	function set(?x:Float, ?y:Float):Void;

	/**
     * Copies the data from another point
     *
     * @param {Point|ObservablePoint} point - point to copy from
     */
	function copy(point:EitherType<Point, ObservablePoint>):Void;

	/**
     * The position of the displayObject on the x axis relative to the local coordinates of the parent.
     *
     * @member {Float}
     */
	var x:Float;

	/**
     * The position of the displayObject on the x axis relative to the local coordinates of the parent.
     *
     * @member {Float}
     */
	var y:Float;
}