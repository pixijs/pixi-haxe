package pixi.filters;

@:native("PIXI.ColorMatrixFilter")
extern class ColorMatrixFilter extends AbstractFilter {

	/**
	 * The ColorMatrixFilter class lets you apply a 4x4 matrix transformation on the RGBA
	 * color and alpha values of every pixel on your displayObject to produce a result
	 * with a new set of RGBA color and alpha values. It's pretty powerful!
	 *
	 * @class ColorMatrixFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * Sets the matrix of the color matrix filter
	 */
	var matrix:Array<Int>;

}