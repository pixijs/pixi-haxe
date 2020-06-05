package pixi.plugins.projection.mixins;

@:native("PIXI.Graphics")
extern class Graphics extends pixi.core.graphics.Graphics {
	@:optional
	function convertTo2d():Void;
}