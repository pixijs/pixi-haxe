package pixi.plugins.spine.core;

enum abstract TransformMode(Int) {
	var Normal = 0;
	var OnlyTranslation = 1;
	var NoRotationOrReflection = 2;
	var NoScale = 3;
	var NoScaleOrReflection = 4;
}