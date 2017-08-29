package pixi.plugins.spine.core;

@:native("PIXI.spine.core.PathConstraintData")
extern class PathConstraintData {

	var name:String;
	var order:Int;
	var bones:Array<BoneData>;
	var target:BoneData;
	var positionMode:PositionMode;
	var spacingMode:SpacingMode;
	var rotateMode:RotateMode;
	var shearMix:Float;
	var offsetRotation:Float;
	var position:Float;
	var spacing:Float;
	var rotateMix:Float;
	var translateMix:Float;

	function new(name:String);
}

enum PositionMode {
	Fixed;
	Percent;
}

enum SpacingMode {
	Length;
	Fixed;
	Percent;
}

enum RotateMode {
	Tangent;
	Chain;
	ChainScale;
}