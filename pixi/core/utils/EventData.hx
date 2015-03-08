package pixi.core.utils;

@:native("PIXI.EventData")
extern class EventData {

	/**
	 * Creates an homogenous object for tracking events so users can know what to expect.
	 *
	 * @class
	 * @namespace PIXI
	 * @param target {object} The target object that the event is called on
	 * @param name {String} The string name of the event that was triggered
	 * @param data {object} Arbitrary event data to pass along
	 */
	function new(target:Dynamic, name:String, data:Dynamic);

	/**
     * The original target the event triggered on.
     *
     * @member {Dynamic}
     * @readonly
     */
	var target:Dynamic;

	/**
     * The string name of the event that this represents.
     *
     * @member {String}
     * @readonly
     */
	var type:String;

	/**
     * The data that was passed in with this event.
     *
     * @member {Dynamic}
     * @readonly
     */
	var data:Dynamic;

	/**
     * The timestamp when the event occurred.
     *
     * @member {Int}
     * @readonly
     */
	var timeStamp:Int;

	/**
	 * Stops the propagation of events up the scene graph (prevents bubbling).
	 *
	 */
	function stopPropagation():Void;

	/**
	 * Stops the propagation of events to sibling listeners (no longer calls any listeners).
	 *
	 */
	function stopImmediatePropagation():Void;
}