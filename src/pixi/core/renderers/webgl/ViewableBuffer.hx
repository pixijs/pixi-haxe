package pixi.core.renderers.webgl;

import haxe.extern.EitherType;
#if (haxe_ver >= 4)
import js.lib.Float32Array;
#else
import js.html.Float32Array;
#end
import haxe.io.Int32Array;
import haxe.io.UInt32Array;
import haxe.io.UInt8Array;
import js.html.ArrayBuffer;
import js.html.Int16Array;
import js.html.Int8Array;

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
	var uint8View:UInt8Array;
	
	/**
	 * View on the raw binary data as a Uint16Array.
	 */
	var uint16View:Dynamic;
	
	/**
	 * View on the raw binary data as a Uint32Array.
	 */
	var uint32View:UInt32Array;
	
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