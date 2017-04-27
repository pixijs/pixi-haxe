package pixi.plugins.dragonbones.event;

import pixi.plugins.dragonbones.model.CustomData;
import pixi.plugins.dragonbones.armature.Armature;
import pixi.plugins.dragonbones.armature.Slot;
import pixi.plugins.dragonbones.armature.Bone;
import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.EventObject")
extern class EventObject extends BaseObject {

	static var START:String;
	static var LOOP_COMPLETE:String;
	static var COMPLETE:String;
	static var FADE_IN:String;
	static var FADE_IN_COMPLETE:String;
	static var FADE_OUT:String;
	static var FADE_OUT_COMPLETE:String;
	static var FRAME_EVENT:String;
	static var SOUND_EVENT:String;

	var type:String;
	var name:String;
	var frame:Dynamic;
	var data:CustomData;
	var armature:Armature;
	var bone:Bone;
	var slot:Slot;
	var animationState:Dynamic;
}