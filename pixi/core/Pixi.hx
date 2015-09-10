package pixi.core;

@:native("PIXI")
extern class Pixi {

	/**
	 * String of the current PIXI version
	 *
	 * @static
	 * @constant
	 * @property {string} VERSION
	 */
	static var VERSION:String;

	/**
     * @property {number} PI_2 - Two Pi
     * @constant
     * @static
     */
	static var PI_2:Float;

	/**
     * @property {number} RAD_TO_DEG - Constant conversion factor for converting radians to degrees
     * @constant
     * @static
     */
	static var RAD_TO_DEG:Float;

	/**
     * @property {Number} DEG_TO_RAD - Constant conversion factor for converting degrees to radians
     * @constant
     * @static
     */
	static var DEG_TO_RAD:Float;

	/**
     * Target frames per millisecond.
     *
     * @static
     * @constant
     * @property {number} TARGET_FPMS=0.06
     */
	static var TARGET_FPMS:Float;

	/**
	 * Constant to identify the Renderer Type.
	 *
	 * @static
	 * @constant
	 * @property {object} RENDERER_TYPE
	 * @property {number} RENDERER_TYPE.UNKNOWN
	 * @property {number} RENDERER_TYPE.WEBGL
	 * @property {number} RENDERER_TYPE.CANVAS
	 */
	static var RENDERER_TYPE:RendererType;

	/**
	 * various blend modes supported by PIXI. IMPORTANT - The WebGL renderer only supports
	 * the NORMAL, ADD, MULTIPLY and SCREEN blend modes. Anything else will silently act like
	 * NORMAL.
	 *
	 * @static
	 * @constant
	 * @property {object} BLEND_MODES
	 * @property {number} BLEND_MODES.NORMAL
	 * @property {number} BLEND_MODES.ADD
	 * @property {number} BLEND_MODES.MULTIPLY
	 * @property {number} BLEND_MODES.SCREEN
	 * @property {number} BLEND_MODES.OVERLAY
	 * @property {number} BLEND_MODES.DARKEN
	 * @property {number} BLEND_MODES.LIGHTEN
	 * @property {number} BLEND_MODES.COLOR_DODGE
	 * @property {number} BLEND_MODES.COLOR_BURN
	 * @property {number} BLEND_MODES.HARD_LIGHT
	 * @property {number} BLEND_MODES.SOFT_LIGHT
	 * @property {number} BLEND_MODES.DIFFERENCE
	 * @property {number} BLEND_MODES.EXCLUSION
	 * @property {number} BLEND_MODES.HUE
	 * @property {number} BLEND_MODES.SATURATION
	 * @property {number} BLEND_MODES.COLOR
	 * @property {number} BLEND_MODES.LUMINOSITY
	 */
	static var BLEND_MODES:BlendModes;

	/**
	 * The scale modes that are supported by pixi.
	 *
	 * The DEFAULT scale mode affects the default scaling mode of future operations.
	 * It can be re-assigned to either LINEAR or NEAREST, depending upon suitability.
	 *
	 * @static
	 * @constant
	 * @property {object} SCALE_MODES
	 * @property {number} SCALE_MODES.DEFAULT=LINEAR
	 * @property {number} SCALE_MODES.LINEAR Smooth scaling
	 * @property {number} SCALE_MODES.NEAREST Pixelating scaling
	 */
	static var SCALE_MODES:ScaleModes;

	/**
	 * The prefix that denotes a URL is for a retina asset
	 *
	 * @static
	 * @constant
	 * @property {String} RETINA_PREFIX
	 */
	//example: '@2x', /@(.+)x/
	static var RETINA_PREFIX:String;

	static var RESOLUTION:Float;

	static var FILTER_RESOLUTION:Float;

	/**
	 * The default render options if none are supplied to {@link PIXI.WebGLRenderer}
	 * or {@link PIXI.CanvasRenderer}.
	 *
	 * @static
	 * @constant
	 * @property {object} DEFAULT_RENDER_OPTIONS
	 * @property {HTMLCanvasElement} DEFAULT_RENDER_OPTIONS.view=null
	 * @property {boolean} DEFAULT_RENDER_OPTIONS.transparent=false
	 * @property {boolean} DEFAULT_RENDER_OPTIONS.antialias=false
	 * @property {boolean} DEFAULT_RENDER_OPTIONS.forceFXAA=false
	 * @property {boolean} DEFAULT_RENDER_OPTIONS.preserveDrawingBuffer=false
	 * @property {number} DEFAULT_RENDER_OPTIONS.resolution=1
	 * @property {number} DEFAULT_RENDER_OPTIONS.backgroundColor=0x000000
	 * @property {boolean} DEFAULT_RENDER_OPTIONS.clearBeforeRender=true
	 * @property {boolean} DEFAULT_RENDER_OPTIONS.autoResize=false
	 */
	static var DEFAULT_RENDER_OPTIONS:DefaultRenderOptions;

	/**
	 * Constants that identify shapes, mainly to prevent `instanceof` calls.
	 *
	 * @static
	 * @constant
	 * @property {object} SHAPES
	 * @property {object} SHAPES.POLY=0
	 * @property {object} SHAPES.RECT=1
	 * @property {object} SHAPES.CIRC=2
	 * @property {object} SHAPES.ELIP=3
	 * @property {object} SHAPES.RREC=4
	 */
	static var SHAPES:Shapes;

	static var SPRITE_BATCH_SIZE:Int;
	//2000 - nice balance between mobile and desktop machines
}

typedef RendererType = {
	var UNKNOWN:Int;
	var WEBGL:Int;
	var CANVAS:Int;
}

typedef DefaultRenderOptions = {
	@:optional var view:Dynamic;
	@:optional var resolution:Float;
	@:optional var antialias:Bool;
	@:optional var forceFXAA:Bool;
	@:optional var autoResize:Bool;
	@:optional var transparent:Bool;
	@:optional var backgroundColor:Int;
	@:optional var clearBeforeRender:Bool;
	@:optional var preserveDrawingBuffer:Bool;
}

typedef ScaleModes = {
	var DEFAULT:Int;
	var LINEAR:Int;
	var NEAREST:Int;
}

typedef BlendModes = {
	var NORMAL:Int;
	var ADD:Int;
	var MULTIPLY:Int;
	var SCREEN:Int;
	var OVERLAY:Int;
	var DARKEN:Int;
	var LIGHTEN:Int;
	var COLOR_DODGE:Int;
	var COLOR_BURN:Int;
	var HARD_LIGHT:Int;
	var SOFT_LIGHT:Int;
	var DIFFERENCE:Int;
	var EXCLUSION:Int;
	var HUE:Int;
	var SATURATION:Int;
	var COLOR:Int;
	var LUMINOSITY:Int;
}

typedef Shapes = {
	var POLY:Int;
	var RECT:Int;
	var CIRC:Int;
	var ELIP:Int;
	var RREC:Int;
}