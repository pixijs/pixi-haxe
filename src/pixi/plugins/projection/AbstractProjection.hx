package pixi.plugins.projection;

@:native("PIXI.projection.AbstractProjection")
extern class AbstractProjection {
	function new(legacy:pixi.plugins.projection.mixins.Transform, ?enable:Bool);
	var legacy : pixi.plugins.projection.mixins.Transform;
	var _enabled : Bool;
	var enabled : Bool;
	function clear():Void;
	//static var prototype : AbstractProjection;
}