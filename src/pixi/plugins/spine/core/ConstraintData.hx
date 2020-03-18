package pixi.plugins.spine.core;

@:native("PIXI.spine.core.ConstraintData")
extern class ConstraintData {
	var name:String;
	var order:Float;
	var skinRequired:Bool;
	function new(name:String, order:Float, skinRequired:Bool);
}
