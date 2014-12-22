package pixi.filters;

@:native("PIXI.ConvolutionFilter")
extern class ConvolutionFilter extends AbstractFilter {

	/**
	 * The ConvolutionFilter class applies a matrix convolution filter effect.
	 * A convolution combines pixels in the input image with neighboring pixels to produce a new image.
	 * A wide variety of image effects can be achieved through convolutions, including blurring, edge detection, sharpening, embossing, and beveling.
	 * The matrix should be specified as a 9 point Array. See http://docs.gimp.org/en/plug-in-convmatrix.html for more info.
	 *
	 * @class ConvolutionFilter
	 * @extends AbstractFilter
	 * @constructor
	 * @param matrix {Array} An array of values used for matrix transformation. Specified as a 9 point Array.
	 * @param width {Number} Width of the object you are transforming
	 * @param height {Number} Height of the object you are transforming
	 */
	function new(matrix:Array<Int>, width:Float, height:Float):Void;

	/**
	 * Sets the matrix of the color matrix filter
	 */
	var matrix:Array<Int>;

	/**
	 * Width of the object you are transforming
	 */
	var width:Float;

	/**
	 * Height of the object you are transforming
	 */
	var height:Float;

}