package pixi.spine;

@:native("spine.SkeletonData")
extern class SkeletonData {

	var bones:Array<Dynamic>;
	var slots:Array<Dynamic>;
	var skins:Array<Dynamic>;
	var animations:Array<Dynamic>;

	function findBone(boneName:String):Dynamic;

	function findBoneIndex(boneName:String):Int;

	function findSlot(slotName:String):Dynamic;

	function findSlotIndex(slotName:String):Int;

	function findSkin(skinName:String):Dynamic;

	function findAnimation(animationName:String):Dynamic;
}