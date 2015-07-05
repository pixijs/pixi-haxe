package pixi.filters.pixelate;

import pixi.core.math.Point;
import pixi.core.renderers.webgl.filters.AbstractFilter;

@:native("PIXI.filters.PixelateFilter")
extern class PixelateFilter extends AbstractFilter {

	/**
	 * This filter applies a pixelate effect making display objects appear 'blocky'.
	 *
	 * @class
	 * @extends PIXI.AbstractFilter
	 * @memberof PIXI.filters
	 */
	function new();

	/**
     * This a point that describes the size of the blocks.
     * x is the width of the block and y is the height.
     *
     * @member {Point}
     * @memberof PixelateFilter#
     */
	var size:Point;
}