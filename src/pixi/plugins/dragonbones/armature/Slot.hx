package pixi.plugins.dragonbones.armature;

import pixi.plugins.dragonbones.model.BoundingBoxData;
@:native("dragonBones.Slot")
extern class Slot extends TransformObject {

	var displayController:String;

	function containsPoint(x:Float, y:Float):Bool;
	function intersectsSegment(xA:Float, yA:Float, xB:Float, yB:Float,
								?intersectionPointA: { x:Float, y:Float },
								?intersectionPointB: { x:Float, y:Float },
								?normalRadians: { x:Float, y:Float }):Float;

	function invalidUpdate():Void;

	var boundingBoxData:BoundingBoxData;
	var displayIndex:Float;
	var displayList:Array<Dynamic>;
	var display:Dynamic;
	var childArmature:Armature;
}