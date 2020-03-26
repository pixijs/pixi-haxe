package pixi.core.textures;

import haxe.extern.EitherType;
import js.lib.Float32Array;
import js.lib.Uint8Array;
import pixi.core.Pixi.Formats;
import pixi.core.Pixi.MipmapModes;
import pixi.core.Pixi.ScaleModes;
import pixi.core.Pixi.Targets;
import pixi.core.Pixi.Types;
import pixi.interaction.EventEmitter;
import pixi.resources.Resource;

@:native("PIXI.BaseTexture")
extern class BaseTexture extends EventEmitter {
	/**
	 * A texture stores the information that represents an image. All textures have a base texture.
	 *
	 * @class
	 * @memberof PIXI
	 * @param source {Image|Canvas} the source object of the texture.
	 * @param [scaleMode=scaleModes.DEFAULT] {ScaleModes} See {@link SCALE_MODES} for possible values
	 * @param [resolution=1] {Float} The resolution / device pixel ratio of the texture
	 */
	function new(?resource:Dynamic, ?options:BaseTextureOptions);

	/**
	 * Global number of the texture batch, used by multi-texture renderers
	 */
	static var _globalBatch:Int;

	/**
	 * Number of the texture batch, used by multi-texture renderers
	 */
	var _batchEnabled:Int;

	/**
	 * Anisotropic filtering level of texture
	 */
	var anisotropicLevel:Int;

	/**
	 * Currently default cache ID.
	 */
	var cacheId:String;

	/**
	 * Flag if BaseTexture has been destroyed.
	 */
	var destroyed(default, null):Bool;

	/**
	 * Used by TextureSystem to only update texture to the GPU when needed. Please call update() to increment it.
	 */
	var dirtyId(default, null):Int;

	/**
	 * Used by TextureSystem to only update texture style when needed.
	 */
	private var dirtyStyleId:Int;

	/**
	 * The pixel format of the texture
	 */
	var format:Formats;

	/**
	 * The height of the base texture set when the image has loaded
	 *
	 * @member {Float}
	 * @readOnly
	 */
	var height:Float;

	/**
	 * Whether or not the texture is a power of two, try to use power of two textures as much as you can
	 */
	var isPowerOfTwo(default, null):Bool;

	/**
	 *
	 * Mipmap mode of the texture, affects downscaled images
	 *
	 * @member {MipmapModes}
	 */
	var mipmap:MipmapModes;

	/**
	 * Set to true to enable pre-multiplied alpha
	 */
	var premultiplyAlpha:Bool;

	/**
	 * Used to store the actual width of the source of this texture
	 *
	 * @readonly
	 * @member {Float}
	 */
	var realWidth:Float;

	/**
	 * Used to store the actual height of the source of this texture
	 *
	 * @readonly
	 * @member {Float}
	 */
	var realHeight:Float;

	/**
	 * The Resolution of the texture.
	 *
	 * @member {Float}
	 */
	var resolution:Float;

	/**
	 * The scale mode to apply when scaling this texture
	 *
	 * @member {ScaleModes}
	 * @default scaleModes.LINEAR
	 */
	var scaleMode:ScaleModes;

	/**
	 * The target type
	 * Default Value: PIXI.TARGETS.TEXTURE_2D
	 */
	var target:Targets;

	/**
	 * The collection of alternative cache ids, since some BaseTextures can have more than one ID, short name and longer full URL
	 */
	var textureCacheIds:Array<String>;

	/**
	 * Used by automatic texture Garbage Collection, stores last GC tick when it was bound
	 */
	private var touched:Float;

	/**
	 * The type of resource data
	 * Default Value: PIXI.TYPES.UNSIGNED_BYTE
	 */
	private var type:Types;

	/**
	 * Global unique identifier for this BaseTexture
	 */
	private var uid:String;

	/**
	 * The width of the base texture set when the image has loaded
	 *
	 * @member {Float}
	 * @readOnly
	 */
	var width(default, null):Float;

	/**
	 *
	 * WebGL Texture wrap mode
	 *
	 * @member {Int}
	 * @see PIXI.WRAP_MODES
	 */
	var wrapMode:Int;

	/**
	 * Adds a BaseTexture to the global BaseTextureCache. This cache is shared across the whole PIXI object.
	 * @param	baseTexture
	 * @param	id
	 */
	static function addToCache(baseTexture:BaseTexture, id:String):Void;

	/**
	 * Helper function that creates a base texture based on the source you provide. The source can be - image url, image element, canvas element. If the source is an image url or an image element and not in the base texture cache, it will be created and loaded.
	 * @param	source The source to create base texture from. Types: string | HTMLImageElement | HTMLCanvasElement | SVGElement | HTMLVideoElement
	 * @param	options See PIXI.BaseTexture's constructor for options.
	 * @param	strict Enforce strict-mode, see PIXI.settings.STRICT_TEXTURE_CACHE.
	 * @return The new base texture.
	 */
	static function from(source:Dynamic, ?options:BaseTextureOptions, ?strict:Bool):BaseTexture;

	/**
	 *
	 * @param	buffer The optional array to use, if no data is provided, a new Float32Array is created.
	 * @param	width Width of the resource
	 * @param	height Height of the resource
	 * @param	options See PIXI.BaseTexture's constructor for options.
	 * @return	The resulting new BaseTexture
	 */
	static function fromBuffer(buffer:EitherType<Float32Array, Uint8Array>, width:Float, height:Float, options:BaseTextureOptions):BaseTexture;

	/**
	 * Remove a BaseTexture from the global BaseTextureCache.
	 * @param	baseTexture id of a BaseTexture to be removed, or a BaseTexture instance itself.
	 * @return The BaseTexture that was removed.
	 */
	static function removeFromCache(baseTexture:EitherType<String, BaseTexture>):BaseTexture;

	/**
	 * Destroys this base texture. The method stops if resource doesn't want this texture to be destroyed. Removes texture from all caches.
	 */
	function destroy():Void;

	/**
	 * Frees the texture from WebGL memory without destroying this texture object. This means you can still use the texture later which will upload it to GPU memory again.
	 */
	function dispose():Void;

	/**
	 * Get the drawable source, such as HTMLCanvasElement or HTMLImageElement suitable for rendering with CanvasRenderer. Provided by @pixi/canvas-renderer package.
	 * @return Source to render with CanvasRenderer (returns PIXI.ICanvasImageSource)
	 */
	function getDrawableSource():Any;

	/**
	 * Sets real size of baseTexture, preserves current resolution.
	 * @param	realWidth Full rendered width
	 * @param	realHeight Full rendered height
	 * @param	resolution Optionally set resolution
	 * @return this
	 */
	function setRealSize(realWidth:Float, realHeight:Float, ?resolution:Float):BaseTexture;

	/**
	 * Changes resolution
	 * @param	resolution
	 * @return
	 */
	function setResolution(resolution:Float):BaseTexture;

	/**
	 * Sets the resource if it wasn't set. Throws error if resource already present
	 * @param	resource that is managing this BaseTexture
	 * @return this
	 */
	function setResource(resource:Resource):BaseTexture;

	/**
	 * Changes w/h/resolution. Texture becomes valid if width and height are greater than zero.
	 * @param	width Visual width
	 * @param	height Visual height
	 * @param	resolution Optionally set resolution
	 * @return this
	 */
	function setSize(width:Float, height:Float, ?resolution:Float):BaseTexture;

	/**
	 * Invalidates the object. Texture becomes valid if width and height are greater than zero.
	 */
	function update():Void;
}

typedef BaseTextureOptions = {
	?width:Int,
	?height:Int,
	?autoLoad:Bool,
	?scale:Float,
	?createBitmap:Bool,
	?crossorigin:Bool,
	?autoPlay:Bool,
	?updateFPS:Float,
}
