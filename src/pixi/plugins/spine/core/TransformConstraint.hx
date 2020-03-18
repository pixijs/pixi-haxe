package pixi.plugins.spine.core;

@:native("PIXI.spine.core.TransformConstraint")
extern class TransformConstraint implements Updatable {
	var data:TransformConstraintData;
	var bones:Array<Bone>;
	var target:Bone;
	var rotateMix:Float;
	var translateMix:Float;
	var scaleMix:Float;
	var shearMix:Float;
	var temp:Vector2;
	var active:Bool;
	function new(data:TransformConstraintData, skeleton:Skeleton);
	function isActive():Bool;
	function apply():Void;
	function update():Void;
	function applyAbsoluteWorld():Void;
	function applyRelativeWorld():Void;
	function applyAbsoluteLocal():Void;
	function applyRelativeLocal():Void;
}
