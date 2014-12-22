package pixi.spine;

@:native("spine.BoneData")
extern class BoneData {

	function new(name:String, parent:Dynamic);

	var length:Int;
	var x:Float;
	var y:Float;
	var rotation:Float;
	var scaleX:Float;
	var scaleY:Float;
}