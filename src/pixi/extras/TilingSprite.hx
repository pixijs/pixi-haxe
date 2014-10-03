package phaser.pixi.extras;

@:native("PIXI.TilingSprite")
extern class TilingSprite extends phaser.pixi.display.Sprite {
	
	/**
	 * The scaling of the image that is being tiled
	 */
	var tileScale:Dynamic;
	
	/**
	 * A point that represents the scale of the texture object
	 */
	var tileScaleOffset:Dynamic;
	
	/**
	 * The offset position of the image that is being tiled
	 */
	var tilePosition:Dynamic;
	
}
