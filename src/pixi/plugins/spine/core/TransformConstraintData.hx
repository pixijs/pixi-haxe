package pixi.plugins.spine.core;

@:native("PIXI.spine.core.TransformConstraintData")
extern class TransformConstraintData {

	var name:String;
	var order:Int;
	var bones:Array<BoneData>;
	var target:BoneData;
	var rotateMix:Float;
	var translateMix:Float;
	var scaleMix:Float;
	var shearMix:Float;
	var offsetRotation:Float;
	var offsetX:Float;
	var offsetY:Float;
	var offsetScaleX:Float;
	var offsetScaleY:Float;
	var offsetShearY:Float;

	function new(name:String);
}