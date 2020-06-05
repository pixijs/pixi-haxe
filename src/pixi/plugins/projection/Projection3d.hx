package pixi.plugins.projection;

@:native("PIXI.projection.Projection3d")
extern class Projection3d extends LinearProjection<Matrix3d> {
	function new(legacy:pixi.plugins.projection.mixins.Transform, ?enable:Bool);
	var cameraMatrix : Matrix3d;
	var _cameraMode : Bool;
	var cameraMode : Bool;
	var position : ObservablePoint3d;
	var scale : ObservablePoint3d;
	var euler : ObservableEuler;
	var pivot : ObservablePoint3d;
	function onChange():Void;
	//static var prototype : Projection3d;
}