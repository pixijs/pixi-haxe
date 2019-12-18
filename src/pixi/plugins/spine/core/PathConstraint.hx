package pixi.plugins.spine.core;
import pixi.plugins.spine.core.attachments.PathAttachment;

//TODO
extern class PathConstraint implements Updatable
{
	static var NONE: Float;
	static var BEFORE: Float;
	static var AFTER: Float;
	static var epsilon: Float;
	var data: PathConstraintData;
	var bones: Array<Bone>;
	var target: Slot;
	var position: Float;
	var spacing: Float;
	var rotateMix: Float;
	var translateMix: Float;
	var spaces: Array<Float>;
	var positions: Array<Float>;
	var world: Array<Float>;
	var curves: Array<Float>;
	var lengths: Array<Float>;
	var segments: Array<Float>;
	var active: Bool;
	function new(data: PathConstraintData, skeleton: Skeleton);
	function isActive(): Bool;
	function apply(): Void;
	function update(): Void;
	function computeWorldPositions(path: PathAttachment, spacesCount: Float, tangents: Bool, percentPosition: Bool, percentSpacing: Bool): Array<Float>;
	function addBeforePosition(p: Float, temp: Array<Float>, i: Float, out: Array<Float>, o: Float): Void;
	function addAfterPosition(p: Float, temp: Array<Float>, i: Float, out: Array<Float>, o: Float): Void;
	function addCurvePosition(p: Float, x1: Float, y1: Float, cx1: Float, cy1: Float, cx2: Float, cy2: Float, x2: Float, y2: Float, out: Array<Float>, o: Float, tangents: Bool): Void;
	
}