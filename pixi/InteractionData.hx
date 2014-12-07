package pixi;

import pixi.display.Sprite;
import pixi.display.DisplayObject;
import pixi.core.Point;

@:native("PIXI.InteractionData")
extern class InteractionData {

	/**
	 * Holds all information related to an Interaction event
	 *
	 * @class InteractionData
	 * @constructor
	 */
	function new();

	/**
	 * This point stores the global coords of where the touch/mouse event happened
	 *
	 * @property global
	 * @type Point
	 */
	var global:Point;

	/**
	 * The target Sprite that was interacted with
	 *
	 * @property target
	 * @type Sprite
	 */
	var target:Sprite;

	/**
	 * When passed to an event handler, this will be the original DOM Event that was captured
	 *
	 * @property originalEvent
	 * @type Event
	 */
	var originalEvent:Dynamic;

	/**
	 * This will return the local coordinates of the specified displayObject for this InteractionData
	 *
	 * @method getLocalPosition
	 * @param displayObject {DisplayObject} The DisplayObject that you would like the local coords off
	 * @param [point] {Point} A Point object in which to store the value, optional (otherwise will create a new point)
	 * @return {Point} A point containing the coordinates of the InteractionData position relative to the DisplayObject
	 */
	function getLocalPosition(displayObject:DisplayObject, ?point:Point):Point;

}