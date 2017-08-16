package pixi.plugins.dragonbones.geom;

@:native("dragonBones.ColorTransform")
extern class ColorTransform {

	function new(alphaMultiplier:Float, redMultiplier:Float, greenMultiplier:Float, blueMultiplier:Float,
	alphaOffset:Float, redOffset:Float, greenOffset:Float, blueOffset:Float);

	var alphaMultiplier:Float;
	var redMultiplier:Float;
	var greenMultiplier:Float;
	var blueMultiplier:Float;
	var alphaOffset:Float;
	var redOffset:Float;
	var greenOffset:Float;
	var blueOffset:Float;

	function copyFrom(value:ColorTransform):Void;
	function identity():Void;
}