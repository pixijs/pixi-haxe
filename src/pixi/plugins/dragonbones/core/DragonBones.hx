package pixi.plugins.dragonbones.core;

@:native("dragonBones.DragonBones")
extern class DragonBones {

}

@:native("dragonBones.DragonBones.BoundingBoxType")
@:enum extern abstract BoundingBoxType(Int) {
	var None; 
	var Rectangle; 
	var Ellipse; 
	var Polygon;
}

@:native("dragonBones.DragonBones.AnimationFadeOutMode")
@:enum extern abstract AnimationFadeOutMode(Int) {
	var None; 
	var SameLayer; 
	var SameGroup; 
	var SameLayerAndGroup; 
	var All;
}