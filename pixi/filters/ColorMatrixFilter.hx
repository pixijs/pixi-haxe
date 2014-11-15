package pixi.filters;

@:native("PIXI.ColorMatrixFilter")
extern class ColorMatrixFilter {
	
	function new():Void;
	
	/**
	 * Sets the matrix of the color matrix filter
	 */
	var matrix:Array<Dynamic>;
	
}
