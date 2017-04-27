package core;

import pixi.loaders.Resource;
import pixi.core.utils.Utils;
import pixi.core.math.shapes.Rectangle;
import pixi.core.textures.Texture;

class MultipackParser {

	public static var loader:AssetLoader;

	public static function parse(resource:Resource, next:Void -> Void) {
		var data:MultipackSpriteSheet = resource.data;
		if (data != null && data.multipack) {
			var textures:Array<MultipackTexture> = data.textures;
			var imgCount:Int = textures.length;
			var imgLoadedCount:Int = 0;
			var resolution:Float = Utils.getResolutionOfUrl(resource.url);

			var baseURL:String = resource.url.split(loader.baseUrl)[1];
			baseURL = baseURL.substring(0, baseURL.lastIndexOf("/") + 1);

			for (texture in textures) {
				var url:String = baseURL + texture.meta.image;
				loader.add(texture.meta.image, url, { loadType: 2, crossOrigin:resource.crossOrigin }, function(image:Resource) {

					var frames:Array<FrameData> = texture.frames;
					for (n in Reflect.fields(frames)) {
						var frameData:FrameData = Reflect.field(frames, n);
						var rect = frameData.frame;
						if (rect != null) {
							var size:Rectangle = new Rectangle(rect.x, rect.y, rect.w, rect.h);
							var trim:Rectangle = null;

							if (frameData.trimmed) {
								var actualSize = frameData.sourceSize;
								var realSize = frameData.spriteSourceSize;
								trim = new Rectangle(realSize.x / resolution, realSize.y / resolution, actualSize.w / resolution, actualSize.h / resolution);
							}

							size.x /= resolution;
							size.y /= resolution;
							size.width /= resolution;
							size.height /= resolution;

							Texture.addTextureToCache(new Texture(image.texture.baseTexture, size, size.clone(), trim), n);
						}
					}
				});
			}
			next();
		}
		else next();
	}
}

typedef MultipackSpriteSheet = {
	var multipack:Bool;
	var textures:Array<MultipackTexture>;
}

typedef MultipackTexture = {
	var frames:Array<FrameData>;
	var meta:MetaData;
}

typedef FrameData = {
	var frame:Frame;
	var rotated:Bool;
	var trimmed:Bool;
	var format:String;
	var spriteSourceSize:SpriteSourceSize;
	var sourceSize:SourceSize;
}

typedef Frame = {
	var x:Float;
	var y:Float;
	var w:Float;
	var h:Float;
}

typedef SpriteSourceSize = {
	var x:Float;
	var y:Float;
	var w:Float;
	var h:Float;
}

typedef SourceSize = {
	var w:Float;
	var h:Float;
}

typedef MetaData = {
	var app:String;
	var version:String;
	var image:String;
	var format:String;
	var size:String;
	var scale:String;
	var smartupdate:String;
}