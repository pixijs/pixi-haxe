package pixi.filters.extras;

import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.GlowFilter")
extern class GlowFilter extends Filter {

	/**
	 * GlowFilter, originally by mishaa
	 * http://www.html5gamedevs.com/topic/12756-glow-filter/?hl=mishaa#entry73578
	 * http://codepen.io/mishaa/pen/raKzrm
	 *
	 * @class
	 * @param distance {Float} The distance of the glow. Make it 2 times more for resolution=2. It cant be changed after filter creation
	 * @param outerStrength {Float} The strength of the glow outward from the edge of the sprite.
	 * @param innerStrength {Float} The strength of the glow inward from the edge of the sprite.
	 * @param color {Int} The color of the glow.
	 * @param quality {Float} A number between 0 and 1 that describes the quality of the glow.
	 *
	 * @example
	 *  someSprite.filters = [
	 *      new GlowFilter(15, 2, 1, 0xFF0000, 0.5)
	 *  ];
	 */
	function new(distance:Float, outerStrength:Float, innerStrength:Float, color:Int, quality:Float);

	var color:Int;
	var outerStrength:Float;
	var innerStrength:Float;
}