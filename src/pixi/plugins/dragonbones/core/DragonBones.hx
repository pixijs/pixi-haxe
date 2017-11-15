package pixi.plugins.dragonbones.core;

@:native("dragonBones.DragonBones")
extern class DragonBones {

}

@:native("dragonBones.DragonBones.BoundingBoxType")
#if (haxe_ver >= 3.3)
@:enum extern abstract BoundingBoxType(Int) {
	var None; 
	var Rectangle; 
	var Ellipse; 
	var Polygon;
}
#else
extern enum BoundingBoxType {
	None; 
	Rectangle; 
	Ellipse; 
	Polygon;
}
#end

@:native("dragonBones.DragonBones.AnimationFadeOutMode")
#if (haxe_ver >= 3.3)
@:enum extern abstract AnimationFadeOutMode(Int) {
	var None; 
	var SameLayer; 
	var SameGroup; 
	var SameLayerAndGroup; 
	var All;
}
#else
extern enum AnimationFadeOutMode {
	None; 
	SameLayer; 
	SameGroup; 
	SameLayerAndGroup; 
	All;
}
#end