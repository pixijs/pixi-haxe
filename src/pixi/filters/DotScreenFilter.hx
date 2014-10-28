package pixi.filters;

@:native("PIXI.DotScreenFilter")
extern class DotScreenFilter {
	
	function new():Void;
	
	/**
	 * This describes the the scale
	 */
	var scale:Float;
	
	/**
	 * This radius describes angle
	 */
	var angle:Float;
	
}
