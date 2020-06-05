package pixi.plugins.projection;

@:native("PIXI.projection.Surface")
extern class Surface implements IWorldTransform {
	function new();
	var surfaceID : String;
	var _updateID : Float;
	var vertexSrc : String;
	var fragmentSrc : String;
	function fillUniforms(uniforms:Dynamic):Void;
	function clear():Void;
	function boundsQuad(v:ArrayLike<Float>, out:Dynamic, ?after:pixi.plugins.projection.mixins.Matrix):Void;
	function apply(pos:IPoint, newPos:IPoint):IPoint;
	function applyInverse(pos:IPoint, newPos:IPoint):IPoint;
	//static var prototype : Surface;
}