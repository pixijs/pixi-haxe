package pixi.plugins.projection.mixins;

@:native("PIXI.Transform")
extern class Transform extends pixi.core.display.Transform {
	@:optional
	var proj : pixi.plugins.projection.AbstractProjection;
}