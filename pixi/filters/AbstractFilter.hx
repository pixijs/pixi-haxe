package pixi.filters;

@:native("PIXI.AbstractFilter")
extern class AbstractFilter {

	/**
	 * This is the base class for creating a pixi.js filter. Currently only webGL supports filters.
	 * If you want to make a custom filter this should be your base class.
	 * @class AbstractFilter
	 * @constructor
	 * @param fragmentSrc
	 * @param uniforms
	*/
	function new(fragmentSrc:Array<String>, uniforms:Dynamic);

	/**
	 * Syncs the uniforms between the class object and the shaders.
	 *
	 * @method syncUniforms
	 */
	function syncUniforms():Void;

	/**
    * @property dirty
    * @type Boolean
    */
	var dirty:Bool;

	/**
    * @property padding
    * @type Number
    */
	var padding:Float;
}