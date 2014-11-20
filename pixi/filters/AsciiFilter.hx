package pixi.filters;

@:native("PIXI.AsciiFilter")
extern class AsciiFilter extends AbstractFilter {

	/**
	 * An ASCII filter.
	 *
	 * @class AsciiFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The pixel size used by the filter.
	 *
	 * @property size
	 * @type Number
	 */
	var size:Float;
}