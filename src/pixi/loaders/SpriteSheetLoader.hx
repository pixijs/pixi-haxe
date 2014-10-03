package phaser.pixi.loaders;

@:native("PIXI.SpriteSheetLoader")
extern class SpriteSheetLoader {
	
	/**
	 * The sprite sheet loader is used to load in JSON sprite sheet data
	 * To generate the data you can use <a href='http://www.codeandweb.com/texturepacker'>http://www.codeandweb.com/texturepacker</a> and publish in the 'JSON' format
	 * There is a free version so thats nice, although the paid version is great value for money.
	 * It is highly recommended to use Sprite sheets (also know as a 'texture atlas') as it means sprites can be batched and drawn together for highly increased rendering speed.
	 * Once the data has been loaded the frames are stored in the PIXI texture cache and can be accessed though PIXI.Texture.fromFrameId() and PIXI.Sprite.fromFrameId()
	 * This loader will load the image file that the Spritesheet points to as well as the data.
	 * When loaded this class will dispatch a 'loaded' event
	 */
	function new (String:Dynamic, Boolean:Dynamic);
	
	/**
	 * The url of the bitmap font data
	 */
	var url:String;
	
	/**
	 * Whether the requests should be treated as cross origin
	 */
	var crossorigin:Bool;
	
	/**
	 * [read-only] The base url of the bitmap font data
	 */
	var baseUrl:String;
	
	/**
	 * The texture being loaded
	 */
	var texture:Dynamic;
	
	/**
	 * The frames of the sprite sheet
	 */
	var frames:Dynamic;
	
}
