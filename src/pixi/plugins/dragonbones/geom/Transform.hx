package pixi.plugins.dragonbones.geom;

@:native("dragonBones.Transform")
extern class Transform {

	function new(x:Float, y:Float, skewX:Float, skewY:Float, scaleX:Float, scaleY:Float);

	var x:Float;
	var y:Float;
	var skewX:Float;
	var skewY:Float;
	var scaleX:Float;
	var scaleY:Float;
	var rotation:Float;

	function fromMatrix(matrix:Matrix):Transform;
	function toMatrix(matrix:Matrix):Transform;
}