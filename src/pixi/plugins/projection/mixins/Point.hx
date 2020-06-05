package pixi.plugins.projection.mixins;

@:native("PIXI.Point")
extern class Point extends pixi.core.math.Point {
	@:optional
	var z : Float;
	function set(?x:Float, ?y:Float, ?z:Float):Void;
}