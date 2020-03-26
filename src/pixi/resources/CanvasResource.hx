package pixi.resources;

import js.html.CanvasElement;

@:native("PIXI.resources.CanvasResource")
extern class CanvasResource extends BaseImageResource {
	/**
	 * Resource type for HTMLCanvasElement.
	 * @param	source Canvas element to use
	 */
	function new(source:CanvasElement);

	/**
	 *
	 * @param	source The source object. Types: HTMLCanvasElement | OffscreenCanvas
	 * @return 	true if source is HTMLCanvasElement or OffscreenCanvas
	 */
	static function test(source:Dynamic):Bool;
}
