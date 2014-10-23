package pixi.filters;

@:native("PIXI.PixelateFilter")
extern class PixelateFilter {
	
	function new():Void;
	
	/**
	 * This a point that describes the size of the blocs. x is the width of the block and y is the the height
	 */
	var size:Dynamic;
	
}
