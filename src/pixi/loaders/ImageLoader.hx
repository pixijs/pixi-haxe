package phaser.pixi.loaders;

@:native("PIXI.ImageLoader")
extern class ImageLoader {
	
	/**
	 * The image loader class is responsible for loading images file formats ('jpeg', 'jpg', 'png' and 'gif')
	 * Once the image has been loaded it is stored in the PIXI texture cache and can be accessed though PIXI.Texture.fromFrame() and PIXI.Sprite.fromFrame()
	 * When loaded this class will dispatch a 'loaded' event
	 */
	function new (String:Dynamic, Boolean:Dynamic);
	
	/**
	 * The texture being loaded
	 */
	var texture:Dynamic;
	
	/**
	 * if the image is loaded with loadFramedSpriteSheet
	 * frames will contain the sprite sheet frames
	 */
	var frames:Dynamic;
	
}
