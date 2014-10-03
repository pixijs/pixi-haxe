package phaser.pixi.renderers.webgl.utils;

@:native("PIXI.WebGLSpriteBatch")
extern class WebGLSpriteBatch {
	
	/**
	 * @class WebGLSpriteBatch
	 */
	function new (WebGLContext:Dynamic);
	
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
