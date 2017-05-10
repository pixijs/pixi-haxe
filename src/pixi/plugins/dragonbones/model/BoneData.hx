package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.BoneData")
extern class BoneData extends BaseObject {

	var name:String;
	var parent:BoneData;
}