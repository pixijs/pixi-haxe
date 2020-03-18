package pixi.core.renderers.webgl;

import haxe.extern.EitherType;
import js.lib.Float32Array;

@:native("PIXI.Buffer")
extern class Buffer {
	/**
	 * A wrapper for data so that it can be used and uploaded by WebGL
	 *
	 * @param data {Array} the data to store in the buffer.
	 * @param [_static=true] {Bool} true for static buffer
	 * @param [index=false] {Bool} true for index buffer
	 */
	function new(data:EitherType<Array<Dynamic>, Array<Float32Array>>, ?_static:Bool, ?index:Bool);

	/**
	 *
	 * @param	data {Array} the data to store in the buffer.
	 * @return {Buffer} A new Buffer based on the data provided.
	 */
	function from(data:EitherType<Array<Dynamic>, Array<Float32Array>>):Buffer;

	/**
	 * Destroys the buffer
	 */
	function destroy():Void;

	/**
	 * Disposes WebGL resources that are connected to this geometry
	 */
	function dispose():Void;

	/**
	 * flags this buffer as requiring an upload to the GPU
	 * @param	data {Array} the data to update in the buffer.
	 */
	function update(data:EitherType<Array<Dynamic>, Array<Float32Array>>):Void;
}
