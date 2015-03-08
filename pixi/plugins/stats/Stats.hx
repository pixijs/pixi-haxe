package pixi.plugins.stats;

import js.html.DivElement;

@:native("Stats")
extern class Stats {

	/**
	 * Stats DOM element
	 * @property domElement
	 * @type DivElement
	 */
	var domElement(default, null):DivElement;

	/**
	 * https://github.com/mrdoob/stats.js/ (JS stats)
	 * https://github.com/luizbills/stats.js.hx (Original Haxe Externs
	**/
	function new();

	/**
	 * Begin stats
	 *
	 * @method begin
	 */
	function begin():Void;

	/**
	 * End stats
	 *
	 * @method end
	 */
	function end():Void;

	/**
	 * Update stats
	 *
	 * @method update
	 */
	function update():Void;

	/**
	 * Sets the display mode.
	 *
	 * @method setMode
	 * @param value {Int} 0: fps, 1: ms
	 */
	function setMode(value:Int):Void;
}