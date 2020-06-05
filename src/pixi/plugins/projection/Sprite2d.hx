package pixi.plugins.projection;

@:native("PIXI.projection.Sprite2d")
extern class Sprite2d extends pixi.plugins.projection.mixins.Sprite {
	function new(texture:Dynamic);
	var vertexData2d : js.lib.Float32Array;
	var proj : Projection2d;
	function _calculateBounds():Void;
	function calculateVertices():Void;
	function calculateTrimmedVertices():Void;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	//final worldTransform : Dynamic;
	//static var prototype : Sprite2d;
}