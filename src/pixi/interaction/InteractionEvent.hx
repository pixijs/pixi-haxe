package pixi.interaction;

import pixi.core.display.DisplayObject;
import pixi.interaction.InteractionData;

@:native("PIXI.interaction.InteractionEvent")
extern class InteractionEvent {

	/**
	 * Event class that mimics native DOM events.
	 *
	 * @class
	 * @memberof PIXI.interaction
	 */
	function new();

	/**
	 * Whether this event will continue propagating in the tree
	 *
	 * @member {Bool}
	 */
	var stopped:Bool;

	/**
	 * The object which caused this event to be dispatched.
	 * For listener callback see {@link PIXI.interaction.InteractionEvent.currentTarget}.
	 *
	 * @member {DisplayObject}
	 */
	var target:DisplayObject;

	/**
     * The object whose event listener’s callback is currently being invoked.
     *
     * @member {DisplayObject}
     */
	var currentTarget:DisplayObject;

	/*
     * Type of the event
     *
     * @member {String}
     */
	var type:String;

	/*
     * InteractionData related to this event
     *
     * @member {InteractionData}
     */
	var data:InteractionData;

	/**
     * Prevents event from reaching any objects other than the current object.
     *
     */
	function stopPropagation():Void;
}