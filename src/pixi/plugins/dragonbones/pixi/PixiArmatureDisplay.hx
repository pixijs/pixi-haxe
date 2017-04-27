package pixi.plugins.dragonbones.pixi;

import pixi.plugins.dragonbones.animation.Animation;
import pixi.plugins.dragonbones.armature.Armature;
import pixi.plugins.dragonbones.event.EventObject;
import pixi.core.display.Container;

@:native("dragonBones.PixiArmatureDisplay")
extern class PixiArmatureDisplay extends Container {

	function hasEvent(type:String):Bool;

	function addEvent(type:String, listener:EventObject -> Void, target:Dynamic):Void;

	function removeEvent(type:String, listener:EventObject -> Void, target: Dynamic):Void;

	function dispose(?disposeProxy:Bool):Void;

	var armature:Armature;
	var animation:Animation;
}