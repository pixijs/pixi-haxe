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
	 * @type Dynamic
	 */
	var touches:Dynamic;

	/**
	 * @property mouseoverEnabled
	 * @type Bool
	 * @default true
	 */
	var mouseoverEnabled:Bool;

	/**
	 * Tiny little interactiveData pool !
	 *
	 * @property pool
	 * @type Array<Dynamic>
	 */
	var pool:Array<Dynamic>;

	/**
	 * @property onMouseMove
	 * @type InteractionData -> Void
	 */
	var onMouseMove:InteractionData -> Void;

	/**
	 * @property onMouseDown
	 * @type InteractionData -> Void
	 */
	var onMouseDown:InteractionData -> Void;

	/**
	 * @property onMouseOut
	 * @type InteractionData -> Void
	 */
	var onMouseOut:InteractionData -> Void;

	/**
	 * @property onMouseUp
	 * @type InteractionData -> Void
	 */
	var onMouseUp:InteractionData -> Void;

	/**
	 * @property onTouchStart
	 * @type InteractionData -> Void
	 */
	var onTouchStart:InteractionData -> Void;

	/**
	 * @property onTouchEnd
	 * @type InteractionData -> Void
	 */
	var onTouchEnd:InteractionData -> Void;

	/**
	 * @property onTouchMove
	 * @type InteractionData -> Void
	 */
	var onTouchMove:InteractionData -> Void;

	/**
	 * @property last
	 * @type Float
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
	 * @type Bool
	 * @default false
	 */
	var mouseOut:Bool;

	/**
	 * @property resolution
	 * @type Float
	 */
	var resolution:Float;
}