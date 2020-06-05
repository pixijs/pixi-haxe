package pixi.plugins.projection;

@:native("PIXI.projection.ObservableEuler")
extern class ObservableEuler {
	function new(cb:Dynamic, scope:Dynamic, ?x:Float, ?y:Float, ?z:Float);
	var cb : Dynamic;
	var scope : Dynamic;
	var _quatUpdateId : Float;
	var _quatDirtyId : Float;
	var quaternion : js.lib.Float64Array;
	var _x : Float;
	var _y : Float;
	var _z : Float;
	var _sign : Float;
	var x : Float;
	var y : Float;
	var z : Float;
	var pitch : Float;
	var yaw : Float;
	var roll : Float;
	function set(?x:Float, ?y:Float, ?z:Float):Void;
	function copyFrom(euler:IEuler):Void;
	function copyTo(p:IEuler):IEuler;
	function equals(euler:IEuler):Bool;
	function clone():Euler;
	function update():Bool;
	//static var prototype : ObservableEuler;
}