package pixi.plugins.dragonbones.animation;

import pixi.plugins.dragonbones.model.AnimationConfig;
import pixi.plugins.dragonbones.core.DragonBones.AnimationFadeOutMode;
import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.Animation")
extern class Animation extends BaseObject {

	var timeScale:Float;

	function reset():Void;

	function stop(animationName:String):Void;

	function playConfig(animationConfig:AnimationConfig):AnimationState;

	function fadeIn(animationName:String, ?fadeInTime:Float, ?playTimes:Float, ?layer:Float, ?group:String = null, ?fadeOutMode:AnimationFadeOutMode):AnimationState;

	function play(?animationName:String, ?playTimes:Float):AnimationState;

	function gotoAndPlayByTime(animationName:String, ?time:Float, ?playTimes:Float):AnimationState;

	function gotoAndPlayByFrame(animationName:String, ?frame:Float, ?playTimes:Float):AnimationState;

	function gotoAndPlayByProgress(animationName:String, ?progress:Float, ?playTimes:Float):AnimationState;

	function gotoAndStopByTime(animationName:String, ?time:Float):AnimationState;

	function gotoAndStopByFrame(animationName:String, ?frame:Float):AnimationState;

	function gotoAndStopByProgress(animationName:String, ?progress:Float):AnimationState;

	function getState(animationName:String):AnimationState;

	function hasAnimation(animationName:String):Bool;

	var isPlaying:Bool;
	var isCompleted:Bool;
	var lastAnimationName:String;
	var lastAnimationState:AnimationState;
	var animationConfig:AnimationConfig;
	var animationNames:Array<String>;
	var animations:Dynamic;
}