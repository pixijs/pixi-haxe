package pixi.spine;

@:native("spine.AnimationStateData")
extern class AnimationStateData {
	function new(data:SkeletonData);

	var skeletonData:SkeletonData;
	var animationToMixTime:Dynamic;

	var defaultMix:Float;

	function setMixByName(fromName:String, toName:String, duration:Float):Void;

	function setMix(f:Dynamic, t:Dynamic, duration:Float):Void;

	function getMix(f:Dynamic, t:Dynamic):Float;
}
