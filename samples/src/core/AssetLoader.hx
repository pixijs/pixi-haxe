package core;

import pixi.loaders.Resource;
import pixi.core.textures.Texture;
import pixi.loaders.Loader;

class AssetLoader extends Loader {

	public var pixelRatio(null, default):Float;
	public var count(default, null):Int;
	public var resolution(default, default):String;
	public var mute(default, set):Bool;

	var _audioAssets:Map<String, AudioAsset>;

	public function new() {
		super();
		count = 0;
		pixelRatio = 1;
		_audioAssets = new Map();
		MultipackParser.loader = this;
		use(MultipackParser.parse);
	}

	public function start(?onComplete:Void -> Void, ?onProgress:Void -> Void) {
		load(onComplete);
		if (progress != null) on("progress", onProgress);
	}

	public inline function addAudioAsset(id:String, path:String, ?onAssetLoaded:Resource -> Void) {
		addAsset(id, path, false, onAssetLoaded);
	}

	public function addAsset(id:String, path:String, ?usePixelRatio:Bool = true, ?onAssetLoaded:Resource -> Void) {
		if (!exists(id)) {
			var url:String = path;

			if (url != "") {
				add(id, url, { loadType: _getLoadtype(path) }, onAssetLoaded);
				count++;
			}
		}
	}

	public inline function getUrl(id:String):String {
		return Reflect.field(resources, id) != null ? Reflect.field(resources, id).url : null;
	}

	@SuppressWarnings("checkstyle:Dynamic")
	public function getJson(id:String):Dynamic {
		var resource:Resource = Reflect.field(resources, id);
		if (resource != null && ~/(json|text|txt)/i.match(resource.xhrType)) return resource.data;
		return null;
	}

	public function getTexture(id:String):Texture {
		var resource:Resource = Reflect.field(resources, id);
		if (resource != null && resource.texture != null) return resource.texture;
		return null;
	}

	public function getTextureFromSpritesheet(id:String, frame:String):Texture {
		var resource:Resource = Reflect.field(resources, id);
		if (resource != null && resource.isJson && resource.textures != null) {
			var texture = Reflect.field(resource.textures, frame);
			if (texture != null) return texture;
		}
		return null;
	}

	public inline function exists(id:String):Bool {
		return (Reflect.field(resources, id) != null);
	}

	public function getAudio(id:String):AudioAsset {
		if (_audioAssets.get(id) == null) _audioAssets.set(id, new AudioAsset(Reflect.field(resources, id).data));
		return _audioAssets.get(id);
	}

	public function getResource(id:String):Resource {
		return Reflect.field(resources, id);
	}

	override public function reset() {
		removeAllListeners();
		count = 0;
		resources = {};
		super.reset();
	}

	public inline function getResoultionPath():String {
		return (resolution != null) ? resolution + "/" : "";
	}

	public inline function getPixelRatioPath(?val:Float):String {
		return (val != null) ? "scale-" + val + "/" : "scale-" + pixelRatio + "/";
	}

	function set_mute(val:Bool):Bool {
		for (audioAsset in _audioAssets) audioAsset.mute = val;
		return mute = val;
	}

	//type: XHR: 1, IMAGE: 2, AUDIO: 3, VIDEO: 4

	function _getLoadtype(asset:String):Int {
		if (~/(.png|.gif|.svg|.jpg|.jpeg|.bmp)/i.match(asset)) return 2;
		else if (~/(.mp3|.wav|.ogg|.aac|.m4a|.oga|.webma)/i.match(asset)) return 3;
		else if (~/(.mp4|.webm|.m3u8)/i.match(asset)) return 4;
		return 1;
	}
}
