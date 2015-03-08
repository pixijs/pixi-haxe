package pixi.core.utils;

@:native("PIXI.eventTarget")
extern class EventTarget {

	/**
	 * Mixins event emitter functionality to an object.
	 *
	 * @mixin
	 * @namespace PIXI
	 * @example
	 *      function MyEmitter() {}
	 *
	 *      eventTarget.mixin(MyEmitter.prototype);
	 *
	 *      var em = new MyEmitter();
	 *      em.emit('eventName', 'some data', 'some more data', {}, null, ...);
	 */
	function new();

	/**
     * Return a list of assigned event listeners.
     *
     * @param eventName {String} The events that should be listed.
     * @return {Array} An array of listener functions
     */
	function listeners(eventName:String):Array<Dynamic>;

	/**
     * Emit an event to all registered event listeners.
     *
     * @alias dispatchEvent
     * @param eventName {String} The name of the event.
     * @return {Bool} Indication if we've emitted an event.
     */
	function emit(eventName:String, ?data:EventData):Bool;
	function dispatchEvent(eventName:String, ?data:EventData):Bool;

	/**
     * Register a new EventListener for the given event.
     *
     * @alias addEventListener
     * @param eventName {String} Name of the event.
     * @param callback {Functon} fn Callback function.
     */
	function on(eventName:String, fn:EventData -> Void):Void;
	function addEventListener(eventName:String, fn:EventData -> Void):Void;

	/**
     * Add an EventListener that's only called once.
     *
     * @param eventName {String} Name of the event.
     * @param callback {Function} Callback function.
     */
	function once(eventName:String, fn:EventData -> Void):Void;

	/**
     * Remove event listeners.
     *
     * @alias removeEventListener
     * @param eventName {String} The event we want to remove.
     * @param callback {Function} The listener that we need to find.
     */
	function off(eventName:String, fn:EventData -> Void):Void;
	function removeEventListener(eventName:String, fn:EventData -> Void):Void;

	/**
     * Remove all listeners or only the listeners for the specified event.
     *
     * @param eventName {string} The event you want to remove all listeners for.
     */
	function removeAllListeners(eventName:String):Void;
}