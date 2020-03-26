package pixi.resources;

import haxe.extern.EitherType;
import js.lib.RegExp;
import pixi.core.Pixi.ISize;

@:native("PIXI.resources.SVGResource")
extern class SVGResource extends BaseImageResource {
	/**
	 * Resource type for SVG elements and graphics.
	 * @param	source Base64 encoded SVG element or URL for SVG file.
	 * @param	options options for this Resource
	 */
	function new(source:String, options:SVGResourceOptions);

	static var SVG_SIZE:EitherType<RegExp, String>;

	/**
	 * A height override for rasterization on load
	 */
	var _overrideHeight(default, null):Float;

	/**
	 * A width override for rasterization on load
	 */
	var _overrideWidth(default, null):Float;

	/**
	 * The source scale to apply when rasterizing on load
	 */
	var scale(default, null):Float;

	/**
	 * Get size from an svg string using regexp.
	 * @param	svgString
	 * @return the size of the svg graphic
	 */
	static function getSize(svgString:String):ISize;

	/**
	 * Used to auto-detect the type of resource.
	 * @param	source The source object
	 * @param	extension The extension of source, if set
	 * @return true if svg
	 */
	static function test(source:Dynamic, extension:String):Bool;
}

typedef SVGResourceOptions = {
	scale:Float,
	width:Float,
	height:Float,
	autoLoad:Bool
}
