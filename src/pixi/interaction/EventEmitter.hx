package pixi.interaction;

@:native("PIXI.utils.EventEmitter")
extern class EventEmitter {

	/**
	 * Minimal EventEmitter interface that is molded against the Node.js
	 * EventEmitter interface.
	 *
	 * @constructor
	 */
	function new();

	/**
	 * Return a list of assigned event listeners.
	 *
	 * @param {String} eventName
	 * @returns {Array}
	 */
	function listeners(event:String):Array<Dynamic>;

	/**
     * Emit an event to all registered event listeners.
     *
     * @alias dispatchEvent
     * @param eventName {String} The name of the event.
     * @return {Bool} Indication if we've emitted an event.
     */
	function emit(event:String, ?a1:Dynamic, ?a2:Dynamic, ?a3:Dynamic, ?a4:Dynamic, ?a5:Dynamic):Bool;

	/**
	 * Register a new EventListener for the given event.
	 *
	 * @param {String} event Name of the event.
	 * @param {function} fn Callback function.
	 * @param {Mixed} context The context of the function.
	 */
	@:overload(function(event:String, fn:Void -> Void, ?context:Dynamic):Void {})
	@:overload(function(event:String, fn:Dynamic -> Void, ?context:Dynamic):Void {})
	@:overload(function(event:String, fn:Dynamic, ?context:Dynamic):Void {})
	function on(event:String, fn:InteractionEvent -> Void, ?context:Dynamic):Void;

	/**
	 * Add an EventListener that's only called once.
	 *
	 * @param {String} event Name of the event.
	 * @param {function} fn Callback function.
	 * @param {Mixed} context The context of the function.
	 */
	@:overload(function(event:String, fn:Void -> Void, ?context:Dynamic):Void {})
	@:overload(function(event:String, fn:Dynamic -> Void, ?context:Dynamic):Void {})
	@:overload(function(event:String, fn:Dynamic, ?context:Dynamic):Void {})
	function once(event:String, fn:InteractionEvent -> Void, ?context:Dynamic):Void;

	/**
	 * Register a new EventListener for the given event.
	 *
	 * @param {String} event Name of the event.
	 * @param {function} fn Callback function.
	 * @param {Mixed} context The context of the function.
	 */
	@:overload(function(event:String, fn:Void -> Void, ?context:Dynamic):Void {})
	@:overload(function(event:String, fn:Dynamic -> Void, ?context:Dynamic):Void {})
	@:overload(function(event:String, fn:Dynamic, ?context:Dynamic):Void {})
	function addListener(event:String, fn:InteractionEvent -> Void, ?context:Dynamic):Void;

	/**
	 * Remove event listeners.
	 *
	 * @param {String} event The event we want to remove.
	 * @param {function} fn The listener that we need to find.
	 * @param {Bool} once Only remove once listeners.
	 */
	@:overload(function(event:String, fn:Void -> Void, ?once:Bool):Void {})
	@:overload(function(event:String, fn:Dynamic -> Void, ?once:Bool):Void {})
	@:overload(function(event:String, fn:Dynamic, ?once:Bool):Void {})
	function off(event:String, fn:InteractionEvent -> Void, ?once:Bool):Void;

	/**
	 * Remove event listeners.
	 *
	 * @param {String} event The event we want to remove.
	 * @param {function} fn The listener that we need to find.
	 * @param {Bool} once Only remove once listeners.
	 */
	@:overload(function(event:String, fn:Void -> Void, ?once:Bool):Void {})
	@:overload(function(event:String, fn:Dynamic -> Void, ?once:Bool):Void {})
	@:overload(function(event:String, fn:Dynamic, ?once:Bool):Void {})
	function removeListener(event:String, fn:InteractionEvent -> Void, ?once:Bool):Void;

	/**
	 * Remove all listeners or only the listeners for the specified event.
	 *
	 * @param {String} event The event want to remove all listeners for.
	 */
	function removeAllListeners(?event:String):Void;
}