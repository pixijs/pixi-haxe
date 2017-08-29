package pixi.core;

import pixi.core.Pixi.ScaleModes;
import pixi.core.Pixi.TransformModes;
import pixi.core.Pixi.GCModes;
import pixi.core.Pixi.WrapModes;

@:native("PIXI.settings")
extern class Settings {

	/**
     * Target frames per millisecond.
     *
     * @static
     * @memberof PIXI.settings
     * @type {Float}
     * @default 0.06
     */
	static var TARGET_FPMS:Float;

	/**
     * If set to true WebGL will attempt make textures mimpaped by default.
     * Mipmapping will only succeed if the base texture uploaded has power of two dimensions.
     *
     * @static
     * @memberof PIXI.settings
     * @type {Bool}
     * @default true
     */
	static var MIPMAP_TEXTURES:Bool;

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
     * Default filter resolution.
     *
     * @static
     * @memberof PIXI.settings
     * @type {Float}
     * @default 1
     */
	static var FILTER_RESOLUTION:Float;

	/**
     * The maximum textures that this device supports.
     *
     * @static
     * @memberof PIXI.settings
     * @type {Int}
     * @default 32
     */
	static var SPRITE_MAX_TEXTURES:Int;

	// TODO: maybe change to SPRITE.BATCH_SIZE: 2000
	// TODO: maybe add PARTICLE.BATCH_SIZE: 15000

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
	static var RETINA_PREFIX:String;

	/**
     * The default render options if none are supplied to {@link PIXI.WebGLRenderer}
     * or {@link PIXI.CanvasRenderer}.
     *
     * @static
     * @constant
     * @memberof PIXI.settings
     * @type {RenderOptions}
     * @property {HTMLCanvasElement} view=null
     * @property {number} resolution=1
     * @property {boolean} antialias=false
     * @property {boolean} forceFXAA=false
     * @property {boolean} autoResize=false
     * @property {boolean} transparent=false
     * @property {number} backgroundColor=0x000000
     * @property {boolean} clearBeforeRender=true
     * @property {boolean} preserveDrawingBuffer=false
     * @property {boolean} roundPixels=false
     */
	static var RENDER_OPTIONS:RenderOptions;

	/**
     * Default transform type.
     *
     * @static
     * @memberof PIXI.settings
     * @type {PIXI.TRANSFORM_MODE}
     * @default PIXI.TRANSFORM_MODE.STATIC
     */
	static var TRANSFORM_MODE:TransformModes;

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
     * Default specify float precision in shaders.
     *
     * @static
     * @memberof PIXI.settings
     * @type {PIXI.PRECISION}
     * @default PIXI.PRECISION.MEDIUM
     */
	static var PRECISION:String;

	/**
     * Can we upload the same buffer in a single frame?
     *
     * @static
     * @constant
     * @memberof PIXI
     * @type {Bool}
     */
	static var CAN_UPLOAD_SAME_BUFFER:Bool;
}