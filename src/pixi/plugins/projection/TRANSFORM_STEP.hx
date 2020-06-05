package pixi.plugins.projection;

@:native("PIXI.projection.TRANSFORM_STEP")
@:enum
extern abstract TRANSFORM_STEP(Int) from Int to Int {
	var NONE;
	var BEFORE_PROJ;
	var PROJ;
	var ALL;
}