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
	function new (fragmentSrc:Dynamic, uniforms:Dynamic);
	
}