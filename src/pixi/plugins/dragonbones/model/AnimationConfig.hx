package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.DragonBones.AnimationFadeOutMode;
import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.AnimationConfig")
extern class AnimationConfig extends BaseObject {

	var pauseFadeOut:Bool;
	var fadeOutMode:AnimationFadeOutMode;
	var fadeOutTime:Float;
	var fadeOutEasing:Float;
	var additiveBlending:Bool;
	var displayControl:Bool;
	var pauseFadeIn:Bool;
	var actionEnabled:Bool;
	var playTimes:Float;
	var layer:Float;
	var position:Float;
	var duration:Float;
	var timeScale:Float;
	var fadeInTime:Float;
	var autoFadeOutTime:Float;
	var fadeInEasing:Float;
	var weight:Float;
	var name:String;
	var animationName:String;
	var group:String;
	var boneMask:Array<String>;
	var animationNames:Array<String>;
}