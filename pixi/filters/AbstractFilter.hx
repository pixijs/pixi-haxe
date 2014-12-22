package pixi.filters;

@:native("PIXI.AbstractFilter")
extern class AbstractFilter {

	/**
	 * This is the base class for creating a pixi.js filter. Currently only webGL supports filters.
	 * If you want to make a custom filter this should be your base class.
	 * @class AbstractFilter
	 * @constructor
	 * @param [fragmentSrc] {Array<String>}
	 * @param [uniforms] {Dynamic}
	 */
	function new(?fragmentSrc:Array<String>, ?uniforms:Dynamic);

	/**
	 * Syncs the uniforms between the class object and the shaders.
	 *
	 * @method syncUniforms
	 */
	function syncUniforms():Void;

	/**
	* @property dirty
	* @type Bool
	*/
	var dirty:Bool;

	/**
	* @property padding
	* @type Float
	*/
	var padding:Float;

	/**
	* An array of passes - some filters contain a few steps this array simply stores the steps in a liniear fashion.
	* For example the blur filter has two passes blurX and blurY.
	* @property passes
	* @type Array<AbstractFilter> an array of filter objects
	*/
	var passes:Array<AbstractFilter>;

	/**
	* @property shaders
	* @type Array an array of shaders
	*/
	var shaders:Array<Dynamic>;

	/**
	* @property uniforms
	* @type object
	* @private
	*/
	var uniforms:Dynamic;

	/**
	* @property fragmentSrc
	* @type Array
	* @private
	*/
	var fragmentSrc:Array<String>;
}