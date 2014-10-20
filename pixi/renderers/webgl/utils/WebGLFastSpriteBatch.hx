package pixi.renderers.webgl.utils;

@:native("PIXI.WebGLFastSpriteBatch")
extern class WebGLFastSpriteBatch {
	
	/**
	 * @class WebGLFastSpriteBatch
	 */
	function new (gl:Dynamic);
	
	/**
	 * @property vertSize
	 */
	var vertSize:Dynamic;
	
	/**
	 * The number of images in the SpriteBatch before it flushes
	 */
	var size:Float;
	
	/**
	 * Holds the vertices
	 */
	var vertices:Dynamic;
	
	/**
	 * Holds the indices
	 */
	var indices:Dynamic;
	
}
