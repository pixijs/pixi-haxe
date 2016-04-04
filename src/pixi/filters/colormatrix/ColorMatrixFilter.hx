package pixi.filters.colormatrix;

import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.ColorMatrixFilter")
extern class ColorMatrixFilter extends Filter {

	/**
	 * The ColorMatrixFilter class lets you apply a 5x5 matrix transformation on the RGBA
	 * color and alpha values of every pixel on your displayObject to produce a result
	 * with a new set of RGBA color and alpha values. It's pretty powerful!
	 *
	 * ```js
	 *  var colorMatrix = new ColorMatrixFilter();
	 *  container.filters = [colorMatrix];
	 *  colorMatrix.contrast(2);
	 * ```
	 * @author Clément Chenebault <clement@goodboydigital.com>
	 * @class
	 * @extends AbstractFilter
	 * @memberof PIXI.filters
	 */
	function new();

	/**
     * Sets the matrix of the color matrix filter
     *
     * @member {number[]}
     * @memberof ColorMatrixFilter#
     * @default [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
     */
	var matrix:Array<Float>;

	/**
	 * Adjusts brightness
	 *
	 * Multiply the current matrix
	 * @param b {Float} value of the brigthness (0 is black)
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function brightness(b:Float, multiply:Bool):Void;

	/**
	 * Set the matrices in grey scales
	 *
	 * Multiply the current matrix
	 * @param scale {Float} value of the grey (0 is black)
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function greyscale(scale:Float, multiply:Bool):Void;

	/**
	 * Set the black and white matrice
	 * Multiply the current matrix
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function blackAndWhite(multiply:Bool):Void;

	/**
	 * Set the hue propertie of the color
	 *
	 * Multiply the current matrix
	 * @param rotation {Float} in degrees
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function hue(rotation:Float, multiply:Bool):Void;

	/**
	 * Set the contrast matrix, increase the separation between dark and bright
	 * Increase contrast : shadows darker and highlights brighter
	 * Decrease contrast : bring the shadows up and the highlights down
	 *
	 * @param amount {Float} value of the contrast
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function contrast(amount:Float, multiply:Bool):Void;

	/**
	 * Set the saturation matrix, increase the separation between colors
	 * Increase saturation : increase contrast, brightness, and sharpness
	 * @param amount {Float}
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function saturation(amount:Float, multiply:Bool):Void;

	/**
	 * Desaturate image (remove color)
	 *
	 * Call the saturate function
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function desaturate(multiply:Bool):Void;

	/**
	 * Negative image (inverse of classic rgb matrix)
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function negative(multiply:Bool):Void;

	/**
	 * Sepia image
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function sepia(multiply:Bool):Void;

	/**
	 * Color motion picture process invented in 1916 (thanks Dominic Szablewski)
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function technicolor(multiply:Bool):Void;

	/**
	 * Polaroid filter
	 *
	 * @param multiply {boolean} refer to ._loadMatrix() method
	 */
	function polaroid(multiply:Bool):Void;

	/**
	 * Filter who transforms : Red -> Blue and Blue -> Red
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function toBGR(multiply:Bool):Void;

	/**
	 * Color reversal film introduced by Eastman Kodak in 1935. (thanks Dominic Szablewski)
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function kodachrome(multiply:Bool):Void;

	/**
	 * Brown delicious browni filter (thanks Dominic Szablewski)
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function browni(multiply:Bool):Void;

	/*
	 * Vintage filter (thanks Dominic Szablewski)
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function vintage(multiply:Bool):Void;

	/*
	 * We don't know exactly what it does, kind of gradient map, but funny to play with!
	 *
	 * @param desaturation {Float}
	 * @param toned {number}
	 * @param lightColor {Int} (example : "0xFFE580")
	 * @param darkColor {Int}  (example : "0xFFE580")
	 *
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function colorTone(desaturation:Float, toned:Float, lightColor:Int, darkColor:Int, multiply:Bool):Void;

	/*
	 * Night effect
	 *
	 * @param intensity {Float}
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function night(intensity:Float, multiply:Bool):Void;

	/*
	 * Predator effect
	 *
	 * Erase the current matrix by setting a new indepent one
	 *
	 * @param amount {Float} how much the predator feels his future victim
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function predator(amount:Float, multiply:Bool):Void;

	/*
	 * LSD effect
	 *
	 * Multiply the current matrix
	 *
	 * @param amount {Float} How crazy is your effect
	 * @param multiply {Bool} refer to ._loadMatrix() method
	 */
	function lsd(multiply:Bool):Void;

	/*
	 * Reset function
	 *
	 * Erase the current matrix by setting the default one
	 *
	 */
	function reset():Void;
}