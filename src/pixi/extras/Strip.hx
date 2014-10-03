package pixi.extras;

@:native("PIXI.Strip")
extern class Strip extends pixi.display.DisplayObjectContainer {

	/**
 	 * 
	 * @class Strip
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param texture {Texture} The texture to use
	 * @param width {Number} the width 
	 * @param height {Number} the height
	 * 
	*/
	function new(texture:Dynamic):Void;

	/**
	 * The texture of the strip
	 */
	var texture:Dynamic;
	
	/**
	 * Whether the strip is dirty or not
	 */
	var dirty:Bool;
	
	/**
	 * if you need a padding, not yet implemented
	 */
	var padding:Float;
	
}
