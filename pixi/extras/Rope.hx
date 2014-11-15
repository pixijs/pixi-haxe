package pixi.extras;

import pixi.core.Point;
import pixi.textures.Texture;

@:native("PIXI.Rope")
extern class Rope extends Strip {

	/**
	 * 
	 * @class Rope
	 * @constructor
	 * @param texture {Texture} The texture to use
	 * @param points {Array}
	 * 
	*/
	function new(texture:Texture, points:Array<Point>):Void;
}