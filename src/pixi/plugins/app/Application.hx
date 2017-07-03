package pixi.plugins.app;

import pixi.core.Pixi.RendererType;
import pixi.core.renderers.SystemRenderer;
import js.html.Event;
import pixi.core.RenderOptions;
import pixi.core.display.Container;
import js.html.Element;
import js.html.CanvasElement;
import js.Browser;

/**
 * Pixi Boilerplate Helper class that can be used by any application
 * @author Adi Reddy Mora
 * http://github.com/adireddy
 * @license MIT
 * @copyright 2015-2017
 */
class Application {

	/**
     * Sets the pixel ratio of the application.
     * default - 1
     */
	public var pixelRatio:Float;

	/**
	 * Width of the application.
	 * default - Browser.window.innerWidth
	 */
	public var width:Float;

	/**
	 * Height of the application.
	 * default - Browser.window.innerHeight
	 */
	public var height:Float;

	/**
	 * Position of canvas element
	 * default - static
	 */
	public var position:String;

	/**
	 * Renderer transparency property.
	 * default - false
	 */
	public var transparent:Bool;

	/**
	 * Graphics antialias property.
	 * default - false
	 */
	public var antialias:Bool;

	/**
	 * Force FXAA shader antialias instead of native (faster).
	 * default - false
	 */
	public var forceFXAA:Bool;

	/**
	 * Force round pixels.
	 * default - false
	 */
	public var roundPixels:Bool;

	/**
	 * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
     * If the scene is NOT transparent Pixi will use a canvas sized fillRect operation every frame to set the canvas background color.
     * If the scene is transparent Pixi will use clearRect to clear the canvas every frame.
     * Disable this by setting this to false. For example if your game has a canvas filling background image you often don't need this set.
	 * default - true
	 */
	public var clearBeforeRender:Bool;

	/**
	 * enables drawing buffer preservation, enable this if you need to call toDataUrl on the webgl context
	 * default - false
	 */
	public var preserveDrawingBuffer:Bool;

	/**
	 * Whether you want to resize the canvas and renderer on browser resize.
	 * Should be set to false when custom width and height are used for the application.
	 * default - true
	 */
	public var autoResize:Bool;

	/**
	 * Sets the background color of the stage.
	 * default - 0xFFFFFF
	 */
	public var backgroundColor:Int;

	/**
	 * Update listener 	function
	 */
	public var onUpdate:Float -> Void;

	/**
	 * Window resize listener 	function
	 */
	public var onResize:Void -> Void;

	/**
	 * Canvas Element
	 * Read-only
	 */
	public var canvas(default, null):CanvasElement;

	/**
	 * Renderer
	 * Read-only
	 */
	public var renderer(default, null):SystemRenderer;

	/**
	 * Global Container.
	 * Read-only
	 */
	public var stage(default, null):Container;

	/**
	 * Pixi Application
	 * Read-only
	 */
	public var app(default, null):pixi.core.Application;

	public static inline var AUTO:String = "auto";
	public static inline var RECOMMENDED:String = "recommended";
	public static inline var CANVAS:String = "canvas";
	public static inline var WEBGL:String = "webgl";

	public static inline var POSITION_STATIC:String = "static";
	public static inline var POSITION_ABSOLUTE:String = "absolute";
	public static inline var POSITION_FIXED:String = "fixed";
	public static inline var POSITION_RELATIVE:String = "relative";
	public static inline var POSITION_INITIAL:String = "initial";
	public static inline var POSITION_INHERIT:String = "inherit";

	var _frameCount:Int;
	var _animationFrameId:Null<Int>;

	public function new() {
		_setDefaultValues();
	}

	inline function _setDefaultValues() {
		_animationFrameId = null;
		pixelRatio = 1;
		autoResize = true;
		transparent = false;
		antialias = false;
		forceFXAA = false;
		roundPixels = false;
		clearBeforeRender = true;
		preserveDrawingBuffer = false;
		backgroundColor = 0xFFFFFF;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		position = "static";
	}

	/**
	 * Starts pixi application setup using the properties set or default values
	 * @param [rendererType] - Renderer type to use AUTO (default) | CANVAS | WEBGL
	 * @param [stats] - Enable/disable stats for the application.
	 * Note that stats.js is not part of pixi so don't forget to include it you html page
	 * Can be found in libs folder. "libs/stats.min.js" <script type="text/javascript" src="libs/stats.min.js"></script>
	 * @param [parentDom] - By default canvas will be appended to body or it can be appended to custom element if passed
	 */
	public function start(?rendererType:String = "auto", ?parentDom:Element, ?canvasElement:CanvasElement) {
		if (canvasElement == null) {
			canvas = Browser.document.createCanvasElement();
			canvas.style.width = width + "px";
			canvas.style.height = height + "px";
			canvas.style.position = position;
		}
		else canvas = canvasElement;

		if (autoResize) Browser.window.onresize = _onWindowResize;

		var renderingOptions:RenderOptions = {};
		renderingOptions.width = width;
		renderingOptions.height = height;
		renderingOptions.view = canvas;
		renderingOptions.backgroundColor = backgroundColor;
		renderingOptions.resolution = pixelRatio;
		renderingOptions.antialias = antialias;
		renderingOptions.forceFXAA = forceFXAA;
		renderingOptions.autoResize = autoResize;
		renderingOptions.transparent = transparent;
		renderingOptions.clearBeforeRender = clearBeforeRender;
		renderingOptions.preserveDrawingBuffer = preserveDrawingBuffer;
		renderingOptions.roundPixels = roundPixels;

		switch (rendererType) {
			case CANVAS:
				renderingOptions.noWebGL = true;
				app = new pixi.core.Application(renderingOptions);
			default: app = new pixi.core.Application(renderingOptions);
		}

		stage = app.stage;
		renderer = app.renderer;

		if (parentDom == null) Browser.document.body.appendChild(app.view);
		else parentDom.appendChild(app.view);

		app.ticker.add(_onRequestAnimationFrame);

		#if stats addStats(); #end
	}

	public function pauseRendering() {
		app.stop();
	}

	public function resumeRendering() {
		app.start();
	}

	@:noCompletion function _onWindowResize(event:Event) {
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		app.renderer.resize(width, height);
		canvas.style.width = width + "px";
		canvas.style.height = height + "px";

		if (onResize != null) onResize();
	}

	@:noCompletion function _onRequestAnimationFrame() {
		if (onUpdate != null) onUpdate(app.ticker.deltaTime);
	}

	public function addStats() {
		if (untyped __js__("window").Perf != null) {
			var renderer = switch (app.renderer.type)
			{
				case RendererType.UNKNOWN: "UNKNOWN";
				case RendererType.WEBGL: "WEBGL";
				case RendererType.CANVAS: "CANVAS";
			};
			
			new Perf().addInfo(renderer + " - " + pixelRatio);
		}
	}
}