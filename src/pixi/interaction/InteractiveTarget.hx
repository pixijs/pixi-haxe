package pixi.interaction;

import pixi.core.math.shapes.Shape;
import pixi.interaction.EventEmitter;

@:native("PIXI.interaction.interactiveTarget")
extern class InteractiveTarget extends EventEmitter {

	/**
	 * Fired when a pointer device button (usually a mouse button) is pressed on the display
	 * object.
	 *
	 * @event mousedown
	 * @memberof InteractiveTarget#
	 */
	dynamic function mousedown(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device secondary button (usually a mouse right-button) is pressed
	 * on the display object.
	 *
	 * @event rightdown
	 * @memberof InteractiveTarget#
	 */
	dynamic function rightdown(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button (usually a mouse button) is released over the display
	 * object.
	 *
	 * @event mouseup
	 * @memberof InteractiveTarget#
	 */
	dynamic function mouseup(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device secondary button (usually a mouse right-button) is released
	 * over the display object.
	 *
	 * @event rightup
	 * @memberof InteractiveTarget#
	 */
	dynamic function rightup(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button (usually a mouse button) is pressed and released on
	 * the display object.
	 *
	 * @event click
	 * @memberof InteractiveTarget#
	 */
	dynamic function click(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device secondary button (usually a mouse right-button) is pressed
	 * and released on the display object.
	 *
	 * @event rightclick
	 * @memberof InteractiveTarget#
	 */
	dynamic function rightclick(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button (usually a mouse button) is released outside the
	 * display object that initially registered a
	 * [mousedown]{@link PIXI.interaction.InteractionManager#event:mousedown}.
	 *
	 * @event mouseupoutside
	 * @memberof InteractiveTarget#
	 */
	dynamic function mouseupoutside(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device secondary button (usually a mouse right-button) is released
	 * outside the display object that initially registered a
	 * [rightdown]{@link PIXI.interaction.InteractionManager#event:rightdown}.
	 *
	 * @event rightupoutside
	 * @memberof InteractiveTarget#
	 */
	dynamic function rightupoutside(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device (usually a mouse) is moved while over the display object
	 *
	 * @event mousemove
	 * @memberof InteractiveTarget#
	 */
	dynamic function mousemove(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device (usually a mouse) is moved onto the display object
	 *
	 * @event mouseover
	 * @memberof InteractiveTarget#
	 */
	dynamic function mouseover(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device (usually a mouse) is moved off the display object
	 *
	 * @event mouseout
	 * @memberof InteractiveTarget#
	 */
	dynamic function mouseout(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button is pressed on the display object.
	 *
	 * @event pointerdown
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointerdown(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button is released over the display object.
	 *
	 * @event pointerup
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointerup(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button is pressed and released on the display object.
	 *
	 * @event pointertap
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointertap(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device button is released outside the display object that initially
	 * registered a [pointerdown]{@link PIXI.interaction.InteractionManager#event:pointerdown}.
	 *
	 * @event pointerupoutside
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointerupoutside(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device is moved while over the display object
	 *
	 * @event pointermove
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointermove(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device is moved onto the display object
	 *
	 * @event pointerover
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointerover(event:InteractionEvent):Void;

	/**
	 * Fired when a pointer device is moved off the display object
	 *
	 * @event pointerout
	 * @memberof InteractiveTarget#
	 */
	dynamic function pointerout(event:InteractionEvent):Void;

	/**
	 * Fired when a touch point is placed on the display object.
	 *
	 * @event touchstart
	 * @memberof InteractiveTarget#
	 */
	dynamic function touchstart(event:InteractionEvent):Void;

	/**
	 * Fired when a touch point is removed from the display object.
	 *
	 * @event touchend
	 * @memberof InteractiveTarget#
	 */
	dynamic function touchend(event:InteractionEvent):Void;

	/**
	 * Fired when a touch point is placed and removed from the display object.
	 *
	 * @event tap
	 * @memberof InteractiveTarget#
	 */
	dynamic function tap(event:InteractionEvent):Void;

	/**
	 * Fired when a touch point is removed outside of the display object that initially
	 * registered a [touchstart]{@link PIXI.interaction.InteractionManager#event:touchstart}.
	 *
	 * @event touchendoutside
	 * @memberof InteractiveTarget#
	 */
	dynamic function touchendoutside(event:InteractionEvent):Void;

	/**
	 * Fired when a touch point is moved along the display object.
	 *
	 * @event touchmove
	 * @memberof InteractiveTarget#
	 */
	dynamic function touchmove(event:InteractionEvent):Void;

	/**
	 * Indicates if the displayObject is interactive or not.
	 *
	 * @member {Bool}
	 * @default false
	 * @memberof InteractiveTarget#
	 */
	var interactive:Bool;

	/**
	 * Indicates if the children of displayObject are interactive or not.
	 *
	 * @member {Bool}
	 * @default true
	 * @memberof InteractiveTarget#
	 */
	var interactiveChildren:Bool;

	/**
	 * Interaction shape. Children will be hit first, then this shape will be checked.
	 *
	 * @member {Shape}
	 * @memberof InteractiveTarget#
	 * @default null
	 */
	var hitArea:Shape;

	/**
	 * Indicates if the displayObject uses button mode or normal mode.
	 *
	 * @member {Bool}
	 * @default false
	 * @memberof InteractiveTarget#
	 */
	var buttonMode:Bool;

	/**
	 * Default cursor.
	 *
	 * @member {String}
	 * @default pointer
	 * @memberof InteractiveTarget#
	 */
	var defaultCursor:String;

	// some internal checks..
	/**
	 * Internal check to detect if the mouse cursor is hovered over the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _over:Bool;

	/**
	 * Internal check to detect if the left mouse button is pressed on the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _isLeftDown:Bool;

	/**
	 * Internal check to detect if the right mouse button is pressed on the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _isRightDown:Bool;

	/**
	 * Internal check to detect if the pointer cursor is hovered over the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _pointerOver:Bool;

	/**
	 * Internal check to detect if the pointer is down on the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _pointerDown:Bool;

	/**
	 * Internal check to detect if a user has touched the displayObject
	 *
	 * @member {Bool}
	 * @private
	 */
	@:noCompletion var _touchDown:Bool;
}