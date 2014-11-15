package pixi;

import pixi.display.Stage;

@:native("PIXI.InteractionManager")
extern class InteractionManager {

    /**
     * The interaction manager deals with mouse and touch events. Any DisplayObject can be interactive
     * if its interactive parameter is set to true
     * This manager also supports multitouch.
     *
     * @class InteractionManager
     * @constructor
     * @param stage {Stage} The stage to handle interactions
     */
	function new(stage:Stage);

	/**
	 * a reference to the stage
	 */
	var stage:Stage;

    /**
     * @property resolution
     * @type Number
     */
    var resolution:Float;

	/**
	 * the mouse data
	 */
	var mouse:InteractionData;

	/**
	 * an object that stores current touches (InteractionData) by id reference
	 */
	var touchs:Dynamic;

	/**
	 * @property mouseoverEnabled
	 */
	var mouseoverEnabled:Bool;

	/**
	 * tiny little interactiveData pool !
	 */
	var pool:Array<Dynamic>;

	/**
	 * An array containing all the iterative items from the our interactive tree
	 */
	var interactiveItems:Array<Dynamic>;

	/**
	 * The css style of the cursor that is being used
	 */
	var currentCursorStyle:String;

	/**
	 * Is set to true when the mouse is moved out of the canvas
	 */
	var mouseOut:Bool;

    /**
     * @property last
     * @type Number
     */
    var last:Float;

    var mousedown:InteractionData -> Void;
    var mouseout:InteractionData -> Void;
    var mouseup:InteractionData -> Void;
    var mousemove:InteractionData -> Void;
    var touchstart:InteractionData -> Void;
    var touchmove:InteractionData -> Void;
    var touchend:InteractionData -> Void;
}