package pixi.accessibility;

import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.SystemRenderer;

@:native("PIXI.accessibility.AccessibilityManager")
extern class AccessibilityManager {

	/**
	 * The Accessibility manager reacreates the ability to tab and and have content read by screen
	 * readers. This is very important as it can possibly help people with disabilities access pixi
	 * content.
	 *
	 * Much like interaction any DisplayObject can be made accessible. This manager will map the
	 * events as if the mouse was being used, minimizing the efferot required to implement.
	 *
	 * @class
	 * @memberof PIXI
	 */
	function new(renderer:SystemRenderer);

	/**
   	 * Setting this to true will visually show the divs
   	 *
   	 * @type {Bool}
   	 */
	var debug:Bool;

	/**
     * The renderer this accessibility manager works for.
     *
     * @member {SystemRenderer}
     */
	var renderer:SystemRenderer;

	function createTouchHook():Void;

	function capHitArea(hitArea:Rectangle):Void;

	/**
	 * Destroys the accessibility manager
	 *
	 */
	function destroy():Void;
}