package pixi.filters.extras;

import js.html.Float32Array;

@:native("PIXI.filters.ColorReplaceFilter")
extern class ColorReplaceFilter {

	/**
	 * ColorReplaceFilter, originally by mishaa, updated by timetocode
	 * http://www.html5gamedevs.com/topic/10640-outline-a-sprite-change-certain-colors/?p=69966
	 *
	 * @class
	 * @param originalColor {Float32Array} The color that will be changed, as a 3 component RGB e.g. new Float32Array(1.0, 1.0, 1.0)
	 * @param newColor {Float32Array} The resulting color, as a 3 component RGB e.g. new Float32Array(1.0, 0.5, 1.0)
	 * @param epsilon {Float} Tolerance/sensitivity of the floating-point comparison between colors (lower = more exact, higher = more inclusive)
	 *
	 * @example
	 *  // replaces true red with true blue
	 *  someSprite.shader = new ColorReplaceFilter(
	 *   new Float32Array([1, 0, 0]),
	 *   new Float32Array([0, 0, 1]),
	 *   0.001
	 *  );
	 *  // replaces the RGB color 220, 220, 220 with the RGB color 225, 200, 215
	 *  someOtherSprite.shader = new ColorReplaceFilter(
	 *   new Float32Array([220/255.0, 220/255.0, 220/255.0]),
	 *   new Float32Array([225/255.0, 200/255.0, 215/255.0]),
	 *   0.001
	 *  );
	 *
	 */
	function new(originalColor:Float32Array, newColor:Float32Array, epsilon:Float);

	var originalColor:Dynamic;
	var newColor:Dynamic;
	var epsilon:Float;
}