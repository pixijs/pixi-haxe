package pixi.filters;

@:native("PIXI.RGBSplitFilter")
extern class RGBSplitFilter extends AbstractFilter {

	/**
	 * An RGB Split Filter.
	 *
	 * @class RGBSplitFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The angle of the split.
	 */
	var angle:Float;

}