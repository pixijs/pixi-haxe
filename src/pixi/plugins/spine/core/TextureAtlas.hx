package pixi.plugins.spine.core;
import haxe.DynamicAccess;
import pixi.core.textures.BaseTexture;
import pixi.core.textures.Texture;


@:native("PIXI.spine.core.TextureAtlas")
extern class TextureAtlas implements Disposable {
	var pages: Array<TextureAtlasPage>;
	var regions:  Array<TextureAtlasRegion>;
	function new(?atlasText: String, textureLoader: String->(BaseTexture-> Void)->Void, ?callback:TextureAtlas->Void);
	
	function addTexture(name: String, texture: Texture): TextureAtlasRegion;
	function addTextureHash(textures: Dynamic<Texture>, stripExtension: Bool): Void;
	function addSpineAtlas(?atlasText: String, textureLoader: String->(BaseTexture-> Void)->Void, ?callback:TextureAtlas->Void): Void;
	//private load(atlasText, textureLoader, callback);
	function findRegion(name: String): TextureAtlasRegion;
	function dispose(): Void;
}

@:native("PIXI.spine.core.TextureAtlasPage")
extern class TextureAtlasPage {
	var name: String;
	//var minFilter: TextureFilter;
	//var magFilter: TextureFilter;
	//var uWrap: TextureWrap;
	//var vWrap: TextureWrap;
	var baseTexture: BaseTexture;
	var width: Int;
	var height: Int;
	function setFilters(): Void;
}

@:native("PIXI.spine.core.TextureAtlasRegion")
extern class TextureAtlasRegion extends TextureRegion {
	var page: TextureAtlasPage;
	var name: String;
	var index: Int;
}