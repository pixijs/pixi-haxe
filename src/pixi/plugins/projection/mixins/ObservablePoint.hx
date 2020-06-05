package pixi.plugins.projection.mixins;

@:native("PIXI.ObservablePoint")
extern class ObservablePoint extends pixi.core.math.ObservablePoint {
	@:optional
	var _x : Float;
	@:optional
	var _y : Float;
	@:optional
	var _z : Float;
	var z : Float;
	@:optional
	var cb : Dynamic;
	@:optional
	var scope : Dynamic;
	function set(?x:Float, ?y:Float, ?z:Float):Void;
}