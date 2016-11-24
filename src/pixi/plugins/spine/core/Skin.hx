package pixi.plugins.spine.core;

import pixi.plugins.spine.core.attachments.Attachment;

@:native("PIXI.spine.core.Skin")
extern class Skin {

	var name:String;
	var attachments:Array<Dynamic>;

	function new(name:String);

	function addAttachment(slotIndex:Int, name:String, attachment:Attachment):Void;

	function getAttachment(slotIndex:Int, name:String):Attachment;

	function attachAll(skeleton:Dynamic, oldSkin:Skin):Void;
}