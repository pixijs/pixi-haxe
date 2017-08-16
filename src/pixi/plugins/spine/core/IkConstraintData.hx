package pixi.plugins.spine.core;

@:native("PIXI.spine.core.IkConstraintData")
extern class IkConstraintData {

	var name:String;
	var order:Int;
	var bones:Array<BoneData>;
	var target:BoneData;
	var bendDirection:Int;
	var mix:Float;

	function new(name:String);
}