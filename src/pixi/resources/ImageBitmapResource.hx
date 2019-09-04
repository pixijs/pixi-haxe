package pixi.resources;

@:native("PIXI.resources.ImageBitmapResource")
extern class ImageBitmapResource extends BaseImageResource{

	/**
	 * Resource type for ImageBitmap.
	 * @param	source Image element to use
	 */
	function new(source:Dynamic); // TODO: type actually is ImageBitmap

	/**
	 *
	 * @param	source The source object. Type: ImageBitmap
	 * @return 	true if source is ImageBitmap
	 */
	static function test(source:Dynamic):Bool;
}