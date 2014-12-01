package pixi.utils;

@:native("PIXI.Event")
extern class Event {

	/**
	 * Creates an homogenous object for tracking events so users can know what to expect.
	 *
	 * @class Event
	 * @extends Object
	 * @constructor
	 * @param target {Object} The target object that the event is called on
	 * @param name {String} The string name of the event that was triggered
	 * @param data {Object} Arbitrary event data to pass along
	 */
	function new(target:Dynamic, name:String, ?data:Dynamic);

	/**
	 * Stops the propagation of events up the scene graph (prevents bubbling).
	 *
	 * @method stopPropagation
	 */
    function stopPropagation():Void;

	/**
	 * Stops the propagation of events to sibling listeners (no longer calls any listeners).
	 *
	 * @method stopImmediatePropagation
	 */
	function stopImmediatePropagation():Void;
}