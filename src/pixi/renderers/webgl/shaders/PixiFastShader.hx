package phaser.pixi.renderers.webgl.shaders;

@:native("PIXI.PixiFastShader")
extern class PixiFastShader {
	
	/**
	 * @class PixiFastShader
	 */
	function new (WebGLContext:Dynamic);
	
	/**
	 * @property gl
	 */
	var gl:Dynamic;
	
	/**
	 * The WebGL program.
	 */
	var program:Dynamic;
	
	/**
	 * The fragment shader.
	 */
	var fragmentSrc:Array<Dynamic>;
	
	/**
	 * The vertex shader
	 */
	var vertexSrc:Array<Dynamic>;
	
	/**
	 * A local texture counter for multi-texture shaders.
	 */
	var textureCount:Float;
	
}
