package pixi.plugins.projection.mixins;

@:native("PIXI.Container")
extern class Container extends pixi.core.display.Container {
	function convertTo2s():Void;
	function convertSubtreeTo2s():Void;
	@:optional
	function convertTo2d():Void;
	@:optional
	function convertSubtreeTo2d():Void;
	function convertTo3d():Void;
	function convertSubtreeTo3d():Void;
}
