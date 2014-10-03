package phaser.pixi.renderers.webgl.shaders;

@:native("PIXI.PrimitiveShader")
extern class PrimitiveShader {
	
	/**
	 * @class PrimitiveShader
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
	 * @property fragmentSrc
	 */
	var fragmentSrc:Dynamic;
	
	/**
	 * @property vertexSrc
	 */
	var vertexSrc:Dynamic;
	
}
