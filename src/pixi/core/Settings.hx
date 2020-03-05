package pixi.core;

import js.lib.RegExp;
import haxe.extern.EitherType;
import pixi.core.Pixi.ScaleModes;
import pixi.core.Pixi.TransformModes;
import pixi.core.Pixi.GCModes;
import pixi.core.Pixi.WrapModes;
import pixi.core.Pixi.Precision;
import pixi.core.Pixi;

@:native("PIXI.settings")
extern class Settings {
	/**
	 * Default anisotropic filtering level of textures. Usually from 0 to 16
	 */
	static var ANISOTROPIC_LEVEL:Int;

	/**
	 * Enables bitmap creation before image load. This feature is experimental. Default: False
	 */
	static var CREATE_IMAGE_BITMAP:Bool;

	/**
	 * Should the failIfMajorPerformanceCaveat flag be enabled as a context option used in the isWebGLSupported function.
	 * For most scenarios this should be left as true, as otherwise the user may have a poor experience. However, it can
	 * be useful to disable under certain scenarios, such as headless unit tests. Default: true
	 */
	static var FAIL_IF_MAJOR_PERFORMANCE_CAVEAT:Bool;

	/**
	 * Default filter resolution. Default: 1
	 */
	static var FILTER_RESOLUTION:Float;

	/**
	 * Default canvasPadding for canvas-based Mesh rendering. Default: 0
	 */
	static var MESH_CANVAS_PADDING:Float;

	/**
	 * If set to true WebGL will attempt make textures mimpaped by default. Mipmapping will only succeed if
	 * the base texture uploaded has power of two dimensions. Default: PIXI.MIPMAP_MODES.POW2
	 */
	static var MIPMAP_TEXTURES:MipmapModes;

	/**
	 * The maximum support for using WebGL. If a device does not support WebGL version, for instance WebGL 2,
	 * it will still attempt to fallback support to WebGL 1. If you want to explicitly remove feature support
	 * to target a more stable baseline, prefer a lower environment.
	 * Due to bug in chromium we disable webgl2 by default for all non-apple mobile devices.
	 * Default: PIXI.ENV.WEBGL2
	 */
	static var PREFER_ENV:Env;

	/**
	 * If true PixiJS will Math.floor() x/y values when rendering, stopping pixel interpolation. Advantages can
	 * include sharper image quality (like text) and faster rendering on canvas. The main disadvantage is movement
	 * of objects may appear less smooth. Default: false
	 */
	static var ROUND_PIXELS:Bool;

	/**
	 * Sets the default value for the container property 'sortableChildren'. If set to true, the container will sort
	 * its children by zIndex value when updateTransform() is called, or manually if sortChildren() is called.
	 * This actually changes the order of elements in the array, so should be treated as a basic solution that
	 * is not performant compared to other solutions, such as @link https://github.com/pixijs/pixi-display
	 * Also be aware of that this may not work nicely with the addChildAt() function, as the zIndex sorting may cause the child to automatically sorted to another position.
	 * Default: false
	 */
	static var SORTABLE_CHILDREN:Bool;

	/**
	 * If set to true, Textures and BaseTexture objects stored in the caches (TextureCache and BaseTextureCache) can
	 * only be used when calling Texture.from or BaseTexture.from. Otherwise, these from calls throw an exception.
	 * Using this property can be useful if you want to enforce preloading all assets with Loader. Default: false
	 */
	static var STRICT_TEXTURE_CACHE:Bool;

	/**
	 * Target frames per millisecond
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {Float}
	 * @default 0.06
	 */
	static var TARGET_FPMS:Float;

	/**
	 * Default resolution / device pixel ratio of the renderer.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {Float}
	 * @default 1
	 */
	static var RESOLUTION:Float;

	/**
	 * The maximum textures that this device supports.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {Int}
	 * @default 32
	 */
	static var SPRITE_MAX_TEXTURES:Int;

	/**
	 * Default number of uploads per frame using prepare plugin. Default: 4
	 */
	static var UPLOADS_PER_FRAME:Int;

	/**
	 * The default sprite batch size.
	 *
	 * The default aims to balance desktop and mobile devices.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {Int}
	 * @default 4096
	 */
	static var SPRITE_BATCH_SIZE:Int;

	/**
	 * The prefix that denotes a URL is for a retina asset.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {RegExp|String}
	 * @example `@2x`
	 * @default /@(.+)x/
	 */
	static var RETINA_PREFIX:EitherType<RegExp, String>;

	/**
	 * The default render options if none are supplied to {@link PIXI.Renderer}
	 * or {@link PIXI.CanvasRenderer}.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI.settings
	 * @type {RenderOptions}
	 */
	static var RENDER_OPTIONS:RenderOptions;

	/**
	 * Default Garbage Collection mode.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {PIXI.GC_MODES}
	 * @default PIXI.GC_MODES.AUTO
	 */
	static var GC_MODE:GCModes;

	/**
	 * Default Garbage Collection max idle.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {Float}
	 * @default 3600
	 */
	static var GC_MAX_IDLE:Float;

	/**
	 * Default Garbage Collection maximum check count.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {Float}
	 * @default 600
	 */
	static var GC_MAX_CHECK_COUNT:Float;

	/**
	 * Default wrap modes that are supported by pixi.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {PIXI.WRAP_MODES}
	 * @default PIXI.WRAP_MODES.CLAMP
	 */
	static var WRAP_MODE:WrapModes;

	/**
	 * The scale modes that are supported by pixi.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {PIXI.SCALE_MODES}
	 * @default PIXI.SCALE_MODES.LINEAR
	 */
	static var SCALE_MODE:ScaleModes;

	/**
	 * Default specify float precision in vertex shader.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {PIXI.PRECISION}
	 * @default PIXI.PRECISION.HIGH
	 */
	static var PRECISION_VERTEX:Precision;

	/**
	 * Default specify float precision in fragment shader.
	 *
	 * @static
	 * @memberof PIXI.settings
	 * @type {PIXI.PRECISION}
	 * @default PIXI.PRECISION.MEDIUM
	 */
	static var PRECISION_FRAGMENT:Precision;

	/**
	 * Can we upload the same buffer in a single frame?
	 *
	 * @static
	 * @constant
	 * @memberof PIXI.settings
	 * @type {Bool}
	 */
	static var CAN_UPLOAD_SAME_BUFFER:Bool;
}
