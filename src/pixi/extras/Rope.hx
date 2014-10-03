package pixi.extras;

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
	function new(texture:Dynamic, points:Array<Dynamic>):Void;

	/*
	 * Sets the texture that the Rope will use 
	 *
	 * @method setTexture
	 * @param texture {Texture} the texture that will be used
	*/
	function setTexture(texture:Dynamic):Void;

	/*
	 * Refreshes 
	 *
	 * @method refresh
	*/
	function refresh():Void;

}
