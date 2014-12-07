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
}