package pixi.plugins.dragonbones.core;

@:native("dragonBones.BaseObject")
extern class BaseObject {

	static function setMaxCount(objectConstructor:BaseObject, maxCount:Int):Void;
	static function clearPool(?objectConstructor:BaseObject):Void;
	static function borrowObject(?objectConstructor:BaseObject):BaseObject;

	var hashCode:Int;
}