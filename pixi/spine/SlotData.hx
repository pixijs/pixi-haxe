package pixi.spine;

@:native("spine.SlotData")
extern class SlotData {

	function new(name:String, boneData:BoneData);

	var r:Int;
	var g:Int;
	var b:Int;
	var a:Int;
	var attachmentName:String;
}