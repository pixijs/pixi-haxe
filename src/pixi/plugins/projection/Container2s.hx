package pixi.plugins.projection;

@:native("PIXI.projection.Container2s")
extern class Container2s extends pixi.plugins.projection.mixins.Container {
	function new();
	var proj : ProjectionSurface;
	//final worldTransform : Dynamic;
	//static var prototype : Container2s;
}