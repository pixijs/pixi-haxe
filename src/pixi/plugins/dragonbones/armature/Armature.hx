package pixi.plugins.dragonbones.armature;

import pixi.plugins.dragonbones.animation.WorldClock;
import pixi.plugins.dragonbones.animation.Animation;
import pixi.plugins.dragonbones.model.ArmatureData;
import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.Armature")
extern class Armature extends BaseObject {

	var inheritAnimation:Bool;
	var userData:Dynamic;
	var name:String;
	var armatureData:ArmatureData;
	var animation:Animation;
	var display:Dynamic;
	var parent:Slot;
	var cacheFrameRate:Float;
	var clock:WorldClock;
	var replacedTexture:Dynamic;

	function dispose():Void;

	function advanceTime(passedTime:Float):Void;
	function invalidUpdate(?boneName:String, ?updateSlotDisplay:Bool):Void;
	function containsPoint(x:Float, y:Float): Slot;
	function intersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float,
								?intersectionPointA: { x:Float, y:Float },
								?intersectionPointB: { x:Float, y:Float },
								?normalRadians: { x:Float, y:Float }):Slot;
	function getBone(name:String):Bone;
	function getBoneByDisplay(display:Dynamic):Bone;

	function getSlot(name:String):Slot;
	function replaceTexture(texture:Dynamic):Void;
	function getBones():Array<Bone>;
	function getSlots():Array<Slot>;
}