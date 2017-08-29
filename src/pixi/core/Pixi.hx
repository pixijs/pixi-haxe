package pixi.core;

import haxe.extern.EitherType;
import js.RegExp;

@:native("PIXI")
extern class Pixi {

	/**
	 * String of the current PIXI version.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @name VERSION
	 * @type {String}
	 */
	static var VERSION:String;

	/**
	 * Two Pi.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @type {Float}
	 */
	static var PI_2:Float;

	/**
	 * Conversion factor for converting radians to degrees.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @type {Float}
	 */
	static var RAD_TO_DEG:Float;

	/**
	 * Conversion factor for converting degrees to radians.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @type {Float}
	 */
	static var DEG_TO_RAD:Float;

	/**
	 * Constant to identify the Renderer Type.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @name RENDERER_TYPE
	 * @type {RendererType}
	 * @property {Int} RENDERER_TYPE.UNKNOWN
	 * @property {Int} RENDERER_TYPE.WEBGL
	 * @property {Int} RENDERER_TYPE.CANVAS
	 */
	static var RENDERER_TYPE:RendererType;

	/**
	 * various blend modes supported by PIXI. IMPORTANT - The WebGL renderer only supports
	 * the NORMAL, ADD, MULTIPLY and SCREEN blend modes. Anything else will silently act like
	 * NORMAL.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @name BLEND_MODES
	 * @type {BlendModes}
	 * @property {Int} BLEND_MODES.NORMAL
	 * @property {Int} BLEND_MODES.ADD
	 * @property {Int} BLEND_MODES.MULTIPLY
	 * @property {Int} BLEND_MODES.SCREEN
	 * @property {Int} BLEND_MODES.OVERLAY
	 * @property {Int} BLEND_MODES.DARKEN
	 * @property {Int} BLEND_MODES.LIGHTEN
	 * @property {Int} BLEND_MODES.COLOR_DODGE
	 * @property {Int} BLEND_MODES.COLOR_BURN
	 * @property {Int} BLEND_MODES.HARD_LIGHT
	 * @property {Int} BLEND_MODES.SOFT_LIGHT
	 * @property {Int} BLEND_MODES.DIFFERENCE
	 * @property {Int} BLEND_MODES.EXCLUSION
	 * @property {Int} BLEND_MODES.HUE
	 * @property {Int} BLEND_MODES.SATURATION
	 * @property {Int} BLEND_MODES.COLOR
	 * @property {Int} BLEND_MODES.LUMINOSITY
	 */
	static var BLEND_MODES:BlendModes;

	/**
     * Various webgl draw modes. These can be used to specify which GL drawMode to use
     * under certain situations and renderers.
     *
     * @static
     * @constant
     * @memberof PIXI
     * @name DRAW_MODES
     * @type {DrawModes}
     * @property {Int} DRAW_MODES.POINTS
     * @property {Int} DRAW_MODES.LINES
     * @property {Int} DRAW_MODES.LINE_LOOP
     * @property {Int} DRAW_MODES.LINE_STRIP
     * @property {Int} DRAW_MODES.TRIANGLES
     * @property {Int} DRAW_MODES.TRIANGLE_STRIP
     * @property {Int} DRAW_MODES.TRIANGLE_FAN
     */
	static var DRAW_MODES:DrawModes;

	/**
	 * The scale modes that are supported by pixi.
	 *
	 * The {@link PIXI.settings.SCALE_MODE} scale mode affects the default scaling mode of future operations.
	 * It can be re-assigned to either LINEAR or NEAREST, depending upon suitability.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @name SCALE_MODES
	 * @type {ScaleModes}
	 * @property {Int} LINEAR Smooth scaling
	 * @property {Int} NEAREST Pixelating scaling
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
	 *
	 * @static
	 * @constant
	 * @name WRAP_MODES
	 * @memberof PIXI
	 * @type {WrapModes}
	 * @property {Int} CLAMP - The textures uvs are clamped
	 * @property {Int} REPEAT - The texture uvs tile and repeat
	 * @property {Int} MIRRORED_REPEAT - The texture uvs tile and repeat with mirroring
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
	 *
	 * @static
	 * @constant
	 * @name GC_MODES
	 * @memberof PIXI
	 * @type {GCModes}
	 * @property {Int} AUTO - Garbage collection will happen periodically automatically
	 * @property {Int} MANUAL - Garbage collection will need to be called manually
	 */
	static var GC_MODES:GCModes;

	/**
	 * Regexp for image type by extension.
	 *
	 * @static
	 * @constant
	 * @memberof PIXI
	 * @type {RegExp|String}
	 * @example `image.png`
	 */
	static var URL_FILE_EXTENSION:EitherType<String, RegExp>;

	/**
	 * Regexp for data URI.
	 * Based on: {@link https://github.com/ragingwind/data-uri-regex}
	 *
	 * @static
	 * @constant
	 * @name DATA_URI
	 * @memberof PIXI
	 * @type {RegExp|String}
	 * @example data:image/png;base64
	 */
	static var DATA_URI:EitherType<String, RegExp>;

	/**
	 * Regexp for SVG size.
	 *
	 * @static
	 * @constant
	 * @name SVG_SIZE
	 * @memberof PIXI
	 * @type {RegExp|String}
	 * @example &lt;svg width="100" height="100"&gt;&lt;/svg&gt;
	 */
	static var SVG_SIZE:EitherType<String, RegExp>;

	/**
	 * Constants that identify shapes, mainly to prevent `instanceof` calls.
	 *
	 * @static
	 * @constant
	 * @name SHAPES
	 * @memberof PIXI
	 * @type {Shapes}
	 * @property {Int} POLY Polygon
	 * @property {Int} RECT Rectangle
	 * @property {Int} CIRC Circle
	 * @property {Int} ELIP Ellipse
	 * @property {Int} RREC Rounded Rectangle
	 */
	static var SHAPES:Shapes;

	/**
	 * Constants that specify float precision in shaders.
	 *
	 * @static
	 * @constant
	 * @name PRECISION
	 * @memberof PIXI
	 * @type {Precisions}
	 * @property {String} LOW='lowp'
	 * @property {String} MEDIUM='mediump'
	 * @property {String} HIGH='highp'
	 */
	static var PRECISION:Precisions;

	/**
	 * Constants that specify the transform type.
	 *
	 * @static
	 * @constant
	 * @name TRANSFORM_MODE
	 * @memberof PIXI
	 * @type {TransformModes}
	 * @property {Int} STATIC
	 * @property {Int} DYNAMIC
	 */
	static var TRANSFORM_MODE:TransformModes;

	/**
	 * Constants that define the type of gradient on text.
	 *
	 * @static
	 * @constant
	 * @name TEXT_GRADIENT
	 * @memberof PIXI
	 * @type {TextGradients}
	 * @property {Int} LINEAR_VERTICAL Vertical gradient
	 * @property {Int} LINEAR_HORIZONTAL Linear gradient
	 */
	static var TEXT_GRADIENT:TextGradients;

	/**
	 * Represents the update priorities used by internal PIXI classes when registered with
	 * the {@link PIXI.ticker.Ticker} object. Higher priority items are updated first and lower
	 * priority items, such as render, should go later.
	 *
	 * @static
	 * @constant
	 * @name UPDATE_PRIORITY
	 * @memberof PIXI
	 * @type {UpdatePriotities}
	 * @property {Float} INTERACTION=50 Highest priority, used for {@link PIXI.interaction.InteractionManager}
	 * @property {Float} HIGH=25 High priority updating, {@link PIXI.VideoBaseTexture} and {@link PIXI.extras.AnimatedSprite}
	 * @property {Float} NORMAL=0 Default priority for ticker events, see {@link PIXI.ticker.Ticker#add}.
	 * @property {Float} LOW=-25 Low priority used for {@link PIXI.Application} rendering.
	 * @property {Float} UTILITY=-50 Lowest priority used for {@link PIXI.prepare.BasePrepare} utility.
	 */
	static var UPDATE_PRIORITY:UpdatePriotities;
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

@:native("PIXI.PRECISIONS")
extern enum Precisions {
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