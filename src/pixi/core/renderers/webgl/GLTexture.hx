package pixi.core.renderers.webgl;

@:native("PIXI.RenderTarget")
extern class GLTexture {

	function new();
	
	/**
	 * Texture contents dirty flag
	 */
	var dirtyId:Int;
	
	/**
	 * Texture style dirty flag
	 */
	var dirtyStyleId:Int;
	
	/**
	 * Height of texture that was used in texImage2D
	 */
	var height:Float;
	
	/**
	 * Type copied from baseTexture
	 */
	var internalFormat:Int;
	
	/**
	 * Whether mip levels has to be generated
	 */
	var mipmap:Bool;
	
	/**
	 * The WebGL texture
	 */
	var texture:Dynamic; // TODO: actual type: WebGLTexture
	
	/**
	 * Type copied from baseTexture
	 */
	var type:Int;
	
	/**
	 * Width of texture that was used in texImage2D
	 */
	var width:Float;
	
	/**
	 * WrapMode copied from baseTexture
	 */
	var wrapMode:Int;
	
}