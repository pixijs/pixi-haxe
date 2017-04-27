package pixi.plugins.dragonbones.geom;

@:native("dragonBones.Point")
extern class Point {

	function new(x:Float, y:Float);

	var x:Float;
	var y:Float;

	function copyFrom(value:Point):Void;
	function clear():Void;
}