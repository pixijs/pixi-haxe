package pixi.filters;

@:native("PIXI.AsciiFilter")
extern class AsciiFilter {
	
	function new():Void;

	/**
	 * The pixel size used by the filter.
	 *
	 * @property size
	 * @type Number
	 */
	var size:Float;
}
