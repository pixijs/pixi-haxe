package pixi.plugins.projection;
import haxe.extern.EitherType;

@:native("PIXI.projection.Matrix3d")
extern class Matrix3d {
	function new(?backingArray:ArrayLike<Float>);
	var mat4 : js.lib.Float64Array;
	var floatArray : js.lib.Float32Array;
	var _dirtyId : Float;
	var _updateId : Float;
	var _mat4inv : js.lib.Float64Array;
	var cacheInverse : Bool;
	var a : Float;
	var b : Float;
	var c : Float;
	var d : Float;
	var tx : Float;
	var ty : Float;
	function set(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix3d;
	function toArray(?transpose:Bool, ?out:js.lib.Float32Array):js.lib.Float32Array;
	function setToTranslation(tx:Float, ty:Float, tz:Float):Void;
	function setToRotationTranslationScale(quat:js.lib.Float64Array, tx:Float, ty:Float, tz:Float, sx:Float, sy:Float, sz:Float):js.lib.Float64Array;
	function apply(pos:IPoint, newPos:IPoint):IPoint;
	function translate(tx:Float, ty:Float, tz:Float):Matrix3d;
	function scale(x:Float, y:Float, ?z:Float):Matrix3d;
	function scaleAndTranslate(scaleX:Float, scaleY:Float, scaleZ:Float, tx:Float, ty:Float, tz:Float):Void;
	function applyInverse(pos:IPoint, newPos:IPoint):IPoint;
	function invert():Matrix3d;
	function invertCopyTo(matrix:Matrix3d):Void;
	function identity():Matrix3d;
	function clone():Matrix3d;
	function copyTo3d(matrix:Matrix3d):Matrix3d;
	function copyTo2d(matrix:Matrix2d):Matrix2d;
	function copyTo2dOr3d(matrix:EitherType<Matrix2d, Matrix3d>):EitherType<Matrix2d, Matrix3d>;
	function copyTo(matrix:pixi.plugins.projection.mixins.Matrix, ?affine:AFFINE, ?preserveOrientation:Bool):pixi.plugins.projection.mixins.Matrix;
	function copyFrom(matrix:pixi.plugins.projection.mixins.Matrix):Matrix3d;
	function setToMultLegacy(pt:pixi.plugins.projection.mixins.Matrix, lt:Matrix3d):Matrix3d;
	function setToMultLegacy2(pt:Matrix3d, lt:pixi.plugins.projection.mixins.Matrix):Matrix3d;
	function setToMult(pt:Matrix3d, lt:Matrix3d):Matrix3d;
	function prepend(lt:Dynamic):Void;
	//static var prototype : Matrix3d;
	static final IDENTITY : Matrix3d;
	static final TEMP_MATRIX : Matrix3d;
	static function glMatrixMat4Invert(out:js.lib.Float64Array, a:js.lib.Float64Array):js.lib.Float64Array;
	static function glMatrixMat4Multiply(out:js.lib.Float64Array, a:js.lib.Float64Array, b:js.lib.Float64Array):js.lib.Float64Array;
}