package pixi.plugins.spine.core;

@:native("PIXI.spine.core.SkeletonData")
extern class SkeletonData {

	var name:String;
	var bones:Array<BoneData>; // Ordered parents first.
	var slots:Array<SlotData>; // Setup pose draw order.
	var skins:Array<Skin>;
	var defaultSkin:Skin;
	var events:Array<EventData>;
	var animations:Array<Dynamic>;
	var ikConstraints:Array<IkConstraintData>;
	var transformConstraints:Array<TransformConstraintData>;
	var pathConstraints:Array<PathConstraintData>;
	var width:Float;
	var height:Float;
	var version:String;
	var hash:String;

	// Nonessential
	var fps:Float;
	var imagesPath:String;

	function new();

	function findBone(boneName:String):Dynamic;

	function findBoneIndex(boneName:String):Int;

	function findSlot(slotName:String):Dynamic;

	function findSlotIndex(slotName:String):Int;

	function findSkin(skinName:String):Skin;

	function findEvent(eventDataName:String):Event;

	function findAnimation(animationName:String):Dynamic;

	function findIkConstraint(constraintName:String):Dynamic;

	function findTransformConstraint(constraintName:String):Dynamic;

	function findPathConstraint(constraintName:String):Dynamic;

	function findPathConstraintIndex(pathConstraintName:String):Int;
}