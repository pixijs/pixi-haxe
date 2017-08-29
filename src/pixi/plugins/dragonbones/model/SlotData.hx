package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.SlotData")
extern class SlotData extends BaseObject {

	var name:String;
	var parent:BoneData;
}