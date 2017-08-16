package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.DragonBones.BoundingBoxType;
import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.BoundingBoxData")
extern class BoundingBoxData extends BaseObject {

	var type:BoundingBoxType;
	var color:Int;
	var vertices:Array<Float>;

	function containsPoint(pX:Float, pY:Float):Bool;
	function intersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float,
								?intersectionPointA: { x:Float, y:Float },
								?intersectionPointB: { x:Float, y:Float },
								?normalRadians: { x:Float, y:Float }):Float;
}