package pixi.core;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI.Shader")
extern class Shader {

	/**
	 * Wrapper class, webGL Shader for Pixi.
	 * Adds precision string if vertexSrc or fragmentSrc have no mention of it.
	 *
	 * @class
	 * @memberof PIXI
	 * @param gl {WebGLRenderingContext} The current WebGL rendering context
	 * @param vertexSrc {string|string[]} The vertex shader source as an array of strings.
	 * @param fragmentSrc {string|string[]} The fragment shader source as an array of strings.
	 */
	function new(gl:WebGLRenderer, vertexSrc:Dynamic, framentSrc:Dynamic);
	
	/**
	 * 
	 * @param	src {string|string[]}
	 * @return {string|string[]}
	 */
	function checkPrecision(src:Dynamic):Dynamic
}