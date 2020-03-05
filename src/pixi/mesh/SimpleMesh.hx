package pixi.mesh;

import js.lib.Float32Array;
import js.lib.Uint16Array;
import pixi.core.textures.Texture;

@:native("PIXI.SimpleMesh")
extern class SimpleMesh extends Mesh {
	/**
	 * Base mesh class
	 * @class
	 * @extends Container
	 * @memberof PIXI.mesh
	 * @param texture {Texture} The texture to use
	 * @param [vertices] {Float32Array} if you want to specify the vertices
	 * @param [uvs] {Float32Array} if you want to specify the uvs
	 * @param [indices] {Int16Array} if you want to specify the indices
	 * @param [drawMode] {Int} the drawMode, can be any of the Mesh.DRAW_MODES consts
	 */
	function new(texture:Texture, ?vertices:Float32Array, ?uvs:Float32Array, ?indices:Uint16Array, ?drawMode:Int);

	/**
	 * Triangles in canvas mode are automatically antialiased, use this value to force triangles to overlap a bit with each other. To set the global default, set PIXI.settings.MESH_CANVAS_PADDING
	 */
	var canvasPadding:Float;
}
