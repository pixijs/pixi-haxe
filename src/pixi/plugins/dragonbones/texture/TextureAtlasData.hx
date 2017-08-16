package pixi.plugins.dragonbones.texture;

import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.TextureAtlasData")
extern class TextureAtlasData extends BaseObject {

	function new();

	var autoSearch:Bool;
	var scale:Float;
	var name:String;
	var imagePath:String;
}