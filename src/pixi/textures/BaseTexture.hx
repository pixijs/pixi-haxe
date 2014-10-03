package pixi.textures;

@:native("PIXI.BaseTexture")
extern class BaseTexture {
	
	/**
	 * @author Mat Groves <a href='http://matgroves.com/'>http://matgroves.com/</a> @Doormat23
	 */
	var BaseTextureCache:Dynamic;
	
	/**
	 * A texture stores the information that represents an image. All textures have a base texture
	 */
	function new (String:Dynamic, Number:Dynamic);
	
	/**
	 * [read-only] The width of the base texture set when the image has loaded
	 */
	var width:Float;
	
	/**
	 * [read-only] The height of the base texture set when the image has loaded
	 */
	var height:Float;
	
	/**
	 * The scale mode to apply when scaling this texture
	 */
	var scaleMode:Dynamic;
	
	/**
	 * [read-only] Describes if the base texture has loaded or not
	 */
	var hasLoaded:Bool;
	
	/**
	 * The source that is loaded to create the texture
	 */
	var source:Dynamic;
	
	/**
	 * Controls if RGB channels should be premultiplied by Alpha  (WebGL only)
	 */
	var a0:Bool;
	
}
