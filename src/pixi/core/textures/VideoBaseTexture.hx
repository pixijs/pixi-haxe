package pixi.core.textures;

import js.html.VideoElement;

@:native("PIXI.VideoBaseTexture")
extern class VideoBaseTexture extends BaseTexture {

	/**
	 * A texture of a [playing] Video.
	 *
	 * Video base textures mimic Pixi BaseTexture.from.... method in their creation process.
	 *
	 * This can be used in several ways, such as:
	 *
	 * ```haxe
	 * var texture = VideoBaseTexture.fromUrl('http://mydomain.com/video.mp4');
	 *
	 * var texture = VideoBaseTexture.fromUrl({ src: 'http://mydomain.com/video.mp4', mime: 'video/mp4' });
	 *
	 * var texture = VideoBaseTexture.fromUrls(['/video.webm', '/video.mp4']);
	 *
	 * var texture = VideoBaseTexture.fromUrls([
	 *     { src: '/video.webm', mime: 'video/webm' },
	 *     { src: '/video.mp4', mime: 'video/mp4' }
	 * ]);
	 * ```
	 *
	 * See the ["deus" demo](http://www.goodboydigital.com/pixijs/examples/deus/).
	 *
	 * @class
	 * @extends BaseTexture
	 * @memberof PIXI
	 * @param source {HTMLVideoElement}
	 * @param [scaleMode] {Int} See {@link SCALE_MODES} for possible values
	 */
	function new(source:VideoElement, ?scaleMode:Int);

	/**
	 * When set to true will automatically play videos used by this texture once
	 * they are loaded. If false, it will not modify the playing state.
	 *
	 * @member {Bool}
	 * @default true
	 */
	var autoPlay:Bool;

	/**
     * Should the base texture automatically update itself, set to true by default
     *
     * @member {Bool}
     */
	var autoUpdate:Bool;

	/**
	 * Mimic Pixi BaseTexture.from.... method.
	 *
	 * @static
	 * @param video {HTMLVideoElement}
	 * @param scaleMode {Int} See {@link SCALE_MODES} for possible values
	 * @return {VideoBaseTexture}
	 */
	static function fromVideo(video:VideoElement, ?scaleMode:Int):VideoBaseTexture;

	/**
	 * Mimic Pixi BaseTexture.from.... method.
	 *
	 * This can be used in a couple ways, such as:
	 *
	 * ```haxe
	 * 	var texture = VideoBaseTexture.fromUrl('http://mydomain.com/video.mp4');
	 *
	 * 	var texture = VideoBaseTexture.fromUrl({ src: 'http://mydomain.com/video.mp4', mime: 'video/mp4' });
	 *
	 * 	var texture = VideoBaseTexture.fromUrls(['/video.webm', '/video.mp4']);
	 *
	 * 	var texture = VideoBaseTexture.fromUrls([
	 *     { src: '/video.webm', mime: 'video/webm' },
	 *     { src: '/video.mp4', mime: 'video/mp4' }
	 * ]);
	 * ```
	 *
	 * @alias fromUrls
	 * @static
	 * @param videoSrc {String|object|String[]|object[]} The URL(s) for the video.
	 * @param [videoSrc.src] {String} One of the source urls for the video
	 * @param [videoSrc.mime] {String} The mimetype of the video (e.g. 'video/mp4'). If not specified
	 *  the url's extension will be used as the second part of the mime type.
	 * @param scaleMode {Int} See {@link SCALE_MODES} for possible values
	 * @return {VideoBaseTexture}
	 */
	static function fromUrl(videoSrc:String, ?scaleMode:Int):VideoBaseTexture;
	static function fromUrls(videoSrc:Array<String>, ?scaleMode:Int):VideoBaseTexture;
}