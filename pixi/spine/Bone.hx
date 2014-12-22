package pixi.spine;

@:native("spine.Bone")
extern class Bone {

	function new(boneData:BoneData, parent:Dynamic);

	var x:Float;
	var y:Float;
	var rotation:Float;
	var scaleX:Float;
	var scaleY:Float;
	var m00:Float;
	var m01:Float;
	var m10:Float;
	var m11:Float;
	var worldX:Float;
	var worldY:Float;
	var worldRotation:Float;
	var worldScaleX:Float;
	var worldScaleY:Float;
}