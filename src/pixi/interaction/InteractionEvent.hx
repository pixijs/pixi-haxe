package pixi.interaction;

import pixi.core.display.DisplayObject;
import pixi.interaction.InteractionData;

@:native("PIXI.interaction.InteractionEvent")
extern class InteractionEvent {
	/**
     * Constructor
     *
     */
	function new();

	/**
	 * Whether this event will continue propagating in the tree
	 *
	 * @member {boolean}
	 */
	var stopped:Bool;

	/**
         * The object which caused this event to be dispatched.
         * For listener callback see {@link PIXI.interaction.InteractionEvent.currentTarget}.
         *
         * @member {PIXI.DisplayObject}
         */
    var target:DisplayObject;

    /**
     * The object whose event listener’s callback is currently being invoked.
     *
     * @member {PIXI.DisplayObject}
     */
    var currentTarget:DisplayObject;

    /*
     * Type of the event
     *
     * @member {string}
     */
    var type:String;

    /*
     * InteractionData related to this event
     *
     * @member {PIXI.interaction.InteractionData}
     */
    var data:InteractionData;


	/**
     * Prevents event from reaching any objects other than the current object.
     *
     */
    function stopPropagation():Void;
}