package pixi.core.textures;

import js.lib.Float32Array;
import pixi.core.math.Matrix;

@:native("PIXI.TextureMatrix")
extern class TextureMatrix {
	/**
	 * Class controls uv mapping from Texture normal space to BaseTexture normal space.
	 * Takes trim and rotate into account. May contain clamp settings for Meshes and TilingSprite.
	 * Can be used in Texture uvMatrix field, or separately, you can use different clamp settings on the same texture. If you want to add support for texture region of certain feature or filter, that's what you're looking for.
	 * Takes track of Texture changes through _lastTextureID private field. Use update() method call to track it from outside.
	 * @param	texture {Texture} observed texture
	 * @param	clampMargin {Float} Changes frame clamping, 0.5 by default. Use -0.5 for extra border.
	 */
	function new(texture:Texture, ?clampMargin:Float);

	/**
	 * Tracks Texture frame changes
	 */
	private var _updateID:Float;

	/**
	 * Changes frame clamping Works with TilingSprite and Mesh Change to -0.5 to add a pixel to the edge, recommended for transparent trimmed textures in atlas
	 */
	var clampMargin:Float;

	/**
	 * Changes frame clamping Works with TilingSprite and Mesh Change to 1.5 if you texture has repeated right and bottom lines, that leads to smoother borders
	 */
	var clampOffset:Float;

	/**
	 * If texture size is the same as baseTexture
	 */
	var isSimple(default, null):Bool;

	/**
	 * Matrix operation that converts texture region coords to texture coords
	 */
	var mapCoord(default, null):Matrix;

	/**
	 * texture property
	 */
	var texture:Texture;

	/**
	 * Clamp region for normalized coords, left-top pixel center in xy , bottom-right in zw. Calculated based on clampOffset.
	 */
	var uClampFrame(default, null):Float32Array;

	/**
	 * Normalized clamp offset. Calculated based on clampOffset.
	 */
	var uClampOffset(default, null):Float32Array;

	/**
	 * Multiplies uvs array to transform
	 * @param	uvs {Float32Array} mesh uvs
	 * @param	out {Float32Array} output
	 * @return {Float32Array} output
	 */
	function multiplyUvs(uvs:Float32Array, ?out:Float32Array):Float32Array;

	/**
	 * updates matrices if texture was changed
	 * @param	forceUpdate {Bool} if true, matrices will be updated any case
	 * @return whether or not it was updated
	 */
	function update(?forceUpdate:Bool):Bool;
}
