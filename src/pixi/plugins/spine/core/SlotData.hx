package pixi.plugins.spine.core;

import pixi.core.Pixi.BlendModes;
import pixi.plugins.spine.core.utils.Color;

@:native("PIXI.spine.core.SlotData")
extern class SlotData {

	var index:Int;
	var name:String;
	var boneData:BoneData;
	var color:Color;
	var attachmentName:String;
	var blendMode:BlendModes;

	function new(index:Int, name:String, boneData:BoneData);
}