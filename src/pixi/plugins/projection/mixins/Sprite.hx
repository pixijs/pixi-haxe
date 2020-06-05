package pixi.plugins.projection.mixins;

@:native("PIXI.Sprite")
extern class Sprite extends pixi.core.sprites.Sprite {
	function convertTo2s():Void;
	var _texture : Dynamic;
	var vertexData : js.lib.Float32Array;
	var vertexTrimmedData : js.lib.Float32Array;
	@:optional
	var _transformID : Float;
	@:optional
	var _textureID : Float;
	@:optional
	var _transformTrimmedID : Float;
	@:optional
	var _textureTrimmedID : Float;
	@:optional
	var _anchor : ObservablePoint;
	@:optional
	function convertTo2d():Void;

	// from Container, duplicated because of double inheritance / mixin incompatiblity issue - suggestions welcomed
	function convertSubtreeTo2s():Void;
	@:optional
	function convertSubtreeTo2d():Void;
	function convertTo3d():Void;
	function convertSubtreeTo3d():Void;
}