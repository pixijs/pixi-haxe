package pixi.extras;

import pixi.interaction.EventEmitter;

@:native("PIXI.extras.Ticker")
extern class Ticker extends EventEmitter {

	/**
	 * A Ticker class that runs an update loop that other objects listen to
	 *
	 * @class
	 * @memberof PIXI.extras
	 */
	function new();

	/**
	* Whether or not this ticker runs
	*
	* @member {Bool}
	*/
	var active:Bool;

	/**
	 * The deltaTime
	 *
	 * @member {Float}
	 */
	var deltaTime:Float;

	/**
	 * The time between two frames
	 *
	 * @member {Float}
	 */
	var timeElapsed:Float;

	/**
	 * The time at the last frame
	 *
	 * @member {Float}
	 */
	var lastTime:Float;

	/**
	 * The speed
	 *
	 * @member {Float}
	 */
	var speed:Float;

	/**
	 * Starts the ticker, automatically called by the constructor
	 *
	 */
	function start():Void;

	/**
	 * Stops the ticker
	 *
	 */
	function stop():Void;

	/**
	 * The update loop, fires the 'tick' event
	 *
	 */
	function update():Void;
}