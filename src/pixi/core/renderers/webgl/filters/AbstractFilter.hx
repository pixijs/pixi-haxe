package pixi.core.renderers.webgl.filters;

@:native("PIXI.AbstractFilter")
extern class AbstractFilter {

	/**
	 * This is the base class for creating a PIXI filter. Currently only WebGL supports filters.
	 * If you want to make a custom filter this should be your base class.
	 *
	 * @class
	 * @memberof PIXI
	 * @param vertexSrc {String|String[]} The vertex shader source as an array of strings.
	 * @param fragmentSrc {String|String[]} The fragment shader source as an array of strings.
	 * @param uniforms {object} An object containing the uniforms for this filter.
	 */
	@:overload(function(vertexSrc:Array<String>, fragmentSrc:Array<String>, uniforms:Dynamic):Void {})
	function new(vertexSrc:String, fragmentSrc:String, uniforms:Dynamic);

	/**
	 * The extra padding that the filter might need
	 * @member {number}
	 */
	var padding:Float;

	/*
	 * Grabs a shader from the current renderer
	 * @param renderer {WebGLRenderer} The renderer to retrieve the shader from
	 *
	 */
	function getShader(renderer:WebGLRenderer):Dynamic;

	/*
	 * Applies the filter
	 * @param renderer {WebGLRenderer} The renderer to retrieve the filter from
	 * @param input {RenderTarget}
	 * @param output {RenderTarget}
	 * @param clear {Bool} Whether or not we want to clear the outputTarget
	 */
	function applyFilter(renderer:WebGLRenderer, input:Dynamic, output:Dynamic, clear:Bool):Void;

	/**
	 * Syncs a uniform between the class object and the shaders.
	 *
	 */
	function syncUniform(uniform:Dynamic):Void;
}