package pixi.plugins.projection;

@:native("PIXI.projection.Sprite3d")
extern class Sprite3d extends pixi.plugins.projection.mixins.Sprite {
	function new(texture:Dynamic);
	var vertexData2d : js.lib.Float32Array;
	var proj : Projection3d;
	var culledByFrustrum : Bool;
	var trimmedCulledByFrustrum : Bool;
	function calculateVertices():Void;
	function calculateTrimmedVertices():Void;
	function _calculateBounds():Void;
	function _render(renderer:Dynamic):Void;
	function containsPoint(point:IPoint):Bool;
	//final worldTransform : Dynamic;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	function isFrontFace(?forceUpdate:Bool):Dynamic;
	function getDepth(?forceUpdate:Bool):Dynamic;
	var position3d : IPoint;
	var scale3d : IPoint;
	var euler : Euler;
	var pivot3d : IPoint;
	//static var prototype : Sprite3d;
}