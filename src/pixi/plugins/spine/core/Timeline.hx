package pixi.plugins.spine.core;

import pixi.plugins.spine.core.attachments.VertexAttachment;

@:native("PIXI.spine.core.Timeline")
interface Timeline {
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
	function getPropertyId():Float;
}

@:native("PIXI.spine.core.CurveTimeline")
extern class CurveTimeline implements Timeline {
	static var LINEAR:Float;
	static var STEPPED:Float;
	static var BEZIER:Float;
	static var BEZIER_SIZE:Float;
	// private var curves;
	function getPropertyId():Float;
	function new(frameCount:Float);
	function getFrameCount():Float;
	function setLinear(frameIndex:Float):Void;
	function setStepped(frameIndex:Float):Void;
	function getCurveType(frameIndex:Float):Float;
	function setCurve(frameIndex:Float, cx1:Float, cy1:Float, cx2:Float, cy2:Float):Void;
	function getCurvePercent(frameIndex:Float, percent:Float):Float;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.RotateTimeline")
extern class RotateTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_ROTATION:Float;
	static var ROTATION:Float;
	var boneIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, degrees:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.TranslateTimeline")
extern class TranslateTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_X:Float;
	static var PREV_Y:Float;
	static var X:Float;
	static var Y:Float;
	var boneIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, x:Float, y:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.ScaleTimeline")
extern class ScaleTimeline extends TranslateTimeline {
	function new(frameCount:Float);
	function getPropertyId():Float;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.ShearTimeline")
extern class ShearTimeline extends TranslateTimeline {
	function new(frameCount:Float);
	function getPropertyId():Float;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.ColorTimeline")
extern class ColorTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_R:Float;
	static var PREV_G:Float;
	static var PREV_B:Float;
	static var PREV_A:Float;
	static var R:Float;
	static var G:Float;
	static var B:Float;
	static var A:Float;
	var slotIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, r:Float, g:Float, b:Float, a:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.TwoColorTimeline")
extern class TwoColorTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_R:Float;
	static var PREV_G:Float;
	static var PREV_B:Float;
	static var PREV_A:Float;
	static var PREV_R2:Float;
	static var PREV_G2:Float;
	static var PREV_B2:Float;
	static var R:Float;
	static var G:Float;
	static var B:Float;
	static var A:Float;
	static var R2:Float;
	static var G2:Float;
	static var B2:Float;
	var slotIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, r:Float, g:Float, b:Float, a:Float, r2:Float, g2:Float, b2:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.AttachmentTimeline")
extern class AttachmentTimeline implements Timeline {
	var slotIndex:Float;
	var frames:Array<Float>;
	var attachmentNames:Array<String>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function getFrameCount():Float;
	function setFrame(frameIndex:Float, time:Float, attachmentName:String):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, events:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.DeformTimeline")
extern class DeformTimeline extends CurveTimeline {
	var slotIndex:Float;
	var attachment:VertexAttachment;
	var frames:Array<Float>;
	var frameVertices:Array<Array<Float>>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, vertices:Array<Float>):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.EventTimeline")
extern class EventTimeline implements Timeline {
	var frames:Array<Float>;
	var events:Array<Event>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function getFrameCount():Float;
	function setFrame(frameIndex:Float, event:Event):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.DrawOrderTimeline")
extern class DrawOrderTimeline implements Timeline {
	var frames:Array<Float>;
	var drawOrders:Array<Array<Float>>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function getFrameCount():Float;
	function setFrame(frameIndex:Float, time:Float, drawOrder:Array<Float>):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.IkConstraintTimeline")
extern class IkConstraintTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_MIX:Float;
	static var PREV_SOFTNESS:Float;
	static var PREV_BEND_DIRECTION:Float;
	static var PREV_COMPRESS:Float;
	static var PREV_STRETCH:Float;
	static var MIX:Float;
	static var SOFTNESS:Float;
	static var BEND_DIRECTION:Float;
	static var COMPRESS:Float;
	static var STRETCH:Float;
	var ikConstraintIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, mix:Float, softness:Float, bendDirection:Float, compress:Bool, stretch:Bool):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.TransformConstraintTimeline")
extern class TransformConstraintTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_ROTATE:Float;
	static var PREV_TRANSLATE:Float;
	static var PREV_SCALE:Float;
	static var PREV_SHEAR:Float;
	static var ROTATE:Float;
	static var TRANSLATE:Float;
	static var SCALE:Float;
	static var SHEAR:Float;
	var transformConstraintIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, rotateMix:Float, translateMix:Float, scaleMix:Float, shearMix:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.PathConstraintPositionTimeline")
extern class PathConstraintPositionTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_VALUE:Float;
	static var VALUE:Float;
	var pathConstraintIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, value:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.PathConstraintSpacingTimeline")
extern class PathConstraintSpacingTimeline extends PathConstraintPositionTimeline {
	function new(frameCount:Float);
	function getPropertyId():Float;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}

@:native("PIXI.spine.core.PathConstraintMixTimeline")
extern class PathConstraintMixTimeline extends CurveTimeline {
	static var ENTRIES:Float;
	static var PREV_TIME:Float;
	static var PREV_ROTATE:Float;
	static var PREV_TRANSLATE:Float;
	static var ROTATE:Float;
	static var TRANSLATE:Float;
	var pathConstraintIndex:Float;
	var frames:Array<Float>;
	function new(frameCount:Float);
	function getPropertyId():Float;
	function setFrame(frameIndex:Float, time:Float, rotateMix:Float, translateMix:Float):Void;
	function apply(skeleton:Skeleton, lastTime:Float, time:Float, firedEvents:Array<Event>, alpha:Float, blend:MixBlend, direction:MixDirection):Void;
}
