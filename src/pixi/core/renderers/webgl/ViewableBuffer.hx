package pixi.core.renderers.webgl;

import haxe.extern.EitherType;
import js.lib.Int32Array;
import js.lib.Uint32Array;
import js.lib.Uint8Array;
import js.lib.Float32Array;
import js.lib.ArrayBuffer;
import js.lib.Int16Array;
import js.lib.Int8Array;

@:native("PIXI.ViewableBuffer")
extern class ViewableBuffer {
	/**
	 * Flexible wrapper around ArrayBuffer that also provides typed array views on demand.
	 * @param	size
	 */
	function new(size:Int);

	/**
	 * View on the raw binary data as a Float32Array.
	 */
	var float32View:Float32Array;

	/**
	 * View on the raw binary data as a Int8Array.
	 */
	var int8view:Int8Array;

	/**
	 * View on the raw binary data as a Int16Array.
	 */
	var int16View:Int16Array;

	/**
	 * View on the raw binary data as a Int32Array.
	 */
	var int32View:Int32Array;

	/**
	 * Underlying ArrayBuffer that holds all the data and is of capacity size.
	 */
	var rawBinaryData:ArrayBuffer;

	/**
	 * View on the raw binary data as a Uint8Array.
	 */
	var uint8View:Uint8Array;

	/**
	 * View on the raw binary data as a Uint16Array.
	 */
	var uint16View:Dynamic;

	/**
	 * View on the raw binary data as a Uint32Array.
	 */
	var uint32View:Uint32Array;

	/**
	 * Destroys all buffer references. Do not use after calling this.
	 */
	function destroy():Void;

	/**
	 * Returns the view of the given type.
	 * @param	type One of int8, uint8, int16, uint16, int32, uint32, and float32.
	 * @return  typed array of given type
	 */
	function view(type:String):Dynamic;
}
