package pixi.plugins.projection;

@:native("PIXI.projection.Point3d")
extern class Point3d extends pixi.plugins.projection.mixins.Point {
	function new(?x:Float, ?y:Float, ?z:Float);
	function set(?x:Float, ?y:Float, ?z:Float):Point3d;
	function copyFrom(p:IPoint):Point3d;
	function copyTo(p:pixi.plugins.projection.mixins.Point):pixi.plugins.projection.mixins.Point;
	//static var prototype : Point3d;
}