package phaser.pixi.filters;

@:native("PIXI.AbstractFilter")
extern class AbstractFilter {
	
	/**
	 * This is the base class for creating a pixi.js filter. Currently only webGL supports filters.
	 * If you want to make a custom filter this should be your base class.
	 */
	function new (a0:Dynamic, a1:Dynamic);
	
	/**
	 * An array of passes - some filters contain a few steps this array simply stores the steps in a liniear fashion.
	 * For example the blur filter has two passes blurX and blurY.
	 */
	var passes:Array<Dynamic>;
	
	/**
	 * @property shaders
	 */
	var shaders:Dynamic;
	
	/**
	 * @property uniforms
	 */
	var uniforms:Dynamic;
	
	/**
	 * @property fragmentSrc
	 */
	var fragmentSrc:Dynamic;
	
}
