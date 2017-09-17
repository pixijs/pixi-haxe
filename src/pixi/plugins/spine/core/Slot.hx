package pixi.plugins.spine.core;
import haxe.DynamicAccess;
import pixi.core.display.DisplayObject;
import pixi.plugins.spine.core.attachments.Attachment;


@:native("PIXI.spine.core.Slot")
extern class Slot 
{
	var currentMesh: Dynamic;
	var currentSprite: Dynamic;
	var currentGraphics: Dynamic;
	var clippingContainer: Dynamic;
	var meshes: Dynamic;
	var currentMeshName: String;
	var sprites: DynamicAccess<DisplayObject>;
	var currentSpriteName: String;
	var blendMode: Float;
	//var tempRegion: TextureRegion;
	var tempAttachment: Attachment;
	var data: SlotData;
	var bone: Bone;
	var color: Color;
	var darkColor: Color;
	var attachment: Attachment;
	var attachmentTime: Float;	//?
	var attachmentVertices: Array<Float>;
	function new(data: SlotData, bone: Bone):Void;
	function getAttachment(): Attachment;
	function setAttachment(attachment: Attachment): Void;
	function setAttachmentTime(time: Float): Void;
	function getAttachmentTime(): Float;
	function setToSetupPose(): Void;
}