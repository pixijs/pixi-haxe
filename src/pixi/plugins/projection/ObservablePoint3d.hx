package pixi.plugins.projection;

@:native("PIXI.projection.ObservablePoint3d")
extern class ObservablePoint3d extends pixi.plugins.projection.mixins.ObservablePoint {
	function new();
	function set(?x:Float, ?y:Float, ?z:Float):ObservablePoint3d;
	function copyFrom(p:IPoint):ObservablePoint3d;
	function copyTo(p:IPoint):IPoint;
	//static var prototype : ObservablePoint3d;
}