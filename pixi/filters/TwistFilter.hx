package pixi.filters;

@:native("PIXI.TwistFilter")
extern class TwistFilter {
	
	function new():Void;
	
	/**
	 * This point describes the the offset of the twist
	 */
	var size:Dynamic;
	
	/**
	 * This radius describes angle of the twist
	 */
	var angle:Float;
	
}
