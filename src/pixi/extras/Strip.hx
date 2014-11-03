package pixi.extras;

import pixi.display.DisplayObjectContainer;
import pixi.textures.Texture;

@:native("PIXI.Strip")
extern class Strip extends DisplayObjectContainer {

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
	function new(texture:Texture):Void;

	/**
	 * The texture of the strip
	 */
	var texture:Texture;
	
	/**
	 * Whether the strip is dirty or not
	 */
	var dirty:Bool;
	
	/**
	 * if you need a padding, not yet implemented
	 */
	var padding:Float;
}