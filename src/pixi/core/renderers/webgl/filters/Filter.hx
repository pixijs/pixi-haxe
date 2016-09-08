package pixi.core.renderers.webgl.filters;

@:native("PIXI.Filter")
extern class Filter {

	/**
	 * The default vertex shader source
	 *
	 * @static
	 * @constant
	 */
	static var defaultVertexSrc:Dynamic;

	/**
	 * The default fragment shader source
	 *
	 * @static
	 * @constant
	 */
	static var defaultFragmentSrc:Dynamic;

	/**
	 * @class
	 * @memberof PIXI
	 * @param [vertexSrc] {String} The source of the vertex shader.
	 * @param [fragmentSrc] {String} The source of the fragment shader.
	 * @param [uniforms] {Dynamic} Custom uniforms to use to augment the built-in ones.
	 */
	function new(?vertexSrc:String, ?fragmentSrc:String, ?uniforms:Dynamic);

	/**
     * The vertex shader.
     *
     * @member {String}
     */
	var vertexSrc:String;

	/**
     * The fragment shader.
     *
     * @member {String}
     */
	var fragmentSrc:String;

	/*
	 * Applies the filter
	 * @param filterManager {Dynamic}
	 * @param input {RenderTarget}
	 * @param output {RenderTarget}
	 * @param clear {Bool} Whether or not we want to clear the outputTarget
	 */
	function apply(filterManager:Dynamic, input:Dynamic, output:Dynamic, ?clear:Bool):Void;
}