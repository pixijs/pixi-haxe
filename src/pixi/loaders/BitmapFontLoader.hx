package phaser.pixi.loaders;

@:native("PIXI.BitmapFontLoader")
extern class BitmapFontLoader {
	
	/**
	 * The xml loader is used to load in XML bitmap font data ('xml' or 'fnt')
	 * To generate the data you can use <a href='http://www.angelcode.com/products/bmfont/'>http://www.angelcode.com/products/bmfont/</a>
	 * This loader will also load the image file as the data.
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
	
}
