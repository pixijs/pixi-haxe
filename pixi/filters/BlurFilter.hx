package pixi.filters;

@:native("PIXI.BlurFilter")
extern class BlurFilter {
	
	function new():Void;

	/**
	 * Sets the strength of both the blurX and blurY properties simultaneously
	 */
	var blur:Float;
	
	/**
	 * Sets the strength of the blurX property
	 */
	var blurX:Float;
	
	/**
	 * Sets the strength of the blurX property
	 */
	var blurY:Float;
	
}
