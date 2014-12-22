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

	function setAnimationByName(trackIndex:Int, animationName:String, loop:Bool):Void;

	/**
	* Set the current animation. Any queued animations are cleared.
	*/
	function setAnimation(trackIndex:Int, animation:Dynamic, loop:Bool):Void;

	function addAnimationByName(trackIndex:Int, animationName:String, loop:Bool, ?delay:Float = 0):Void;

	/** Adds an animation to be played delay seconds after the current or last queued animation.
	 * @param delay May be <= 0 to use duration of previous animation minus any mix duration plus the negative delay.
	 */
	function addAnimation(trackIndex:Int, animation:Dynamic, loop:Bool, ?delay:Float = 0):Void;

	function isComplete():Bool;
}