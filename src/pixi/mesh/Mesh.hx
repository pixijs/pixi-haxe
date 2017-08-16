package pixi.mesh;

import pixi.core.Pixi.BlendModes;
import pixi.core.math.Point;
import js.html.Uint16Array;
import pixi.core.Shader;
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
	function new(texture:Texture, ?vertices:Float32Array, ?uvs:Float32Array, ?indices:Uint16Array, ?drawMode:Int);

	/**
     * multiplies uvs only if uploadUvTransform is false
     * call it after you change uvs manually
     * make sure that texture is valid
     */
	function multiplyUvs():Void;

	/**
     * Tests if a point is inside this mesh. Works only for TRIANGLE_MESH
     *
     * @param {Point} point - the point to test
     * @return {Bool} the result of the test
     */
	function containsPoint(point:Point):Bool;

	/**
     * Refreshes uvs for generated meshes (rope, plane)
     * sometimes refreshes vertices too
     *
     * @param {Bool} [forceUpdate=false] if true, matrices will be updated any case
     */
	function refresh(?forceUpdate:Bool):Void;

	/**
	 * whether or not upload uvTransform to shader
	 * if its false, then uvs should be pre-multiplied
	 * if you change it for generated mesh, please call 'refresh(true)'
	 * @member {Bool}
	 * @default false
	 */
	var uploadUvTransform:Bool;

	/**
	 * Plugin that is responsible for rendering this element.
	 * Allows to customize the rendering process without overriding '_renderWebGL' & '_renderCanvas' methods.
	 * @member {string}
	 * @default 'mesh'
	 */
	var pluginName:String;

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
	 * @member {Float}
	 */
	var dirty:Float;

	/**
	 * Version of mesh indices
	 *
	 * @member {Float}
	 */
	var indexDirty:Float;

	/**
	 * The blend mode to be applied to the sprite. Set to blendModes.NORMAL to remove any blend mode.
	 *
	 * @member {Int}
	 * @default CONST.BLEND_MODES.NORMAL;
	 */
	var blendMode:BlendModes;

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

	/**
     * The default shader that is used if a mesh doesn't have a more specific one.
     *
     * @member {Shader}
     */
	var shader:Shader;

	/**
     * The tint applied to the mesh. This is a [r,g,b] value. A value of [1,1,1] will remove any tint effect.
     *
     * @member {Float32Array}
     * @memberof PIXI.mesh.Mesh#
     */
	var tintRgb:Float32Array;

	/**
	 * The tint applied to the mesh. This is a hex value. A value of 0xFFFFFF will remove any tint effect.
	 *
	 * @member {Int}
	 */
	var tint:Int;
}

typedef DrawModes = {
	var TRIANGLE_MESH:Int;
	var TRIANGLES:Int;
}
