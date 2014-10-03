package phaser.pixi.extras;

@:native("PIXI.Strip")
extern class Strip extends phaser.pixi.display.DisplayObjectContainer {
	
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
