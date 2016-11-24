package pixi.plugins.spine.core;

@:native("PIXI.spine.core.EventData")
extern class EventData {

	var name:String;
	var intValue:Int;
	var floatValue:Float;
	var stringValue:String;

	function new(name:String);
}