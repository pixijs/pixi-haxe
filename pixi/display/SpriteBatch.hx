package pixi.display;

import pixi.textures.Texture;

@:native("PIXI.SpriteBatch")
extern class SpriteBatch extends DisplayObjectContainer {

	/**
	 * The SpriteBatch class is a really fast version of the DisplayObjectContainer
	 * built solely for speed, so use when you need a lot of sprites or particles.
	 *
	 * @class SpriteBatch
	 * @constructor
	 * @param texture {Texture}
	 */
	function new(?texture:Texture):Void;
}