package pixi.mesh;

import js.html.Float32Array;
import js.html.Int16Array;
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
	 * @param [vertices] {Float32Array} if you want to specify the vertices
	 * @param [uvs] {Float32Array} if you want to specify the uvs
	 * @param [indices] {Int16Array} if you want to specify the indices
	 * @param [drawMode] {Int} the drawMode, can be any of the Mesh.DRAW_MODES consts
	 */
	function new(texture:Texture, ?vertices:Float32Array, ?uvs:Float32Array, ?indices:Int16Array, ?drawMode:Int);

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
	 * @member {Float32Array}
	 */
	var uvs:Float32Array;

	/**
	 * An array of vertices
	 *
	 * @member {Float32Array}
	 */
	var vertices:Float32Array;

	/*
	 * @member {Int16Array} An array containing the indices of the vertices
	 */
	var indices:Int16Array;

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