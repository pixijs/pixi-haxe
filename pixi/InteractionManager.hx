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
     * A reference to the stage
     *
     * @property stage
     * @type Stage
     */
	var stage:Stage;

	/**
     * The mouse data
     *
     * @property mouse
     * @type InteractionData
     */
	var mouse:InteractionData;

	/**
     * An object that stores current touches (InteractionData) by id reference
     *
     * @property touches
     * @type Object
     */
	var touches:Dynamic;

	/**
     * @property mouseoverEnabled
     * @type Boolean
     * @default true
     */
	var mouseoverEnabled:Bool;

	/**
     * Tiny little interactiveData pool !
     *
     * @property pool
     * @type Array
     */
	var pool:Array<Dynamic>;

	/**
     * @property onMouseMove
     * @type Function
     */
	var onMouseMove:InteractionData -> Void;

	/**
     * @property onMouseDown
     * @type Function
     */
    var onMouseDown:InteractionData -> Void;

	/**
     * @property onMouseOut
     * @type Function
     */
    var onMouseOut:InteractionData -> Void;

	/**
     * @property onMouseUp
     * @type Function
     */
    var onMouseUp:InteractionData -> Void;

	/**
     * @property onTouchStart
     * @type Function
     */
    var onTouchStart:InteractionData -> Void;

	/**
     * @property onTouchEnd
     * @type Function
     */
    var onTouchEnd:InteractionData -> Void;

	/**
     * @property onTouchMove
     * @type Function
     */
    var onTouchMove:InteractionData -> Void;

	/**
     * @property last
     * @type Number
     */
	var last:Float;

	/**
     * The css style of the cursor that is being used
     * @property currentCursorStyle
     * @type String
     */
	var currentCursorStyle:String;

	/**
     * Is set to true when the mouse is moved out of the canvas
     * @property mouseOut
     * @type Boolean
     * @default false
     */
	var mouseOut:Bool;

	/**
     * @property resolution
     * @type Number
     */
	var resolution:Float;
}