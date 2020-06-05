package pixi.plugins.projection;

@:native("PIXI.projection.Camera3d")
extern class Camera3d extends Container3d {
	function new();
	var _far : Float;
	var _near : Float;
	var _focus : Float;
	var _orthographic : Bool;
	final far : Float;
	final near : Float;
	final focus : Float;
	final ortographic : Bool;
	function setPlanes(focus:Float, ?near:Float, ?far:Float, ?orthographic:Bool):Void;
	//static var prototype : Camera3d;
}