package phaser.pixi.renderers.webgl.shaders;

@:native("PIXI.PixiShader")
extern class PixiShader {
	
	/**
	 * @class PixiShader
	 */
	function new ();
	
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
	 * A local texture counter for multi-texture shaders.
	 */
	var textureCount:Float;
	
	/**
	 * The Default Vertex shader source
	 */
	var defaultVertexSrc:String;
	
}
