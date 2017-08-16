package pixi.plugins.spine.core;

@:native("PIXI.spine.core.Event")
extern class Event {

	var data:EventData;
	var intValue:Int;
	var floatValue:Float;
	var stringValue:String;
	var time:Float;

	function new(time:Float, data:EventData);
}