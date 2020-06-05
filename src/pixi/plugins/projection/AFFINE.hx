package pixi.plugins.projection;

@:native("PIXI.projection.AFFINE")
@:enum
extern abstract AFFINE(Int) from Int to Int {
	var NONE;
	var FREE;
	var AXIS_X;
	var AXIS_Y;
	var POINT;
	var AXIS_XR;
}