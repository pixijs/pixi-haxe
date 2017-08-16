package pixi.core.textures;

import pixi.core.math.shapes.Rectangle;

@:native("PIXI.TextureUvs")
extern class TextureUvs {

	/**
	 * A standard object to store the Uvs of a texture
	 *
	 * @class
	 * @private
	 * @memberof PIXI
	 */
	function new();

	/**
     * Sets the texture Uvs based on the given frame information.
     *
     * @private
     * @param {Rectangle} frame - The frame of the texture
     * @param {Rectangle} baseFrame - The base frame of the texture
     * @param {Float} rotate - Rotation of frame, see {@link PIXI.GroupD8}
     */
	function set(frame:Rectangle, baseFrame:Rectangle, rotate:Float):Void;
}