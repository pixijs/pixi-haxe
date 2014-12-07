package pixi.renderers.webgl.shaders;

@:native("PIXI.PrimitiveShader")
extern class PrimitiveShader {

	/**
	 * @class PrimitiveShader
	 * @constructor
	 * @param gl {WebGLContext} the current WebGL drawing context
	 */
	function new(gl:Dynamic);

	/**
	 * @property gl
	 * @type WebGLContext
	 */
	var gl:Dynamic;

	/**
	 * @property {any} program - The WebGL program.
	 */
	var program:Dynamic;

	/**
	 * @property {array} fragmentSrc - The fragment shader.
	 */
	var fragmentSrc:Array<Dynamic>;

	/**
	 * @property {array} vertexSrc - The vertex shader
	 */
	var vertexSrc:Array<Dynamic>;

	/**
	 * Initialises the shader
	 * @method init
	 *
	 */
	function init():Void;

	/**
	 * Destroys the shader
	 * @method destroy
	 *
	 */
	function destroy():Void;
}