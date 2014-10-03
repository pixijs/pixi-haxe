package phaser.pixi;

@:native("PIXI.InteractionData")
extern class InteractionData {
	
	/**
	 * Holds all information related to an Interaction event
	 */
	function new ();
	
	/**
	 * This point stores the global coords of where the touch/mouse event happened
	 */
	var global:Dynamic;
	
	/**
	 * The target Sprite that was interacted with
	 */
	var target:Dynamic;
	
	/**
	 * When passed to an event handler, this will be the original DOM Event that was captured
	 */
	var originalEvent:Dynamic;
	
}
