package pixi.plugins.spine.core;

@:native("PIXI.spine.core.BoneData")
extern class BoneData {
	var index:Int;
	var name:String;
	var parent:BoneData;
	var length:Int;
	var x:Float;
	var y:Float;
	var rotation:Float;
	var scaleX:Float;
	var scaleY:Float;
	var shearX:Float;
	var shearY:Float;
	var transformMode:TransformMode;
	var skinRequired:Bool;
	var color:Color;

	function new(index:Int, name:String, parent:BoneData);
}
