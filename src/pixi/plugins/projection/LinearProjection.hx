package pixi.plugins.projection;

@:native("PIXI.projection.LinearProjection")
extern class LinearProjection<T> extends AbstractProjection {
	function new();
	function updateLocalTransform(lt:pixi.plugins.projection.mixins.Matrix):Void;
	var _projID : Float;
	var _currentProjID : Float;
	var _affine : AFFINE;
	var affinePreserveOrientation : Bool;
	var scaleAfterAffine : Bool;
	var affine : AFFINE;
	var local : T;
	var world : T;
	//static var prototype : LinearProjection<Dynamic>;
}