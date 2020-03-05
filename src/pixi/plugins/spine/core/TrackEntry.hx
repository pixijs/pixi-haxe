package pixi.plugins.spine.core;

@:native("PIXI.spine.core.TrackEntry")
extern class TrackEntry {
	var animation:Animation;
	var next:TrackEntry;
	var mixingFrom:TrackEntry;
	var mixingTo:TrackEntry;
	var listener:AnimationStateListener2;
	var trackIndex:Float;
	var loop:Bool;
	var holdPrevious:Bool;
	var eventThreshold:Float;
	var attachmentThreshold:Float;
	var drawOrderThreshold:Float;
	var animationStart:Float;
	var animationEnd:Float;
	var animationLast:Float;
	var nextAnimationLast:Float;
	var delay:Float;
	var trackTime:Float;
	var trackLast:Float;
	var nextTrackLast:Float;
	var trackEnd:Float;
	var timeScale:Float;
	var alpha:Float;
	var mixTime:Float;
	var mixDuration:Float;
	var interruptAlpha:Float;
	var totalAlpha:Float;
	var mixBlend:MixBlend;
	var timelineMode:Array<Float>;
	var timelineHoldMix:Array<TrackEntry>;
	var timelinesRotation:Array<Float>;
	function reset():Void;
	function getAnimationTime():Float;
	function setAnimationLast(animationLast:Float):Void;
	function isComplete():Bool;
	function resetRotationDirections():Void;
}
