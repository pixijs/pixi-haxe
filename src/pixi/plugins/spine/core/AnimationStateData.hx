package pixi.plugins.spine.core;

@:native("PIXI.spine.core.AnimationStateData")
extern class AnimationStateData {

	function new(skeletonData:Dynamic);

	function setMix(fromName:String, toName:String, duration:Float):Void;
	function setMixByName(fromName:String, toName:String, duration:Float):Void;

	function setMixWith(from:Dynamic, to:Dynamic, duration:Float):Void;

	function getMix(from:Dynamic, to:Dynamic):Dynamic;
}