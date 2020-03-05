package pixi.resources;

import haxe.extern.EitherType;
import js.lib.Promise;
import js.html.ImageBitmap;
import js.html.ImageElement;

@:native("PIXI.resources.ImageResource")
extern class ImageResource extends BaseImageResource {
	/**
	 * Resource type for HTMLImageElement.
	 * @param	source Image element to use
	 * @param	options options for this Resource
	 */
	function new(source:EitherType<ImageElement, String>, options:ImageResourceOptions);

	/**
	 * The ImageBitmap element created for HTMLImageElement
	 */
	var bitmap:ImageBitmap;

	/**
	 * If capable, convert the image using createImageBitmap API
	 */
	var createBitmap:Bool;

	/**
	 * If the image should be disposed after upload
	 */
	var preserveBitmap:Bool;

	/**
	 * URL of the image source
	 */
	var url:String;

	/**
	 * Called when we need to convert image into BitmapImage. Can be called multiple times, real promise is cached inside.
	 * @return cached promise to fill that bitmap
	 */
	function process():Promise<Void>;
}

typedef ImageResourceOptions = {
	autoLoad:Bool,
	createBitmap:Bool,
	crossorigin:Bool,
	premultiplyAlpha:Bool
}
