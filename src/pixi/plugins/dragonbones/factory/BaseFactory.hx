package pixi.plugins.dragonbones.factory;

import pixi.plugins.dragonbones.armature.Slot;
import pixi.plugins.dragonbones.armature.Armature;
import pixi.plugins.dragonbones.texture.TextureAtlasData;
import pixi.plugins.dragonbones.model.DragonBonesData;

@:native("dragonBones.BaseFactory")
extern class BaseFactory {

	function new();

	var autoSearch:Bool;

	function parseDragonBonesData(rawData:Dynamic, ?name:String, ?scale:Float):DragonBonesData;
	function parseTextureAtlasData(rawData:Dynamic, textureAtlas:Dynamic, ?name:String, ?scale:Float):TextureAtlasData;
	function getDragonBonesData(name:String):DragonBonesData;
	function addDragonBonesData(data:DragonBonesData, ?name:String):Void;
	function removeDragonBonesData(name:String, ?disposeData:Bool):Void;
	function getTextureAtlasData(name:String):Array<TextureAtlasData>;
	function addTextureAtlasData(data:TextureAtlasData, ?name:String):Void;
	function removeTextureAtlasData(name:String, ?disposeData:Bool):Void;
	function clear(?disposeData:Bool):Void;
	function buildArmature(armatureName:String, ?dragonBonesName:String, ?skinName:String, ?textureAtlasName:String):Armature;
	function copyAnimationsToArmature(toArmature:Armature, fromArmatreName:String, ?fromSkinName:String, ?fromDragonBonesDataName:String, ?replaceOriginalAnimation:Bool):Bool;
	function replaceSlotDisplay(dragonBonesName:String, armatureName:String, slotName:String, displayName:String, slot:Slot, ?displayIndex:Float):Void;
	function replaceSlotDisplayList(dragonBonesName:String, armatureName:String, slotName:String, slot:Slot):Void;
}