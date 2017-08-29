package pixi.plugins.dragonbones.model;

@:native("dragonBones.AnimationData")
extern class AnimationData {

	function new();

	var frameCount:Int;
	var playTimes:Int;
	var duration:Float;
	var fadeInTime:Float;
	var name:String;
}