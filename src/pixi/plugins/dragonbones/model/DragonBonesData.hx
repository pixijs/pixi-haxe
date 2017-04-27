package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.DragonBonesData")
extern class DragonBonesData extends BaseObject {

	var autoSearch:Bool;
	var frameRate:Float;
	var version:String;
	var name:String;
	var armatures:Dynamic;

	function getArmature(name:String):ArmatureData;

	var armatureNames:Array<String>;
}