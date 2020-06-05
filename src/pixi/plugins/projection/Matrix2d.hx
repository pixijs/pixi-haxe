package pixi.plugins.projection;

@:native("PIXI.projection.Matrix2d")
extern class Matrix2d {
	function new(?backingArray:ArrayLike<Float>);
	var mat3 : js.lib.Float64Array;
	var floatArray : js.lib.Float32Array;
	var a : Float;
	var b : Float;
	var c : Float;
	var d : Float;
	var tx : Float;
	var ty : Float;
	function set(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2d;
	function toArray(?transpose:Bool, ?out:js.lib.Float32Array):js.lib.Float32Array;
	function apply(pos:IPoint, newPos:IPoint):IPoint;
	function translate(tx:Float, ty:Float):Matrix2d;
	function scale(x:Float, y:Float):Matrix2d;
	function scaleAndTranslate(scaleX:Float, scaleY:Float, tx:Float, ty:Float):Void;
	function applyInverse(pos:IPoint, newPos:IPoint):IPoint;
	function invert():Matrix2d;
	function identity():Matrix2d;
	function clone():Matrix2d;
	function copyTo2dOr3d(matrix:Matrix2d):Matrix2d;
	function copyTo(matrix:pixi.plugins.projection.mixins.Matrix, ?affine:AFFINE, ?preserveOrientation:Bool):pixi.plugins.projection.mixins.Matrix;
	function copyFrom(matrix:pixi.plugins.projection.mixins.Matrix):Matrix2d;
	function setToMultLegacy(pt:pixi.plugins.projection.mixins.Matrix, lt:Matrix2d):Matrix2d;
	function setToMultLegacy2(pt:Matrix2d, lt:pixi.plugins.projection.mixins.Matrix):Matrix2d;
	function setToMult(pt:Matrix2d, lt:Matrix2d):Matrix2d;
	function prepend(lt:Dynamic):Matrix2d;
	//static var prototype : Matrix2d;
	static final IDENTITY : Matrix2d;
	static final TEMP_MATRIX : Matrix2d;
}