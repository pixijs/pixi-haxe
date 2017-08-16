package pixi.interaction;

import pixi.core.display.DisplayObject;
import pixi.core.math.Point;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI.interaction.InteractionManager")
extern class InteractionManager extends EventEmitter {

	/**
	 * The interaction manager deals with mouse and touch events. Any DisplayObject can be interactive
	 * if its interactive parameter is set to true
	 * This manager also supports multitouch.
	 *
	 * @class
	 * @memberof PIXI.interaction
	 * @param renderer {SystemRenderer} A reference to the current renderer
	 * @param [options] {InteractionManagerOptions}
	 * @param [options.autoPreventDefault=true] {Bool} Should the manager automatically prevent default browser actions.
	 * @param [options.interactionFrequency=10] {Int} Frequency increases the interaction events will be checked.
	 */
	@:overload(function(renderer:SystemRenderer, ?options:InteractionManagerOptions):Void {})
	function new(renderer:WebGLRenderer);

	/**
     * The renderer this interaction manager works for.
     *
     * @member {SystemRenderer}
     */
	var renderer:SystemRenderer;

	/**
     * Should default browser actions automatically be prevented.
     *
     * @member {Bool}
     * @default true
     */
	var autoPreventDefault:Bool;

	/**
     * The current resolution / device pixel ratio.
     *
     * @member {Float}
     * @default 1
     */
	var resolution:Float;

	/**
     * As this frequency increases the interaction events will be checked more often.
     *
     * @member {Int}
     * @default 10
     */
	var interactionFrequency:Int;

	/**
     * The mouse data
     *
     * @member {InteractionData}
     */
	var mouse:InteractionData;

	/**
     * An event data object to handle all the event tracking/dispatching
     *
     * @member {InteractionEvent}
     */
	var eventData:InteractionEvent;

	/**
     * Tiny little interactiveData pool !
     *
     * @member {Array}
     */
	var interactiveDataPool:Array<InteractionData>;

	/**
     * @member {function}
     */
	var onMouseUp:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var onMouseDown:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var onMouseMove:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var onMouseOut:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var onTouchStart:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var onTouchEnd:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var onTouchMove:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var tap:InteractionEvent -> Void;

	/**
     * @member {function}
     */
	var click:InteractionEvent -> Void;

	/**
     * @member {Int}
     */
	var last:Int;

	/**
     * Every update cursor will be reset to this value, if some element wont override it in its hitTest
     * @member {String}
     * @default 'inherit'
     */
	var defaultCursorStyle:String;

	/**
     * The css style of the cursor that is being used
     * @member {String}
     */
	var currentCursorStyle:String;

	/**
	 * Maps x and y coords from a DOM object and maps them correctly to the pixi view. The resulting value is stored in the point.
	 * This takes into account the fact that the DOM element could be scaled and positioned anywhere on the screen.
	 *
	 * @param  {Point} point the point that the result will be stored in
	 * @param  {Float} x the x coord of the position to map
	 * @param  {Float} y the y coord of the position to map
	 */
	function mapPositionToPoint(point:Point, x:Float, y:Float):Void;

	/**
	 * This function is provides a neat way of crawling through the scene graph and running a specified 	function on all interactive objects it finds.
	 * It will also take care of hit testing the interactive objects and passes the hit across in the 	function.
	 *
	 * @param  {Point} point the point that is tested for collision
	 * @param  {Container|Sprite|TilingSprite} displayObject the displayObject that will be hit test (recurcsivly crawls its children)
	 * @param  {function} func the 	function that will be called on each interactive object. The displayObject and hit will be passed to the 	function
	 * @param  {Bool} hitTest this indicates if the objects inside should be hit test against the point
	 * @return {Bool} returns true if the displayObject hit the point
	 */
	function processInteractive(point:Point, displayObject:DisplayObject, func:Void -> Void, hitTest:Bool, interactive:Bool):Bool;
}

typedef InteractionManagerOptions = {
	@:optional var autoPreventDefault:Bool;
	@:optional var interactionFrequency:Int;
}
