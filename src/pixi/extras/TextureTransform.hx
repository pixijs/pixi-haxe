package pixi.extras;

import js.html.Float32Array;
import pixi.core.textures.Texture;

@:native("PIXI.extras.TextureTransform")
extern class TextureTransform {

	/**
     * class controls uv transform and frame clamp for texture
	 *
	 * @class
	 * @memberof PIXI.extras
     * @param {Texture} texture observed texture
     * @param {Float} [clampMargin] Changes frame clamping, 0.5 by default. Use -0.5 for extra border.
     * @constructor
     */
	function new(texture:Texture, ?clampMargin:Float);

	/**
	 * Changes frame clamping
	 * Works with TilingSprite and Mesh
	 * Change to 1.5 if you texture has repeated right and bottom lines, that leads to smoother borders
	 *
	 * @default 0
	 * @member {Float}
	 */
	var clampOffset:Float;

	/**
	 * Changes frame clamping
	 * Works with TilingSprite and Mesh
	 * Change to -0.5 to add a pixel to the edge, recommended for transparent trimmed textures in atlas
	 *
	 * @default 0.5
	 * @member {Float}
	 */
	var clampMargin:Float;

	/**
     * texture property
     * @member {Texture}
     */
	var texture:Texture;

	/**
     * Multiplies uvs array to transform
     * @param {Float32Array} uvs mesh uvs
     * @param {Float32Array} [out=uvs] output
     * @returns {Float32Array} output
     */
	function multiplyUvs(uvs:Float32Array, out:Float32Array):Float32Array;

	/**
     * updates matrices if texture was changed
     * @param {Bool} forceUpdate if true, matrices will be updated any case
     * @returns {Bool} whether or not it was updated
     */
	function update(forceUpdate:Bool):Bool;
}