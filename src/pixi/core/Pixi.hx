package pixi.core;

import haxe.extern.EitherType;
import js.lib.RegExp;

@:native("PIXI")
extern class Pixi {
	/**
	 * String of the current PIXI version.
	 */
	static var VERSION:String;

	/**
	 * Two Pi.
	 */
	static var PI_2:Float;

	/**
	 * Conversion factor for converting radians to degrees.
	 */
	static var RAD_TO_DEG:Float;

	/**
	 * Conversion factor for converting degrees to radians.
	 */
	static var DEG_TO_RAD:Float;

	/**
	 * How to treat textures with premultiplied alpha
	 */
	static var ALPHA_MODES:AlphaModes;

	/**
	 * Constant to identify the Renderer Type.
	 */
	static var RENDERER_TYPE:RendererType;

	/**
	 * various blend modes supported by PIXI. IMPORTANT - The WebGL renderer only supports
	 * the NORMAL, ADD, MULTIPLY and SCREEN blend modes. Anything else will silently act like
	 * NORMAL.
	 */
	static var BLEND_MODES:BlendModes;

	/**
	 * Bitwise OR of masks that indicate the buffers to be cleared.
	 */
	static var BUFFER_BITS:BufferBits;

	/**
	 * How to clear renderTextures in filter
	 */
	static var CLEAR_MODES:ClearModes;

	/**
	 * Various webgl draw modes. These can be used to specify which GL drawMode to use
	 * under certain situations and renderers.
	 *
	 * @property {Int} DRAW_MODES.TRIANGLE_FAN
	 */
	static var DRAW_MODES:DrawModes;

	/**
	 * The scale modes that are supported by pixi.
	 *
	 * The {@link PIXI.settings.SCALE_MODE} scale mode affects the default scaling mode of future operations.
	 * It can be re-assigned to either LINEAR or NEAREST, depending upon suitability.
	 *
	 */
	static var SCALE_MODES:ScaleModes;

	/**
	 * The wrap modes that are supported by pixi.
	 *
	 * The {@link PIXI.settings.WRAP_MODE} wrap mode affects the default wraping mode of future operations.
	 * It can be re-assigned to either CLAMP or REPEAT, depending upon suitability.
	 * If the texture is non power of two then clamp will be used regardless as webGL can
	 * only use REPEAT if the texture is po2.
	 *
	 * This property only affects WebGL.
	 */
	static var WRAP_MODES:WrapModes;

	/**
	 * The gc modes that are supported by pixi.
	 *
	 * The {@link PIXI.settings.GC_MODE} Garbage Collection mode for pixi textures is AUTO
	 * If set to GC_MODE, the renderer will occasionally check textures usage. If they are not
	 * used for a specified period of time they will be removed from the GPU. They will of course
	 * be uploaded again when they are required. This is a silent behind the scenes process that
	 * should ensure that the GPU does not  get filled up.
	 *
	 * Handy for mobile devices!
	 * This property only affects WebGL.
	 */
	static var GC_MODES:GCModes;

	/**
	 * Graphics curves resolution settings. If adaptive flag is set to true, the resolution is
	 * calculated based on the curve's length to ensure better visual quality.
	 * Adaptive draw works with bezierCurveTo and quadraticCurveTo.
	 */
	static var GRAPHICS_CURVES:GraphicCurves;

	/**
	 * Graphics curves resolution settings. If adaptive flag is set to true, the resolution is
	 * calculated based on the curve's length to ensure better visual quality.
	 * Adaptive draw works with bezierCurveTo and quadraticCurveTo.
	 */
	static var MASK_TYPES:MaskTypes;

	/**
	 * Mipmap filtering modes that are supported by pixi.
	 * The PIXI.settings.MIPMAP_TEXTURES affects default texture filtering. Mipmaps are generated
	 * for a baseTexture if its mipmap field is ON, or its POW2 and texture dimensions are
	 * powers of 2. Due to platform restriction, ON option will work like POW2 for webgl-1.
	 * This property only affects WebGL.
	 */
	static var MIPMAP_MODES:MipmapModes;

	/**
	 * Constants for multi-sampling antialiasing.
	 */
	static var MSAA_QUALITY:MSAAQuality;

	/**
	 * Regexp for image type by extension.
	 */
	static var URL_FILE_EXTENSION:EitherType<String, RegExp>;

	/**
	 * Regexp for data URI.
	 * Based on: {@link https://github.com/ragingwind/data-uri-regex}
	 */
	static var DATA_URI:EitherType<String, RegExp>;

	/**
	 * Default filter vertex shader
	 */
	static var defaultFilterVertex:String;

	/**
	 * Default vertex shader
	 */
	static var defaultVertex:String;

	/**
	 * Regexp for SVG size.
	 */
	static var SVG_SIZE:EitherType<String, RegExp>;

	/**
	 * Constants that identify shapes, mainly to prevent `instanceof` calls.
	 */
	static var SHAPES:Shapes;

	/**
	 * Constants that specify float precision in shaders.
	 */
	static var PRECISION:Precision;

	/**
	 * Constants that specify the transform type.
	 */
	static var TRANSFORM_MODE:TransformModes;

	/**
	 * Constants that define the type of gradient on text.
	 */
	static var TEXT_GRADIENT:TextGradients;

	/**
	 * Represents the update priorities used by internal PIXI classes when registered with
	 * the {@link PIXI.ticker.Ticker} object. Higher priority items are updated first and lower
	 * priority items, such as render, should go later.
	 */
	static var UPDATE_PRIORITY:UpdatePriotities;
}

@:native("PIXI.ALPHA_MODES")
extern enum AlphaModes {
	NO_PREMULTIPLIED_ALPHA;
	PREMULTIPLY_ON_UPLOAD;
	PREMULTIPLIED_ALPHA;
	NPM;
	UNPACK;
	PMA;
}

@:native("PIXI.BUFFER_BITS")
extern enum BufferBits {
	COLOR;
	DEPTH;
	STENCIL;
}

@:native("PIXI.CLEAR_MODES")
extern enum ClearModes {
	BLEND;
	CLEAR;
	BLIT;
	NO;
	YES;
	AUTO;
}

@:native("PIXI.RENDERER_TYPE")
extern enum RendererType {
	UNKNOWN;
	WEBGL;
	CANVAS;
}

@:native("PIXI.SCALE_MODES")
extern enum ScaleModes {
	DEFAULT;
	LINEAR;
	NEAREST;
}

@:native("PIXI.WRAP_MODES")
extern enum WrapModes {
	DEFAULT;
	CLAMP;
	REPEAT;
	MIRRORED_REPEAT;
}

@:native("PIXI.GC_MODES")
extern enum GCModes {
	DEFAULT;
	AUTO;
	MANUAL;
}

@:native("PIXI.GRAPHICS_CURVES")
typedef GraphicCurves = {
	adaptive:Bool,
	maxLength:Int,
	minSegments:Int,
	maxSegments:Int,
}

@:native("PIXI.MASK_TYPES")
extern enum MaskTypes {
	NONE;
	SCISSOR;
	STENCIL;
	SPRITE;
}

@:native("PIXI.ENV")
extern enum Env {
	WEBGL_LEGACY;
	WEBGL;
	WEBGL2;
}

@:native("PIXI.BLEND_MODES")
extern enum BlendModes {
	NORMAL;
	ADD;
	MULTIPLY;
	SCREEN;
	OVERLAY;
	DARKEN;
	LIGHTEN;
	COLOR_DODGE;
	COLOR_BURN;
	HARD_LIGHT;
	SOFT_LIGHT;
	DIFFERENCE;
	EXCLUSION;
	HUE;
	SATURATION;
	COLOR;
	LUMINOSITY;
}

@:native("PIXI.DRAW_MODES")
extern enum DrawModes {
	POINTS;
	LINES;
	LINE_LOOP;
	LINE_STRIP;
	TRIANGLES;
	TRIANGLE_STRIP;
	TRIANGLE_FAN;
}

@:native("PIXI.SHAPES")
extern enum Shapes {
	POLY;
	RECT;
	CIRC;
	ELIP;
	RREC;
}

@:native("PIXI.PRECISION")
extern enum Precision {
	LOW;
	MEDIUM;
	HIGH;
}

@:native("PIXI.TEXT_GRADIENT")
extern enum TextGradients {
	LINEAR_VERTICAL;
	LINEAR_HORIZONTAL;
}

@:native("PIXI.TRANSFORM_MODE")
extern enum TransformModes {
	STATIC;
	DYNAMIC;
}

@:native("PIXI.UPDATE_PRIORITY")
extern enum UpdatePriotities {
	INTERACTION;
	HIGH;
	NORMAL;
	LOW;
	UTILITY;
}

@:native("PIXI.MIPMAP_MODES")
extern enum MipmapModes {
	OFF;
	POW2;
	ON;
}

@:native("PIXI.MSAA_QUALITY")
extern enum MSAAQuality {
	NONE;
	LOW;
	MEDIUM;
	HIGH;
}

@:native("PIXI.TYPES")
extern enum Types {
	UNSIGNED_BYTE;
	UNSIGNED_SHORT;
	UNSIGNED_SHORT_5_6_5;
	UNSIGNED_SHORT_4_4_4_4;
	UNSIGNED_SHORT_5_5_5_1;
	FLOAT;
	HALF_FLOAT;
}

@:native("PIXI.FORMATS")
extern enum Formats {
	RGBA;
	RGB;
	ALPHA;
	LUMINANCE;
	LUMINANCE_ALPHA;
	DEPTH_COMPONENT;
	DEPTH_STENCIL;
}

@:native("PIXI.TARGETS")
extern enum Targets {
	TEXTURE_2D;
	TEXTURE_CUBE_MAP;
	TEXTURE_2D_ARRAY;
	TEXTURE_CUBE_MAP_POSITIVE_X;
	TEXTURE_CUBE_MAP_NEGATIVE_X;
	TEXTURE_CUBE_MAP_POSITIVE_Y;
	TEXTURE_CUBE_MAP_NEGATIVE_Y;
	TEXTURE_CUBE_MAP_POSITIVE_Z;
	TEXTURE_CUBE_MAP_NEGATIVE_Z;
}

@:native("PIXI.ISize")
typedef ISize = {
	width:Float,
	height:Float
}
