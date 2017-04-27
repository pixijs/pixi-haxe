package pixi.plugins.dragonbones.animation;

@:native("dragonBones.WorldClock")
extern class WorldClock implements IAnimateble {

	function new();

	var time:Float;
	var timeScale:Float;
	var clock:WorldClock;

	function advanceTime(passedTime:Float):Void;

	function contains(value:IAnimateble):Bool;
	function add(value:IAnimateble):Void;
	function remove(value:IAnimateble):Void;
	function clear():Void;
}