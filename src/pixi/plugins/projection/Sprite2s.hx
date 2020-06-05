package pixi.plugins.projection;

@:native("PIXI.projection.Sprite2s")
extern class Sprite2s extends pixi.plugins.projection.mixins.Sprite {
	function new(texture:Dynamic);
	var proj : ProjectionSurface;
	var aTrans : pixi.plugins.projection.mixins.Matrix;
	function _calculateBounds():Void;
	function calculateVertices():Void;
	function calculateTrimmedVertices():Void;
	//final worldTransform : Dynamic;
	//static var prototype : Sprite2s;
}