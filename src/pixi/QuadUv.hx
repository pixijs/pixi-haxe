package pixi;

import haxe.io.Float32Array;
import js.lib.Float32Array;
import pixi.core.math.shapes.Rectangle;
import pixi.mesh.Geometry;

@:native("PIXI.QuadUv")
extern class QuadUv extends Geometry {
	/**
	 * Helper class to create a quad with uvs like in v4
	 */
	public function new();

	/**
	 * The Uvs of the quad
	 */
	var uvs:Float32Array;

	/**
	 * An array of vertices
	 */
	var vertices:Float32Array;

	/**
	 * legacy upload method, just marks buffers dirty
	 * @return Returns itself.
	 */
	function invalidate():QuadUv;

	/**
	 * Maps two Rectangle to the quad.
	 * @param	targetTextureFrame the first rectangle
	 * @param	destinationFrame the second rectangle
	 * @return Returns itself.
	 */
	function map(targetTextureFrame:Rectangle, destinationFrame:Rectangle):Quad;
}
