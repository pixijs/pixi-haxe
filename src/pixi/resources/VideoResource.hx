package pixi.resources;

@:native("PIXI.resources.VideoResource")
extern class VideoResource extends BaseImageResource {
	/**
	 * Resource type for HTMLVideoElement.
	 * @param	source Video element to use. Types: HTMLVideoElement | object | string | Array.<(string|object)>
	 * @param	options Options to use
	 */
	function new(source:Dynamic, options:VideoResourceOptions);

	/**
	 * List of common video file extensions supported by VideoResource.
	 */
	static var TYPES(default, null):Array<String>;

	/**
	 * When set to true will automatically play videos used by this texture once they are loaded. If false, it will not modify the playing state.
	 */
	var autoPlay:Bool;

	/**
	 * Should the base texture automatically update itself, set to true by default
	 */
	var autoUpdate:Bool;

	/**
	 * How many times a second to update the texture from the video. Leave at 0 to update at every render. A lower fps can help performance, as updating the texture at 60fps on a 30ps video may not be efficient.
	 */
	var updateFPS:Float;

	/**
	 * Used to auto-detect the type of resource.
	 * @param	source The source object
	 * @param	extension The extension of source, if set
	 * @return true true if video source
	 */
	static function test(source:Dynamic, extension:String):Bool;
}

typedef VideoResourceOptions = {
	autoLoad:Bool,
	autoPlay:Bool,
	updateFPS:Float,
	crossorigin:Bool
}
