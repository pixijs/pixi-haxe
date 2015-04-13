package pixi.interaction;

import pixi.plugins.eventemitter.EventTarget;
import pixi.core.display.DisplayObject;
import pixi.core.math.Point;
import js.html.Event;
import js.html.HtmlElement;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI.interaction.InteractionManager")
extern class InteractionManager {

	/**
	 * The interaction manager deals with mouse and touch events. Any DisplayObject can be interactive
	 * if its interactive parameter is set to true
	 * This manager also supports multitouch.
	 *
	 * @class
	 * @memberof PIXI.interaction
	 * @param renderer {CanvasRenderer|WebGLRenderer} A reference to the current renderer
	 */
	@:overload( function(renderer:CanvasRenderer):Void {})
	function new(renderer:WebGLRenderer);

	var renderer:Dynamic;

	/**
     * The mouse data
     *
     * @member {InteractionData}
     */
	var mouse:InteractionData;

	/**
     * An event data object to handle all the event tracking/dispatching
     *
     * @member {EventTarget}
     */
	var eventData:EventTarget;

	/**
     * Tiny little interactiveData pool !
     *
     * @member {Array}
     */
	var interactiveDataPool:Array<Dynamic>;

	/**
     * The DOM element to bind to.
     *
     * @member {HTMLElement}
     * @private
     */
	var interactionDOMElement:HtmlElement;

	/**
     * Have events been attached to the dom element?
     *
     * @member {Bool}
     * @private
     */
	var eventsAdded:Bool;

	/**
     * @member {function}
     */
	var onMouseUp:Event -> Void;

	/**
     * @member {function}
     */
	var onMouseDown:Event -> Void;

	/**
     * @member {function}
     */
	var onMouseMove:Event -> Void;

	/**
     * @member {function}
     */
	var onMouseOut:Event -> Void;

	/**
     * @member {function}
     */
	var onTouchStart:Event -> Void;

	/**
     * @member {function}
     */
	var onTouchEnd:Event -> Void;

	/**
     * @member {function}
     */
	var onTouchMove:Event -> Void;

	/**
     * @member {Int}
     */
	var last:Int;

	/**
     * The css style of the cursor that is being used
     * @member {String}
     */
	var currentCursorStyle:String;

	/**
     * The current resolution
     * @member {Float}
     */
	var resolution:Float;

	/**
	 * Maps x and y coords from a DOM object and maps them correctly to the pixi view. The resulting value is stored in the point.
	 * This takes into account the fact that the DOM element could be scaled and positioned anywhere on the screen.
	 *
	 * @param  {Point} point the point that the result will be stored in
	 * @param  {Float} x     the x coord of the position to map
	 * @param  {Float} y     the y coord of the position to map
	 */
	function mapPositionToPoint(point:Point, x:Float, y:Float):Void;

	/**
	 * This 	function is provides a neat way of crawling through the scene graph and running a specified 	function on all interactive objects it finds.
	 * It will also take care of hit testing the interactive objects and passes the hit across in the 	function.
	 *
	 * @param  {Point} point the point that is tested for collision
	 * @param  {Container|Sprite|TilingSprite} displayObject the displayObject that will be hit test (recurcsivly crawls its children)
	 * @param  {	function} func the 	function that will be called on each interactive object. The displayObject and hit will be passed to the 	function
	 * @param  {Bool} hitTest this indicates if the objects inside should be hit test against the point
	 * @return {Bool} returns true if the displayObject hit the point
	 */
	function processInteractive(point:Point, displayObject:DisplayObject, func:Void -> Void, hitTest:Bool, interactive:Bool):Bool;
}