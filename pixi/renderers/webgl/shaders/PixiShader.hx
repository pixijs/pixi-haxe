package pixi.renderers.webgl.shaders;

@:native("PIXI.PixiShader")
extern class PixiShader {

	/**
	 * @class PixiShader
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
	 * @property {number} textureCount - A local texture counter for multi-texture shaders.
	 */
	var textureCount:Float;

	/**
	 * The Default Vertex shader source
	 * @property defaultVertexSrc
	 * @type String
	 */
	var defaultVertexSrc:String;

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

	/**
	 * Initialises the shader uniform values.
	 * Uniforms are specified in the GLSL_ES Specification: http://www.khronos.org/registry/webgl/specs/latest/1.0/
	 * http://www.khronos.org/registry/gles/specs/2.0/GLSL_ES_Specification_1.0.17.pdf
	 *
	 * @method initUniforms
	 */
	function initUniforms():Void;

	/**
	 * Initialises a Sampler2D uniform (which may only be available later on after initUniforms once the texture has loaded)
	 *
	 * @method initSampler2D
	 */
	function initSampler2D(uniform:Dynamic):Void;

	/**
	 * Updates the shader uniform values.
	 *
	 * @method syncUniforms
	 */
	function syncUniforms():Void;
}