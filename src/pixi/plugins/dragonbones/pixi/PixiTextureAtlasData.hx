package pixi.plugins.dragonbones.pixi;

import pixi.core.textures.BaseTexture;
import pixi.plugins.dragonbones.texture.TextureAtlasData;

@:native("dragonBones.PixiTextureAtlasData")
extern class PixiTextureAtlasData extends TextureAtlasData {

	var texture:BaseTexture;
}