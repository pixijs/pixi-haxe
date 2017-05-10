package pixi.core.textures;

import haxe.extern.EitherType;
import js.html.CanvasElement;
import haxe.extern.EitherType;
import pixi.interaction.EventEmitter;
import js.html.VideoElement;
import pixi.core.math.shapes.Rectangle;

@:native("PIXI.Texture")
extern class Texture extends EventEmitter {

	/**
	 * A texture stores the information that represents an image or part of an image. It cannot be added
	 * to the display list directly. Instead use it as the texture for a Sprite. If no frame is provided then the whole image is used.
	 *
	 * You can directly create a texture from an image and then reuse it multiple times like this :
	 *
	 * ```js
	 * 	var texture = PIXI.Texture.fromImage('assets/image.png');
	 * 	var sprite1 = new PIXI.Sprite(texture);
	 * 	var sprite2 = new PIXI.Sprite(texture);
	 * ```
	 *
	 * @class
	 * @mixes eventTarget
	 * @memberof PIXI
	 * @param baseTexture {BaseTexture} The base texture source to create the texture from
	 * @param [frame] {Rectangle} The rectangle frame of the texture to show
	 * @param [crop] {Rectangle} The area of original texture
	 * @param [trim] {Rectangle} Trimmed texture rectangle
	 * @param [rotate] {boolean} indicates whether the texture should be rotated by 90 degrees ( used by texture packer )
	 */
	function new(baseTexture:EitherType<BaseTexture, VideoBaseTexture>, ?frame:Rectangle, ?crop:Rectangle, ?trim:Rectangle, ?rotate:Bool);

	/**
	 * Does this Texture have any frame data assigned to it?
	 *
	 * @member {Bool}
	 */
	var noFrame:Bool;

	/**
	 * The base texture that this texture uses.
	 *
	 * @member {BaseTexture}
	 */
	var baseTexture:BaseTexture;

	/**
	 * The texture trim data.
	 *
	 * @member {Rectangle}
	 */
	var trim:Rectangle;

	/**
	 * This will let the renderer know if the texture is valid. If it's not then it cannot be rendered.
	 *
	 * @member {Bool}
	 */
	var valid:Bool;

	/**
	 * This will let a renderer know that a texture has been updated (used mainly for webGL uv updates)
	 *
	 * @member {Bool}
	 */
	var requiresUpdate:Bool;

	/**
	 * This is the area of original texture, before it was put in atlas
	 *
	 * @member {Rectangle}
	 */
	var orig:Rectangle;

	/**
	 * The width of the Texture in pixels.
	 *
	 * @member {Float}
	 */
	var width:Float;

	/**
	 * Extra field for extra plugins. May contain clamp settings and some matrices
	 * @type {Object}
	 */
	var transform:Dynamic;

	/**
	 * The ids under which this Texture has been added to the texture cache. This is
	 * automatically set as long as Texture.addToCache is used, but may not be set if a
	 * Texture is added directly to the TextureCache array.
	 *
	 * @member {Array<String>}
	 */
	var textureCacheIds:Array<String>;

	/**
	 * The height of the Texture in pixels.
	 *
	 * @member {Float}
	 */
	var height:Float;

	/**
	 * This is the area of the BaseTexture image to actually copy to the Canvas / WebGL when rendering,
	 * irrespective of the actual frame size or placement (which can be influenced by trimmed texture atlases)
	 *
	 * @member {Rectangle}
	 */
	var crop:Rectangle;

	/**
	 * The rotation value of the texture, copied to a sprite when assigned to it.
	 *
	 * @member {Float}
	 */
	var rotation:Float;

	/**
	 * The frame specifies the region of the base texture that this texture uses
	 *
	 * @member {Rectangle}
	 */
	var frame:Rectangle;

	/**
	 * Destroys this texture
	 *
	 * @param destroyBase {Bool} Whether to destroy the base texture as well
	 */
	function destroy(?destroyBase:Bool):Void;

	/**
     * Creates a new texture object that acts the same as this one.
     *
     * @return {Texture} The new texture
     */
	function clone():Texture;

	/**
	 * Updates this texture on the gpu.
	 *
	 */
	function update():Void;

	/**
	 * Helper function that creates a Texture object from the given image url.
	 * If the image is not in the texture cache it will be  created and loaded.
	 *
	 * @static
	 * @param imageUrl {String} The image url of the texture
	 * @param crossorigin {Bool} Whether requests should be treated as crossorigin
	 * @param scaleMode {Int} See {{#crossLink "PIXI/scaleModes:property"}}scaleModes{{/crossLink}} for possible values
	 * @return Texture
	 */
	static function fromImage(imageId:String, ?crossorigin:Bool, ?scaleMode:Int):Texture;

	/**
	 * Helper function that creates a sprite that will contain a texture from the TextureCache based on the frameId
	 * The frame ids are created when a Texture packer file has been loaded
	 *
	 * @static
	 * @param frameId {String} The frame Id of the texture in the cache
	 * @return {Texture} The newly created texture
	 */
	static function fromFrame(frameId:String):Texture;

	/**
	 * Helper function that creates a new Texture based on the given canvas element.
	 *
	 * @static
	 * @param canvas {Canvas} The canvas element source of the texture
	 * @param scaleMode {Int} See {{#crossLink "PIXI/scaleModes:property"}}scaleModes{{/crossLink}} for possible values
	 * @param {String} [origin='canvas'] - A string origin of who created the base texture
	 * @return {Texture}
	 */
	static function fromCanvas(canvas:Dynamic, ?scaleMode:Int, ?origin:String):Texture;

	/**
	 * Helper function that creates a new Texture based on the given video element.
	 *
	 * @static
	 * @param video {VideoElement|String} The URL or actual element of the video
	 * @param scaleMode {Int} See {{#crossLink "PIXI/scaleModes:property"}}scaleModes{{/crossLink}} for possible values
	 * @return {Texture} A Texture
	 */
	static function fromVideo(video:EitherType<VideoElement, String>, ?scaleMode:Int):Texture;

	/**
	 * Helper function that creates a new Texture based on the video url.
	 *
	 * @static
	 * @param videoUrl {String}
	 * @param scaleMode {Int} See {{#crossLink "PIXI/scaleModes:property"}}scaleModes{{/crossLink}} for possible values
	 * @return {Texture} A Texture
	 */
	static function fromVideoUrl(videoUrl:String, ?scaleMode:Int):Texture;

	/**
     * Helper function that creates a new Texture based on the source you provide.
     * The soucre can be - frame id, image url, video url, canvae element, video element, base texture
     *
     * @static
     * @param {String|BaseTexture|HTMLCanvasElement|HTMLVideoElement} source - Source to create texture from
     * @return {Texture} The newly created texture
     */
	@:overload(function(source:String):Texture {})
	@:overload(function(source:BaseTexture):Texture {})
	@:overload(function(source:CanvasElement):Texture {})
	@:overload(function(source:VideoElement):Texture {})
	static function from(source:Dynamic):Texture;

	/**
     * Create a texture from a source and add to the cache.
     *
     * @static
     * @param {HTMLImageElement|HTMLCanvasElement} source - The input source.
     * @param {String} imageUrl - File name of texture, for cache and resolving resolution.
     * @param {String} [name] - Human readible name for the texture cache. If no name is
     *        specified, only `imageUrl` will be used as the cache ID.
     * @return {PIXI.Texture} Output texture
     */
	static function fromLoader(source:Dynamic, imageUrl:String, ?name:String):Texture;

	/**
	 * Adds a texture to the global utils.TextureCache. This cache is shared across the whole PIXI object.
	 *
	 * @static
	 * @param texture {Texture} The Texture to add to the cache.
	 * @param id {String} The id that the texture will be stored against.
	 */
	static function addToCache(texture:Texture, id:String):Void;
	static function addTextureToCache(texture:Texture, id:String):Void;

	/**
	 * Remove a texture from the global utils.TextureCache.
	 *
	 * @static
	 * @param id {String} The id of the texture to be removed
	 * @return {Texture} The texture that was removed
	 */
	static function removeFromCache(id:EitherType<String, Texture>):Texture;
	static function removeTextureFromCache(id:EitherType<String, Texture>):Texture;

	/**
	 * An empty texture, used often to not have to create multiple empty textures.
	 * @static
	 * @constant
	 * @member {Texture}
	 */
	static var EMPTY:Texture;

	/**
	 * A white texture of 10x10 size, used for graphics and other things
	 * Can not be destroyed.
	 *
	 * @static
	 * @constant
	 */
	static var WHITE:Texture;
}
