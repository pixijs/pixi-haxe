package pixi.plugins.spine.core;

import pixi.plugins.spine.core.attachments.Attachment;

@:native("PIXI.spine.core.Skin")
extern class Skin {
	var attachments:Array<Attachment>;
	var bones:Array<BoneData>;
	var constraints:Array<ConstraintData>;
	function new(name:String);
	function setAttachment(slotIndex:Float, name:String, attachment:Attachment):Void;
	function addSkin(skin:Skin):Void;
	function copySkin(skin:Skin):Void;
	function getAttachment(slotIndex:Float, name:String):Attachment;
	function removeAttachment(slotIndex:Float, name:String):Void;
	function getAttachments():Array<SkinEntry>;
	function getAttachmentsForSlot(slotIndex:Float, attachments:Array<SkinEntry>):Void;
	function clear():Void;
	function attachAll(skeleton:Skeleton, oldSkin:Skin):Void;
}

@:native("PIXI.spine.core.SkinEntry")
extern class SkinEntry {
	var slotIndex:Float;
	var name:String;
	var attachment:Attachment;
	function new(slotIndex:Float, name:String, attachment:Attachment);
}
