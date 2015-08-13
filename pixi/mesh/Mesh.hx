package pixi.mesh;

import pixi.core.display.Container;
import pixi.core.textures.Texture;

@:native("PIXI.mesh.Mesh")
extern class Mesh extends Container {

	/**
	 * Base mesh class
	 * @class
	 * @extends Container
	 * @memberof PIXI.mesh
	 * @param texture {Texture} The texture to use
	 * @param [vertices] {Array<Float>} if you want to specify the vertices
	 * @param [uvs] {Array<Float>} if you want to specify the uvs
	 * @param [indices] {Array<Int>} if you want to specify the indices
	 * @param [drawMode] {Int} the drawMode, can be any of the Mesh.DRAW_MODES consts
	 */
	function new(texture:Texture, ?vertices:Array<Float>, ?uvs:Array<Float>, ?indices:Array<Int>, ?drawMode:Int);

	/**
	 * Different drawing buffer modes supported
	 *
	 * @static
	 * @constant
	 * @property {object} DRAW_MODES
	 * @property {number} DRAW_MODES.TRIANGLE_MESH
	 * @property {number} DRAW_MODES.TRIANGLES
	 */
	static var DRAW_MODES:DrawModes;

	/**
	 * The texture of the Mesh
	 *
	 * @member {Texture}
	 */
	var texture:Texture;

	/**
	 * The Uvs of the Mesh
	 *
	 * @member {Array<Float>}
	 */
	var uvs:Array<Float>;

	/**
	 * An array of vertices
	 *
	 * @member {Array<Float>}
	 */
	var vertices:Array<Float>;

	/*
	 * @member {Array<Int>} An array containing the indices of the vertices
	 */
	var indices:Array<Int>;

	/**
	 * Whether the Mesh is dirty or not
	 *
	 * @member {Bool}
	 */
	var dirty:Bool;

	/**
	 * The blend mode to be applied to the sprite. Set to blendModes.NORMAL to remove any blend mode.
	 *
	 * @member {Int}
	 * @default CONST.BLEND_MODES.NORMAL;
	 */
	var blendMode:Int;

	/**
	 * Triangles in canvas mode are automatically antialiased, use var value to force triangles to overlap a bit with each other.
	 *
	 * @member {Float}
	 */
	var canvasPadding:Float;

	/**
	 * The way the Mesh should be drawn, can be any of the Mesh.DRAW_MODES consts
	 *
	 * @member {Int}
	 */
	var drawMode:Int;
}

typedef DrawModes = {
	var TRIANGLE_MESH:Int;
	var TRIANGLES:Int;
}