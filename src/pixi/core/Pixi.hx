package pixi.core;

@:native("PIXI")
extern class Pixi {

	/**
	 * String of the current PIXI version
	 *
	 * @static
	 * @constant
	 * @property {String} VERSION
	 */
	static var VERSION:String;

	/**
     * @property {Float} PI_2 - Two Pi
     * @constant
     * @static
     */
	static var PI_2:Float;

	/**
     * @property {Float} RAD_TO_DEG - Constant conversion factor for converting radians to degrees
     * @constant
     * @static
     */
	static var RAD_TO_DEG:Float;

	/**
     * @property {Float} DEG_TO_RAD - Constant conversion factor for converting degrees to radians
     * @constant
     * @static
     */
	static var DEG_TO_RAD:Float;

	/**
     * Target frames per millisecond.
     *
     * @static
     * @constant
     * @property {Float} TARGET_FPMS=0.06
     */
	static var TARGET_FPMS:Float;

	/**
	 * Constant to identify the Renderer Type.
	 *
	 * @static
	 * @constant
	 * @property {RendererType} RENDERER_TYPE
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
	 * @property {BlendModes} BLEND_MODES
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
     * @property {DrawModes} DRAW_MODES
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
	 * The DEFAULT scale mode affects the default scaling mode of future operations.
	 * It can be re-assigned to either LINEAR or NEAREST, depending upon suitability.
	 *
	 * @static
	 * @constant
	 * @property {ScaleModes} SCALE_MODES
	 * @property {Int} SCALE_MODES.DEFAULT=LINEAR
	 * @property {Int} SCALE_MODES.LINEAR Smooth scaling
	 * @property {Int} SCALE_MODES.NEAREST Pixelating scaling
	 */
	static var SCALE_MODES:ScaleModes;

	/**
     * The wrap modes that are supported by pixi.
     *
     * The DEFAULT wrap mode affects the default wraping mode of future operations.
     * It can be re-assigned to either CLAMP or REPEAT, depending upon suitability.
     * If the texture is non power of two then clamp will be used regardless as webGL can only use REPEAT if the texture is po2
     * This property only affects WebGL
     * @static
     * @constant
     * @property {WrapModes} WRAP_MODES
     * @property {Int} WRAP_MODES.DEFAULT=CLAMP
     * @property {Int} WRAP_MODES.CLAMP The textures uvs are clamped
     * @property {Int} WRAP_MODES.REPEAT The texture uvs tile and repeat
     * @property {Int} WRAP_MODES.MIRRORED_REPEAT The texture uvs tile and repeat with mirroring
     */
	static var WRAP_MODES:WrapModes;

	/**
     * The gc modes that are supported by pixi.
     *
     * The DEFAULT Garbage Collection mode for pixi textures is MANUAL
     * If set to DEFAULT, the renderer will occasianally check textures usage. If they are not used for a specified period of time they will be removed from the GPU.
     * They will of corse be uploaded again when they are required. This is a silent behind the scenes process that should ensure that the GPU does not  get filled up.
     * Handy for mobile devices!
     * This property only affects WebGL
     * @static
     * @constant
     * @property {GCModes} GC_MODES
     * @property {Int} GC_MODES.DEFAULT=DEFAULT
     * @property {Int} GC_MODES.AUTO Garbage collection will happen periodically automatically
     * @property {Int} GC_MODES.MANUAL Garbage collection will need to be called manually
     */
	static var GC_MODES:GCModes;

	/**
     * If set to true WebGL will attempt make textures mimpaped by default
     * Mipmapping will only succeed if the base texture uploaded has power of two dimensions
     * @static
     * @constant
     * @property {Bool} MIPMAP_TEXTURES
     */
	static var MIPMAP_TEXTURES:Bool;

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
	 * @property {DefaultRenderOptions} DEFAULT_RENDER_OPTIONS
	 * @property {HTMLCanvasElement} DEFAULT_RENDER_OPTIONS.view=null
	 * @property {Bool} DEFAULT_RENDER_OPTIONS.transparent=false
	 * @property {Bool} DEFAULT_RENDER_OPTIONS.antialias=false
	 * @property {Bool} DEFAULT_RENDER_OPTIONS.forceFXAA=false
	 * @property {Bool} DEFAULT_RENDER_OPTIONS.preserveDrawingBuffer=false
	 * @property {Float} DEFAULT_RENDER_OPTIONS.resolution=1
	 * @property {Int} DEFAULT_RENDER_OPTIONS.backgroundColor=0x000000
	 * @property {Bool} DEFAULT_RENDER_OPTIONS.clearBeforeRender=true
	 * @property {Bool} DEFAULT_RENDER_OPTIONS.autoResize=false
	 */
	static var DEFAULT_RENDER_OPTIONS:DefaultRenderOptions;

	/**
	 * Constants that identify shapes, mainly to prevent `instanceof` calls.
	 *
	 * @static
	 * @constant
	 * @property {Shapes} SHAPES
	 * @property {Int} SHAPES.POLY=0
	 * @property {Int} SHAPES.RECT=1
	 * @property {Int} SHAPES.CIRC=2
	 * @property {Int} SHAPES.ELIP=3
	 * @property {Int} SHAPES.RREC=4
	 */
	static var SHAPES:Shapes;

	/**
     * Constants that specify float precision in shaders.
     *
     * @static
     * @constant
     * @property {object} PRECISION
     * @property {String} PRECISION.DEFAULT='mediump'
     * @property {String} PRECISION.LOW='lowp'
     * @property {String} PRECISION.MEDIUM='mediump'
     * @property {String} PRECISION.HIGH='highp'
     */
	static var TRANSFORM_MODE:TransformModes;

	static var PRECISION:Precisions;

	/**
     * Constants that define the type of gradient on text.
     *
     * @static
     * @constant
     * @property {object} TEXT_GRADIENT
     * @property {Int} TEXT_GRADIENT.LINEAR_VERTICAL=0
     * @property {Int} TEXT_GRADIENT.LINEAR_HORIZONTAL=1
     */
	static var TEXT_GRADIENT:TextGradients;

	//4096 - nice balance between mobile and desktop machines
	static var SPRITE_BATCH_SIZE:Int;

	static var SPRITE_MAX_TEXTURES:Int;

	static var TEXT_STYLE_CHANGED:String;
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

typedef WrapModes = {
	var DEFAULT:Int;
	var CLAMP:Int;
	var REPEAT:Int;
	var MIRRORED_REPEAT:Int;
}

typedef GCModes = {
	var DEFAULT:Int;
	var AUTO:Int;
	var MANUAL:Int;
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

typedef DrawModes = {
	var POINTS:Int;
	var LINES:Int;
	var LINE_LOOP:Int;
	var LINE_STRIP:Int;
	var TRIANGLES:Int;
	var TRIANGLE_STRIP:Int;
	var TRIANGLE_FAN:Int;
}

typedef Shapes = {
	var POLY:Int;
	var RECT:Int;
	var CIRC:Int;
	var ELIP:Int;
	var RREC:Int;
}

typedef Precisions = {
	var DEFAULT:String;
	var LOW:String;
	var MEDIUM:String;
	var HIGH:String;
}

typedef TextGradients = {
	var LINEAR_VERTICAL:Int;
	var LINEAR_HORIZONTAL:Int;
}

typedef TransformModes = {
	var STATIC:Int;
	var DYNAMIC:Int;
	var DEFAULT:Int;
}