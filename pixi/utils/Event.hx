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
	 * @param [data] {Object} Arbitrary event data to pass along
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

	/**
     * Tracks the state of bubbling propagation. Do not
     * set this directly, instead use `event.stopPropagation()`
     *
     * @property stopped
     * @type Bool
     * @private
     * @readOnly
     */
	var stopped:Bool;

	/**
     * Tracks the state of sibling listener propagation. Do not
     * set this directly, instead use `event.stopImmediatePropagation()`
     *
     * @property stoppedImmediate
     * @type Bool
     * @private
     * @readOnly
     */
	var stoppedImmediate:Bool;

	/**
     * The original target the event triggered on.
     *
     * @property target
     * @type Dynamic
     * @readOnly
     */
	var target:Dynamic;

	/**
     * The string name of the event that this represents.
     *
     * @property type
     * @type String
     * @readOnly
     */
	var type:String;

	/**
     * The data that was passed in with this event.
     *
     * @property data
     * @type Object
     * @readOnly
     */
	var data:Dynamic;

	//backwards compat with older version of events
	var content:Dynamic;

	/**
     * The timestamp when the event occurred.
     *
     * @property timeStamp
     * @type Number
     * @readOnly
     */
	var timeStamp:Int;
}