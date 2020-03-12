package pixi.plugins.spine.core;

@:native("PIXI.spine.core.SkeletonData")
extern class SkeletonData {
	var name:String;
	var bones:Array<BoneData>;
	var slots:Array<SlotData>;
	var skins:Array<Skin>;
	var defaultSkin:Skin;
	var events:Array<EventData>;
	var animations:Array<Animation>;
	var ikConstraints:Array<IkConstraintData>;
	var transformConstraints:Array<TransformConstraintData>;
	var pathConstraints:Array<PathConstraintData>;
	
	var x:Float;
	var y:Float;
	var width:Float;
	var height:Float;
	var version:String;
	var hash:String;

	var fps:Float;
	var imagesPath:String;
	var audioPath:String;

	function new();

	function findBone(boneName:String):Bone;
	function findBoneIndex(boneName:String):Int;
	function findSlot(slotName:String):Slot;
	function findSlotIndex(slotName:String):Int;
	function findSkin(skinName:String):Skin;
	function findEvent(eventDataName:String):Event;
	function findAnimation(animationName:String):Animation;
	function findIkConstraint(constraintName:String):IkConstraintData;
	function findTransformConstraint(constraintName:String):TransformConstraintData;
	function findPathConstraint(constraintName:String):PathConstraintData;
	function findPathConstraintIndex(pathConstraintName:String):Int;
}
