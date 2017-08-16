package pixi.plugins.dragonbones.animation;

import pixi.plugins.dragonbones.model.AnimationData;

@:native("dragonBones.AnimationState")
extern class AnimationState {

	var dragonBones:Bool;
	var additiveBlending:Bool;
	var actionEnabled:Bool;
	var playTimes:Float;
	var timeScale:Float;
	var weight:Float;
	var autoFadeOutTime:Float;

	function addBoneMask(name:String, ?recursive:Bool):Void;
	function removeBoneMask(name:String, ?recursive:Bool):Void;
	function removeAllBoneMask():Void;

	var layer:Float;
	var group:String;
	var name:String;
	var animationData:AnimationData;
	var isCompleted:Bool;
	var currentPlayTimes:Float;
	var totalTime:Float;
	var currentTime:Float;
}