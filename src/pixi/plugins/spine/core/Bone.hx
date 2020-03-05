package pixi.plugins.spine.core;

import pixi.core.math.Matrix;
import pixi.plugins.dragonbones.model.BoneData;

@:native("PIXI.spine.core.Bone")
extern class Bone {
	static var yDown:Bool;

	var matrix:Matrix;
	var worldX(default, never):Float;
	var worldY(default, never):Float;
	var data:BoneData;
	var skeleton:Skeleton;
	var parent:Bone;
	var children:Array<Bone>;
	var x:Float;
	var y:Float;
	var rotation:Float;
	var scaleX:Float;
	var scaleY:Float;
	var shearX:Float;
	var shearY:Float;
	var ax:Float;
	var ay:Float;
	var arotation:Float;
	var ascaleX:Float;
	var ascaleY:Float;
	var ashearX:Float;
	var ashearY:Float;
	var appliedValid:Bool;
	var sorted:Bool;
	var active:Bool;

	function new(data:BoneData, skeleton:Skeleton, parent:Bone);
	function isActive():Bool;
	function update():Void;
	function updateWorldTransform():Void;
	function updateWorldTransformWith(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, shearX:Float, shearY:Float):Void;
	function setToSetupPose():Void;
	function getWorldRotationX():Float;
	function getWorldRotationY():Float;
	function getWorldScaleX():Float;
	function getWorldScaleY():Float;
	function updateAppliedTransform():Void;
	function worldToLocal(world:Vector2):Vector2;
	function localToWorld(local:Vector2):Vector2;
	function worldToLocalRotation(worldRotation:Float):Float;
	function localToWorldRotation(localRotation:Float):Float;
	function rotateWorld(degrees:Float):Void;
}
