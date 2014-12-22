package pixi.filters;

@:native("PIXI.DotScreenFilter")
extern class DotScreenFilter extends AbstractFilter {

	/**
	 * This filter applies a dotscreen effect making display objects appear to be made out of black and white halftone dots like an old printer.
	 *
	 * @class DotScreenFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The scale of the effect.
	 */
	var scale:Float;

	/**
	 * The radius of the effect.
	 */
	var angle:Float;

}