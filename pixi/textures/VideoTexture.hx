package pixi.textures;

import pixi.core.Rectangle;
import pixi.textures.BaseTexture;

@:native("PIXI.VideoTexture")
extern class VideoTexture extends BaseTexture {

	function new(source:String, scaleMode:Float);

	var onPlayStart:Void -> Void;
	var onPlayStop:Void -> Void;
	var onCanPlay:Void -> Void;

	/**
	 * Mimic Pixi BaseTexture.from.... method.
	 * @param video
	 * @param scaleMode
	 * @returns {PIXI.VideoTexture}
	 */
	static function baseTextureFromVideo(video:Dynamic, scaleMode:Float):VideoTexture;

	/**
	 * Mimic PIXI Texture.from... method.
	 * @param video
	 * @param scaleMode
	 * @returns {PIXI.Texture}
	 */
	static function textureFromVideo(video:Dynamic, scaleMode:Float):Texture;

	static function fromUrl(videoSrc:String, ?scaleMode:Float):VideoTexture;
}