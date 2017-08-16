package pixi.plugins.dragonbones.armature;

@:native("dragonBones.Bone")
extern class Bone extends TransformObject {

	function invalidUpdate():Void;
	function contains(child:TransformObject):Bool;
	function getBones():Array<Bone>;
	function getSlots():Array<Slot>;

	var visible:Bool;
}