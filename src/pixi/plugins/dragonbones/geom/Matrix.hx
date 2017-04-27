package pixi.plugins.dragonbones.geom;

@:native("dragonBones.Matrix")
extern class Matrix {

	function new(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float);

	var a:Float;
	var b:Float;
	var c:Float;
	var d:Float;
	var tx:Float;
	var ty:Float;

	function copyFrom(value:Matrix):Matrix;
	function identity():Matrix;
	function concat(value:Matrix):Matrix;
	function invert():Matrix;
	function transformPoint(x:Float, y:Float, result: { x:Float, y:Float }, ?delta:Bool):Void;
}