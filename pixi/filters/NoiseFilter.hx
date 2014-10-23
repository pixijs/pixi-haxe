package pixi.filters;

@:native("PIXI.NoiseFilter")
extern class NoiseFilter {

	function new():Void;

	/**
	 * The amount of noise to apply.
	 * @property noise
	 * @type Number
	*/
	var noise:Float;
}