package pixi.extras;

import pixi.geom.Point;
import pixi.textures.Texture;

@:native("PIXI.Rope")
extern class Rope extends Strip {

	/**
	 *
	 * @class Rope
	 * @constructor
	 * @extends Strip
	 * @param {Texture} texture - The texture to use on the rope.
	 * @param {Array<Point>} points.
	 *
	 */
	function new(texture:Texture, points:Array<Point>);

	/*
	 * Refreshes
	 *
	 * @method refresh
	 */
	function refresh():Void;

	/*
	 * Sets the texture that the Rope will use
	 *
	 * @method setTexture
	 * @param texture {Texture} the texture that will be used
	 */
	function setTexture(texture:Texture):Void;
}