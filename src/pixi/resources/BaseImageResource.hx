package pixi.resources;

import haxe.extern.EitherType;
import js.Promise;
import js.html.HtmlElement;
import pixi.core.renderers.webgl.GLTexture;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.textures.BaseTexture;

@:native("PIXI.resources.BaseImageResource")
extern class BaseImageResource extends Resource {
	/**
	 * Base for all the image/canvas resources
	 * @param	source Types: HTMLImageElement | HTMLCanvasElement | HTMLVideoElement | SVGElement
	 */
	function new(source:Dynamic);

	/**
	 * The source element
	 */
	var source:Dynamic;

	/**
	 * Set cross origin based detecting the url and the crossorigin
	 * @param	element Element to apply crossOrigin
	 * @param	url URL to check
	 * @param	crossorigin Cross origin value to use
	 */
	static function crossOrigin(element:HtmlElement, url:String, ?crossorigin:EitherType<String, Bool> = true):Void;
}
