package pixi.filters;

@:native("PIXI.NoiseFilter")
extern class NoiseFilter extends AbstractFilter {

	/**
	 * A Noise effect filter.
	 *
	 * @class NoiseFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * The amount of noise to apply.
	 * @property noise
	 * @type Number
	*/
	var noise:Float;
}