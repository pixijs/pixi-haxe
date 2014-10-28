package pixi.extras;

import pixi.core.Point;
import pixi.textures.Texture;

@:native("PIXI.Rope")
extern class Rope extends pixi.extras.Strip {

	/**
	 * 
	 * @class Rope
	 * @constructor
	 * @param texture {Texture} The texture to use
	 * @param points {Array}
	 * 
	*/
	function new(texture:Texture, points:Array<Point>):Void;

	/*
	 * Sets the texture that the Rope will use 
	 *
	 * @method setTexture
	 * @param texture {Texture} the texture that will be used
	*/
	function setTexture(texture:Texture):Void;

	/*
	 * Refreshes 
	 *
	 * @method refresh
	*/
	function refresh():Void;

}
