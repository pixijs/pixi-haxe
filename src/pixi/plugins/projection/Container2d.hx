package pixi.plugins.projection;

@:native("PIXI.projection.Container2d")
extern class Container2d extends pixi.plugins.projection.mixins.Container {
	function new();
	var proj : Projection2d;
	function toLocal<T>(position:global.pixi.IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	//final worldTransform : Dynamic;
	//static var prototype : Container2d;
}