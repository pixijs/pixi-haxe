package pixi.filters;

import pixi.core.Point;

@:native("PIXI.PixelateFilter")
extern class PixelateFilter extends AbstractFilter {

	/**
	 * This filter applies a pixelate effect making display objects appear 'blocky'.
	 *
	 * @class PixelateFilter
	 * @extends AbstractFilter
	 * @constructor
	 */
	function new():Void;

	/**
	 * This a point that describes the size of the blocs. x is the width of the block and y is the the height.
	 */
	var size:Point;

}