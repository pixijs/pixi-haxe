package pixi.plugins.spine.core;

@:native("PIXI.spine.core.EventQueue")
extern class EventQueue {
	var objects:Array<Any>;
	var drainDisabled:Bool;
	var animState:AnimationState;
	function new(animState:AnimationState);
	function start(entry:TrackEntry):Void;
	function interrupt(entry:TrackEntry):Void;
	function end(entry:TrackEntry):Void;
	function dispose(entry:TrackEntry):Void;
	function complete(entry:TrackEntry):Void;
	function event(entry:TrackEntry, event:Event):Void;
	function deprecateStuff():Bool;
	function drain():Void;
	function clear():Void;
}
