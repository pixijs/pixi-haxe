package pixi.resources;

import haxe.extern.EitherType;

@:native("PIXI.resources.CubeResource")
extern class CubeResource extends ArrayResource {
	/**
	 * Resource for a CubeTexture which contains six resources.
	 * @param	source Collection of URLs or resources to use as the sides of the cube.
	 */
	function new(?source:Array<EitherType<String, Resource>>, ?options:CubeResourceOptions);

	/**
	 * Number of texture sides to store for CubeResources. Default: 6
	 */
	static var SIDES:Int;
}

typedef CubeResourceOptions = {
	width:Float,
	height:Float
}
