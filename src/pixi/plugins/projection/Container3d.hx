package pixi.plugins.projection;

@:native("PIXI.projection.Container3d")
extern class Container3d extends pixi.plugins.projection.mixins.Container {
	function new();
	var proj : Projection3d;
	function isFrontFace(?forceUpdate:Bool):Bool;
	function getDepth(?forceUpdate:Bool):Float;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	//final worldTransform : Dynamic;
	var position3d : IPoint;
	var scale3d : IPoint;
	var euler : IEuler;
	var pivot3d : IPoint;
	//static var prototype : Container3d;
}