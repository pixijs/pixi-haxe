package pixi.core.ticker;

import pixi.interaction.EventEmitter;

@:native("PIXI.ticker.Ticker")
extern class Ticker extends EventEmitter {

	/**
	 * A Ticker class that runs an update loop that other objects listen to
	 *
	 * @class
	 * @memberof PIXI.extras
	 */
	function new();

	/**
	 * Whether or not this ticker should invoke the method start automatically when a listener is added.
	 *
	 * @member {Bool}
	 */
	var autoStart:Bool;	

	/**
	 * Scalar time value from last frame to this frame. This value is capped by setting minFPS and is scaled with speed. Note: The cap may be exceeded by scaling.
	 *
	 * @member {Float}
	 */
	var deltaTime:Float;

	/**
	 * Time elapsed in milliseconds from last frame to this frame. Opposed to what the scalar deltaTime is based, this value is neither capped nor scaled. If the platform supports DOMHighResTimeStamp, this value will have a precision of 1 µs.
	 *
	 * @member {Float}
	 */
	var elapsedMS:Float;

	/**
	 * The frames per second at which this ticker is running. The default is approximately 60 in most modern browsers. Note: This does not factor in the value of speed, which is specific to scaling deltaTime.
	 *
	 * @member {UInt}
	 */
	var FPS (default,null) :UInt;	
	
	/**
	 * The last time update was invoked. This value is also reset internally outside of invoking update, but only when a new animation frame is requested. If the platform supports DOMHighResTimeStamp, this value will have a precision of 1 µs.
	 *
	 * @member {Float}
	 */
	var lastTime:Float;

	/**
	 * Manages the maximum amount of milliseconds allowed to elapse between invoking update. This value is used to cap deltaTime, but does not effect the measured value of FPS. When setting this property it is clamped to a value between 0 and PIXI.TARGET_FPMS * 1000.
	 *
	 * @member {UInt}
	 */
	var minFPS:UInt;
	
	/**
	 * Factor of current deltaTime.
	 *
	 * @member {Float}
	 */
	var speed:Float;
	
	/**
	 * Whether or not this ticker has been started. true if start has been called. false if stop has been called. While false, this value may change to true in the event of autoStart being true and a listener is added.
	 *
	 * @member {Bool}
	 */
	var started:Bool;		
	
	/**
	 * Calls EventEmitter.on internally for the
	 * internal 'tick' event. It checks if the emitter has listeners,
	 * and if so it requests a new animation frame at this point.
	 *
	 * @param fn {Function} The listener function to be added for updates
	 * @param [context] {Function} The listener context
	 * @returns {Ticker} this
	 */
	function add (fn:Void->Void, ?context:Void->Void):Ticker;

	/**
	 * Calls EventEmitter.once internally for the
	 * internal 'tick' event. It checks if the emitter has listeners,
	 * and if so it requests a new animation frame at this point.
	 *
	 * @param fn {Function} The listener function to be added for one update
	 * @param [context] {Function} The listener context
	 * @returns {Ticker} this
	 */	
	function addOnce (fn:Void->Void, ?context:Void->Void):Ticker;
	
	/**
	 * Calls EventEmitter.off internally for 'tick' event.
	 * It checks if the emitter has listeners for 'tick' event.
	 * If it does, then it cancels the animation frame.
	 *
	 * @param [fn] {Function} The listener function to be removed
	 * @param [context] {Function} The listener context to be removed
	 * @returns {Ticker} this
	 */	
	function remove (fn:Void->Void, ?context:Void->Void):Ticker;
	
	/**
	 * Starts the ticker. If the ticker has listeners
	 * a new animation frame is requested at this point.
	 */
	function start():Void;

	/**
	 * Stops the ticker. If the ticker has requested
	 * an animation frame it is canceled at this point.
	 */
	function stop():Void;

	/**
	 * Triggers an update. An update entails setting the
	 * current elapsedMS,
	 * the current deltaTime,
	 * invoking all listeners with current deltaTime,
	 * and then finally setting lastTime
	 * with the value of currentTime that was provided.
	 * This method will be called automatically by animation
	 * frame callbacks if the ticker instance has been started
	 * and listeners are added.
	 *
	 * @param [currentTime=performance.now()] {DOMHighResTimeStamp|number} the current time of execution
	 */
	function update(?currentTime:Float):Void;
}