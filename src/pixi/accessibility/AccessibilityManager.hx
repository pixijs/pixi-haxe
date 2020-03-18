package pixi.accessibility;

import haxe.extern.EitherType;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.AbstractRenderer;

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
	function new(renderer:AbstractRenderer);

	/**
	 * Setting this to true will visually show the divs
	 *
	 * @type {Bool}
	 */
	var debug:Bool;

	/**
	 * A flag
	 */
	var isActive(default, null):Bool;

	/**
	 * A flag
	 */
	var isMobileAccessibility(default, null):Bool;

	/**
	 * The renderer this accessibility manager works for.
	 *
	 * @member {AbstractRenderer}
	 */
	var renderer:AbstractRenderer;

	/**
	 * Adjust the hit area based on the bounds of a display object
	 * @param	hitArea Bounds of the child
	 */
	function capHitArea(hitArea:Rectangle):Void;

	/**
	 * Destroys the accessibility manager
	 *
	 */
	function destroy():Void;
}
