package pixi.extras;

import pixi.core.utils.EventData;

@:native("PIXI.Ticker")
extern class Ticker {

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
     * the event data for this ticker to dispatch the tick event
     *
     * @member {EventData}
     */
	var eventData:EventData;

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