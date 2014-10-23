package pixi.utils;

@:native("PIXI.EventTarget")
extern class EventTarget {
	
	/**
	 * Holds all the listeners
	 */
	var listeners:Dynamic;
	
     function new():Void;

	/**
     * Adds a listener for a specific event
     *
     * @method addEventListener
     * @param type {string} A string representing the event type to listen for.
     * @param listener {function} The callback function that will be fired when the event occurs
     */
	function addEventListener(type:String, listener:Dynamic):Void;
	function on(type:String, listener:Dynamic):Void;
    function once(type:String, listener:Dynamic):Void;
	
	/**
     * Fires the event, ie pretends that the event has happened
     *
     * @method dispatchEvent
     * @param event {Event} the event object
     */
    function dispatchEvent(event:Dynamic):Void;

    /**
	 * Emit an event to all registered event listeners.
	 *
	 * @method emit
	 * @param eventName {String} The name of the event.
	 * @return Boolean
	 */
    function emit(eventName :String, ?data :Dynamic):Bool;
	
	/**
     * Removes the specified listener that was assigned to the specified event type
     *
     * @method removeEventListener
     * @param type {string} A string representing the event type which will have its listener removed
     * @param listener {function} The callback function that was be fired when the event occured
     */
	function removeEventListener(type:String, listener:Dynamic):Void;
	function off(type:String, listener:Dynamic):Void;

    function mixin(object:Dynamic):Void;

	/**
     * Removes all the listeners that were active for the specified event type
     *
     * @method removeAllEventListeners
     * @param eventName {string} A string representing the event type which will have all its listeners removed
     */
	function removeAllEventListeners(eventName:String):Void;
}