package phaser.pixi;

@:native("PIXI.InteractionManager")
extern class InteractionManager {
	
	/**
	 * The interaction manager deals with mouse and touch events. Any DisplayObject can be interactive
	 * if its interactive parameter is set to true
	 * This manager also supports multitouch.
	 */
	function new (Stage:Dynamic);
	
	/**
	 * a reference to the stage
	 */
	var stage:Dynamic;
	
	/**
	 * the mouse data
	 */
	var mouse:Dynamic;
	
	/**
	 * an object that stores current touches (InteractionData) by id reference
	 */
	var touchs:Dynamic;
	
	/**
	 * @property mouseoverEnabled
	 */
	var mouseoverEnabled:Dynamic;
	
	/**
	 * tiny little interactiveData pool !
	 */
	var pool:Array<Dynamic>;
	
	/**
	 * An array containing all the iterative items from the our interactive tree
	 */
	var interactiveItems:Array<Dynamic>;
	
	/**
	 * Our canvas
	 */
	var interactionDOMElement:Dynamic;
	
	/**
	 * The css style of the cursor that is being used
	 */
	var currentCursorStyle:String;
	
	/**
	 * Is set to true when the mouse is moved out of the canvas
	 */
	var mouseOut:Bool;
	
}
