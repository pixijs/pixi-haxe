package pixi.filters;

@:native("PIXI.SepiaFilter")
extern class SepiaFilter extends AbstractFilter {

	/**
	 * This applies a sepia effect to your Display Objects.
	 *
	 * @class SepiaFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The strength of the sepia. 1 will apply the full sepia effect, 0 will make the object its normal color/
	 */
	var sepia:Float;

}