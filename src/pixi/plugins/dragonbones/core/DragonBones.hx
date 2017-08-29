package pixi.plugins.dragonbones.core;

@:native("dragonBones.DragonBones")
extern class DragonBones {

}

@:native("dragonBones.DragonBones.BoundingBoxType")
extern enum BoundingBoxType {
	None; Rectangle; Ellipse; Polygon;
}

@:native("dragonBones.DragonBones.AnimationFadeOutMode")
extern enum AnimationFadeOutMode {
	None; SameLayer; SameGroup; SameLayerAndGroup; All;
}