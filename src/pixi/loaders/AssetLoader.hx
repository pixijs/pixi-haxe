package phaser.pixi.loaders;

@:native("PIXI.AssetLoader")
extern class AssetLoader {
	
	/**
	 * A Class that loads a bunch of images / sprite sheet / bitmap font files. Once the
	 * assets have been loaded they are added to the PIXI Texture cache and can be accessed
	 * easily through PIXI.Texture.fromImage() and PIXI.Sprite.fromImage()
	 * When all items have been loaded this class will dispatch a 'onLoaded' event
	 * As each individual item is loaded this class will dispatch a 'onProgress' event
	 */
	function new (assetURLs:Dynamic, Boolean:Dynamic);
	
	/**
	 * The array of asset URLs that are going to be loaded
	 */
	var assetURLs:Dynamic;
	
	/**
	 * Whether the requests should be treated as cross origin
	 */
	var crossorigin:Bool;
	
	/**
	 * Maps file extension to loader types
	 */
	var loadersByType:Dynamic;
	
}
