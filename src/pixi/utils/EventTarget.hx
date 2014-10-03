package pixi.utils;

@:native("PIXI.EventTarget")
extern class EventTarget {
	
	/**
	 * Holds all the listeners
	 */
	var listeners:Dynamic;
	
	/**
	 * Adds a listener for a specific event
	 */
	var addEventListener:Dynamic;
	
	/**
	 * Fires the event, ie pretends that the event has happened
	 */
	var dispatchEvent:Dynamic;
	
	/**
	 * Removes the specified listener that was assigned to the specified event type
	 */
	var removeEventListener:Dynamic;
	
}
