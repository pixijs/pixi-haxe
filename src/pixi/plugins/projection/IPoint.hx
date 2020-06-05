package pixi.plugins.projection;

typedef IPoint = {
	function copyFrom(p:IPoint):IPoint;
	function copyTo(p:IPoint):IPoint;
	function equals(p:IPoint):Bool;
	var x:Float;
	var y:Float;
	@:optional
	var z : Float;
	function set(?x:Float, ?y:Float, ?z:Float):Void;
};