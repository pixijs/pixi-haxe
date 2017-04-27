package pixi.plugins.dragonbones.pixi;

import pixi.plugins.dragonbones.animation.WorldClock;
import pixi.plugins.dragonbones.factory.BaseFactory;
import pixi.core.sprites.Sprite;

@:native("dragonBones.PixiFactory")
extern class PixiFactory extends BaseFactory {

	static var factory:PixiFactory;
	static var clock:WorldClock;

	var soundEventManater:PixiArmatureDisplay;

	function new(?dataParser:Dynamic);

	function buildArmatureDisplay(armatureName:String, ?dragonBonesName:String, ?skinName:String, ?textureAtlasName:String):PixiArmatureDisplay;

	function getTextureDisplay(textureName:String, ?dragonBonesName:String):Sprite;
}