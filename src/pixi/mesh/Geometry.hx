package pixi.mesh;

import pixi.core.renderers.webgl.Attribute;
import pixi.core.renderers.webgl.Buffer;

@:native("PIXI.Geometry")
extern class Geometry {
	/**
	 * The Geometry represents a model. It consists of two components:
	 *
	 * GeometryStyle - The structure of the model such as the attributes layout
	 * GeometryData - the data of the model - this consists of buffers. This can include anything from positions, uvs, normals, colors etc.
	 *
	 * @class
	 * @memberof PIXI.mesh
	 * @param buffers {Array<Buffer>} An array of buffers. optional.
	 * @param [attributes] {Dynamic} of the geometry, optional structure of the attributes layout
	 */
	function new(?buffers:Array<Buffer>, ?attributes:Dynamic);

	/**
	 * Number of instances in this geometry, pass it to GeometrySystem.draw()
	 *
	 * @member {Int}
	 */
	var instanceCount:Int;

	/**
	 * Count of existing (not destroyed) meshes that reference this geometry
	 *
	 * @member {Int}
	 */
	var refCount:Int;

	/**
	 * merges an array of geometries into a new single one geometry attribute styles must match for this operation to work
	 *
	 * @param geometries {Array<Buffer>}
	 * @return shiny new geometry!
	 */
	static function merge(geometries:Array<Geometry>):Geometry;

	/**
	 * Adds an attribute to the geometry
	 * @param	id {String} the name of the attribute (matching up to a shader)
	 * @param	buffer {Buffer} the buffer that holds the data of the attribute . You can also provide an Array and a buffer will be created from it.
	 * @param	size {Int} the size of the attribute. If you have 2 floats per vertex (eg position x and y) this would be 2
	 * @param	normalized {Bool} should the data be normalized.
	 * @param	type {Float} what type of number is the attribute. Check {PIXI.TYPES} to see the ones available
	 * @param	stride {Float} How far apart (in floats) the start of each value is. (used for interleaving data)
	 * @param	star {Int} How far into the array to start reading values (used for interleaving data)
	 * @return {Geometry} returns self, useful for chaining.
	 */
	function addAttribute(id:String, ?buffer:Buffer, ?size:Int, ?normalized:Bool, ?type:Float, ?stride:Float, ?start:Int):Geometry;

	/**
	 * Adds an index buffer to the geometry The index buffer contains integers, three for each triangle in the geometry, which reference the various attribute buffers (position, colour, UV coordinates, other UV coordinates, normal, …). There is only ONE index buffer.
	 * @param	buffer {Buffer} the buffer that holds the data of the index buffer. You can also provide an Array and a buffer will be created from it.
	 * @return {Geometry} returns self, useful for chaining.
	 */
	function addIndex(buffer:Buffer):Geometry;

	/**
	 * returns a clone of the geometry
	 * @return {Geometry}
	 */
	function clone():Geometry;

	/**
	 * Destroys the geometry.
	 */
	function destroy():Void;

	/**
	 * disposes WebGL resources that are connected to this geometry
	 */
	function dispose():Void;

	/**
	 * returns the requested attribute
	 * @param	id
	 * @return
	 */
	function getAttribute(id:String):Attribute;

	/**
	 * returns the requested buffer
	 * @param	id {String} the name of the buffer required
	 * @return {Buffer} the buffer requested.
	 */
	function getBuffer(id:String):Buffer;

	/**
	 * returns the index buffer
	 * @return {Buffer} the index buffer.
	 */
	function getIndex():Buffer;

	/**
	 * this function modifies the structure so that all current attributes become interleaved into a single buffer This can be useful if your model remains static as it offers a little performance boost
	 * @return {Geometry} returns self, useful for chaining.
	 */
	function interleave():Geometry;
}
