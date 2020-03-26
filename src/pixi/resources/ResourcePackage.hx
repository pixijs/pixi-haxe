package pixi.resources;

import haxe.extern.EitherType;

@:native("PIXI.resources")
extern class ResourcesPackage {
	/**
	 * Collection of installed resource types, class must extend PIXI.resources.Resource.
	 */
	static var INSTALLED:Array<Dynamic>;

	/**
	 * Create a resource element from a single source element. This auto-detects which type of resource to create.
	 * All resources that are auto-detectable must have a static test method and a constructor with the arguments (source, options?).
	 * Currently, the supported resources for auto-detection include:
	 * @param	source
	 * @param	option
	 * @return The created resource.
	 */
	static function autoDetectResource(source:EitherType<String, Dynamic>, options:ResourcesPackageOptions):Resource;
}

typedef ResourcesPackageOptions = {
	width:Float,
	height:Float,
	autoLoad:Bool,
	scale:Float,
	createBitmap:Bool,
	crossorigin:Bool,
	autoPlay:Bool,
	updateFPS:Float
}
