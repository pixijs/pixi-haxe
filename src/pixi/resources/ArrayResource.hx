package pixi.resources;

import haxe.extern.EitherType;
import pixi.core.textures.BaseTexture;

@:native("PIXI.resources.ArrayResource")
extern class ArrayResource extends Resource {
	/**
	 * Base resource class for textures that manages validation and uploading, depending on its type.
	 * Uploading of a base texture to the GPU is required.
	 * @param	width Width of the resource
	 * @param	height Height of the resource
	 */
	function new(source:EitherType<Int, Array<Dynamic>>, ?options:ArrayResourceOptions);

	/**
	 * Dirty IDs for each part
	 */
	var itemDirtyIds(default, null):Array<Int>;

	/**
	 * Collection of resources.
	 */
	var items(default, null):Array<BaseTexture>;

	/**
	 * Number of elements in array
	 */
	var length(default, null):Int;

	/**
	 * Set a resource by ID
	 * @param	resource PIXI.resources.Resource
	 * @param	index Zero-based index of resource to set
	 * @return Instance for chaining
	 */
	function addResourceAt(resource:Resource, index:Int):ArrayResource;
}

typedef ArrayResourceOptions = {
	?width:Float,
	?height:Float
}
