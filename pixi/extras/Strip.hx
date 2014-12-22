package pixi.extras;

import pixi.display.DisplayObjectContainer;
import pixi.textures.Texture;

@:native("PIXI.Strip")
extern class Strip extends DisplayObjectContainer {

	/**
	 * @class Strip
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param texture {Texture} The texture to use
	*/
	function new(texture:Texture);

	/**
	 * The texture of the strip
	 *
	 * @property texture
	 * @type Texture
	 */
	var texture:Texture;

	/**
	 * Whether the strip is dirty or not
	 *
	 * @property dirty
	 * @type Bool
	 */
	var dirty:Bool;

	/**
	 * if you need a padding, not yet implemented
	 *
	 * @property padding
	 * @type Float
	 */
	var padding:Float;

	/**
     * The blend mode to be applied to the sprite. Set to PIXI.blendModes.NORMAL to remove any blend mode.
     *
     * @property blendMode
     * @type Int
     * @default PIXI.blendModes.NORMAL;
     */
	var blendMode:Int;

	/**
     * Triangles in canvas mode are automatically antialiased, use this value to force triangles to overlap a bit with each other.
     *
     * @property canvasPadding
     * @type Float
     */
	var canvasPadding:Float;
}