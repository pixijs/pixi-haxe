package pixi.filters.noise;

import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.NoiseFilter")
extern class NoiseFilter extends Filter {


	/**
	 * @author Vico @vicocotea
	 * original filter: https://github.com/evanw/glfx.js/blob/master/src/filters/adjust/noise.js
	 */

	/**
	 * A Noise effect filter.
	 *
	 * @class
	 * @extends PIXI.Filter
	 * @memberof PIXI.filters
	 */

	/**
     * @param {Float} noise - The noise intensity, should be a normalized value in the range [0, 1].
     * @param {Float} seed - A random seed for the noise generation. Default is `Math.random()`.
     */
	function new(?noise:Float, ?seed:Float);

	/**
     * The amount of noise to apply, this value should be in the range (0, 1].
     *
     * @member {Float}
     * @default 0.5
     */
	var noise:Float;

	/**
     * A seed value to apply to the random noise generation. `Math.random()` is a good value to use.
     *
     * @member {Float}
     */
	var seed:Float;
}