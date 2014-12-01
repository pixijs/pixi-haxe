package pixi.spine;

@:native("spine.AnimationState")
extern class AnimationState {
	function new(stateData:AnimationStateData);

	var data:AnimationStateData;
	var queue:Array<Dynamic>;

	var animationSpeed:Float;
	var current:Dynamic;
	var previous:Dynamic;
	var currentTime:Float;
	var previousTime:Float;
	var currentLoop:Bool;
	var previousLoop:Bool;
	var mixTime:Float;
	var mixDuration:Float;

	function update(delta:Float):Void;

	function apply(skeleton:Skeleton):Void;

	function clearAnimation():Void;

	function setAnimationByName(animationName:String, loop:Bool):Void;

	function setAnimation(animation:Dynamic, loop:Bool):Void;

	function addAnimationByName(animationName:String, loop:Bool, ?delay:Float = 0):Void;

	function addAnimation(animation:Dynamic, loop:Bool, ?delay:Float = 0):Void;

	function isComplete():Bool;
}