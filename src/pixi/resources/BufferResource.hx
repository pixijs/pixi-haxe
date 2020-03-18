package pixi.resources;

import js.lib.Float32Array;
import js.lib.Uint32Array;
import js.lib.Uint8Array;

@:native("PIXI.resources.BufferResource")
extern class BufferResource extends Resource {
	/**
	 * Buffer resource with data of typed array
	 * @param	source Source buffer
	 * @param	options Options
	 */
	@:overload(function(source:Array<Uint32Array>, ?options:BufferResourceOptions):Void {})
	@:overload(function(source:Array<Uint8Array>, ?options:BufferResourceOptions):Void {})
	function new(source:Array<Float32Array>, ?options:BufferResourceOptions);

	/**
	 * Source array Cannot be ClampedUint8Array because it cant be uploaded to WebGL
	 * Types: Float32Array | Uint8Array | Uint32Array
	 */
	var data:Dynamic;

	/**
	 * Used to auto-detect the type of resource.
	 * @param	source The source object
	 * @return true if successfull detection
	 */
	static function test(source:Dynamic):Bool;
}

typedef BufferResourceOptions = {
	?width:Float,
	?height:Float
}
