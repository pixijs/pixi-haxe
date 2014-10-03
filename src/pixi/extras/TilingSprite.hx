package pixi.extras;

@:native("PIXI.TilingSprite")
extern class TilingSprite extends pixi.display.Sprite {

	/**
	 * A tiling sprite is a fast way of rendering a tiling image
	 *
	 * @class TilingSprite
	 * @extends Sprite
	 * @constructor
	 * @param texture {Texture} the texture of the tiling sprite
	 * @param width {Number}  the width of the tiling sprite
	 * @param height {Number} the height of the tiling sprite
	*/
	public function new(texture:Dynamic, width:Float, height:Float):Void;
	
	/**
	 * The scaling of the image that is being tiled
	 */
	public var tileScale:Dynamic;
	
	/**
	 * A point that represents the scale of the texture object
	 */
	public var tileScaleOffset:Dynamic;
	
	/**
	 * The offset position of the image that is being tiled
	 */
	public var tilePosition:Dynamic;

	public var tint:Dynamic;

	public var blendMode:Dynamic;

	/*
	 * Sets the texture
	 *
	 * @method setTexture
	 * @param texture {Texture} the texture that will be used
	*/
	public function setTexture(texture:Dynamic):Void;
	
}
