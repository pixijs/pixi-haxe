package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.ArmatureData")
extern class ArmatureData extends BaseObject {

	var frameRate:Float;
	var name:String;
	var bones:Dynamic;
	var animations:Dynamic;
	var parent:DragonBonesData;

	function getBone(name:String):BoneData;
	function getSlot(name:String):SlotData;
	function getAnimation(name:String):AnimationData;

	var animationNames:Array<String>;
	var defaultAnimation:AnimationData;
}