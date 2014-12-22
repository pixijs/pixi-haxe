package pixi.filters;

@:native("PIXI.FilterBlock")
extern class FilterBlock {

	/**
	 * A target and pass info object for filters.
	 *
	 * @class FilterBlock
	 * @constructor
	 */
	function new():Void;

	/**
	 * The renderable state of this FilterBlock.
	 */
	var renderable:Bool;

	/**
	 * The visible state of this FilterBlock.
	 */
	var visible:Bool;
}