package pixi.mesh;

import haxe.extern.EitherType;
import js.lib.Float32Array;
import js.lib.Uint16Array;
import pixi.core.Shader;
import pixi.core.display.Container;
import pixi.core.math.Point;
import pixi.core.renderers.webgl.Buffer;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.State;
import pixi.core.textures.Texture;

@:native("PIXI.Mesh")
extern class Mesh extends Container {
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
	 * The maximum number of vertices to consider batchable. Generally, the complexity of the geometry.
	 *
	 * @member {Float}
	 */
	static var BATCHABLE_SIZE:Float;

	/**
	 * The way the Mesh should be drawn, can be any of the Mesh.DRAW_MODES consts
	 *
	 * @member {Int}
	 */
	var drawMode:Int;

	/**
		Includes vertex positions, face indices, normals, colors, UVs, and custom attributes within buffers, reducing the cost of passing all this data to the GPU. Can be shared between multiple Mesh objects.
		*
		* @member {Rectangle}
	 */
	var geometry(default, null):Geometry;

	/**
	 * Alias for PIXI.Mesh#shader.
	 */
	var material:EitherType<Shader, MeshMaterial>;

	/**
	 * If true PixiJS will Math.floor() x/y values when rendering, stopping pixel interpolation. Advantages can include sharper image quality (like text) and faster rendering on canvas. The main disadvantage is movement of objects may appear less smooth. To set the global default, change PIXI.settings.ROUND_PIXELS
	 */
	var roundPixels:Bool;

	/**
	 * Represents the vertex and fragment shaders that processes the geometry and runs on the GPU. Can be shared between multiple Mesh objects.
	 */
	var shader:EitherType<Shader, MeshMaterial>;

	/**
	 * How much of the geometry to draw, by default 0 renders everything.
	 */
	var size:Float;

	/**
	 * Typically the index of the IndexBuffer where to start drawing.
	 */
	var start:Int;

	/**
	 * Represents the WebGL state the Mesh required to render, excludes shader and geometry. E.g., blend mode, culling, depth testing, direction of rendering triangles, backface, etc.
	 */
	var state:State;

	/**
	 * The texture that the Mesh uses.
	 */
	var texture:Texture;

	/**
	 * The multiply tint applied to the Mesh. This is a hex value. A value of 0xFFFFFF will remove any tint effect.
	 */
	var tint:Int;

	/**
	 * To change mesh uv's, change its uvBuffer data and increment its _updateID.
	 */
	var uvBuffer(default, null):Buffer;

	/**
	 * To change mesh vertices, change its uvBuffer data and increment its _updateID. Incrementing _updateID is optional because most of Mesh objects do it anyway.
	 */
	var verticesBuffer(default, null):Buffer;

	/**
	 * Updates the bounds of the mesh as a rectangle. The bounds calculation takes the worldTransform into account. there must be a aVertexPosition attribute present in the geometry for bounds to be calculated correctly.
	 */
	private function _calculateBounds():Void;

	/**
	 * Standard renderer draw.
	 * @param	renderer
	 */
	private function _render(renderer:Renderer):Void;

	/**
	 * Standard non-batching way of rendering.
	 * @param	renderer
	 */
	private function _renderDefault(renderer:Renderer):Void;

	/**
	 * Updates uv field based on from geometry uv's or batchUvs
	 */
	function calculateUvs():Void;

	/**
	 * Updates vertexData field based on transform and vertices
	 */
	function calculateVertices():Void;

	/**
	 * Tests if a point is inside this mesh. Works only for TRIANGLE_MESH
	 *
	 * @param {Point} point - the point to test
	 * @return {Bool} the result of the test
	 */
	function containsPoint(point:Point):Bool;

	/**
	 * Destroys the Mesh object.
	 */
	override function destroy(?options:Dynamic):Void;

	/**
	 * Render the object using the WebGL renderer and advanced features.
	 * @param	render
	 */
	function renderAdvanced(render:Renderer):Void;
}

typedef DrawModes = {
	var TRIANGLE_MESH:Int;
	var TRIANGLES:Int;
}
