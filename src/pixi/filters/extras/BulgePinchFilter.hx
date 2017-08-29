package pixi.filters.extras;

import pixi.core.math.Point;

@:native("PIXI.filters.BulgePinchFilter")
extern class BulgePinchFilter {

	/**
	* @author Julien CLEREL @JuloxRox
	* original filter https://github.com/evanw/glfx.js/blob/master/src/filters/warp/bulgepinch.js by Evan Wallace : http://madebyevan.com/
	*/

	/**
	* @filter Bulge / Pinch
	* @description Bulges or pinches the image in a circle.
	* @param center The x and y coordinates of the center of the circle of effect.
	* @param radius The radius of the circle of effect.
	* @param strength -1 to 1 (-1 is strong pinch, 0 is no effect, 1 is strong bulge)
	*
	* @class BulgePinchFilter
	* @extends AbstractFilter
	* @constructor
	*/
	function new();

	/**
     * The radius of the circle of effect.
     *
     * @property radius
     * @type Float
     */
	var radius:Float;

	/**
     * The strength of the effect. -1 to 1 (-1 is strong pinch, 0 is no effect, 1 is strong bulge)
     *
     * @property strength
     * @type Float
     */
	var strength:Float;

	/**
     * The x and y coordinates of the center of the circle of effect.
     *
     * @property center
     * @type Point
     */
	var center:Point;
}