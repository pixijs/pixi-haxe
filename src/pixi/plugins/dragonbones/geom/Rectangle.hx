package pixi.plugins.dragonbones.geom;

@:native("dragonBones.Rectangle")
extern class Rectangle {

	function new(x:Float, y:Float, width:Float, height:Float);

	var x:Float;
	var y:Float;
	var width:Float;
	var height:Float;

	function copyFrom(value:Rectangle):Void;
	function clear():Void;
}