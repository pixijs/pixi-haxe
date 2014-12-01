package pixi.utils;

@:native("PIXI.EventTarget")
extern class EventTarget {

	/**
	 * Mixins event emitter functionality to a class
	 *
	 * @class EventTarget
	 * @example
	 *      function MyEmitter() {}
	 *
	 *      PIXI.EventTarget.mixin(MyEmitter.prototype);
	 *
	 *      var em = new MyEmitter();
	 *      em.emit('eventName', 'some data', 'some more data', {}, null, ...);
	 */
	function new();

	/**
	 * Return a list of assigned event listeners.
	 *
	 * @method listeners
	 * @param eventName {String} The events that should be listed.
	 * @returns {Array<Dynamic>} An array of listener functions
	 */
	function listeners(eventName:String):Array<Dynamic>;

	/**
	 * Emit an event to all registered event listeners.
	 *
	 * @method emit
	 * @alias dispatchEvent
	 * @param eventName {String} The name of the event.
	 * @returns {Bool} Indication if we've emitted an event.
	 */
    function emit(eventName:String, ?data:Dynamic):Bool;
	function dispatchEvent(eventName:String, ?data:Dynamic):Bool;

	/**
	 * Register a new EventListener for the given event.
	 *
	 * @method on
	 * @alias addEventListener
	 * @param eventName {String} Name of the event.
	 * @param callback {Functon} Callback function.
	 */
	function on(eventName:String, callback:Dynamic):Void;
	function addEventListener(eventName:String, fn:Dynamic):Void;

	/**
	 * Add an EventListener that's only called once.
	 *
	 * @method once
	 * @param eventName {String} Name of the event.
	 * @param callback {Function} Callback function.
	 */
	function once(eventName:String, callback:Dynamic):Void;

	/**
	 * Remove event listeners.
	 *
	 * @method off
	 * @alias removeEventListener
	 * @param eventName {String} The event we want to remove.
	 * @param callback {Function} The listener that we need to find.
	 */
	function off(eventName:String, callback:Dynamic):Void;
	function removeEventListener(eventName:String, callback:Dynamic):Void;

	/**
	 * Remove all listeners or only the listeners for the specified event.
	 *
	 * @method removeAllListeners
	 * @param eventName {String} The event you want to remove all listeners for.
	 */
	function removeAllEventListeners(eventName:String):Void;
}