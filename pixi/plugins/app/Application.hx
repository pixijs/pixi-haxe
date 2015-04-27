package pixi.plugins.app;

import js.html.Element;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.SystemRenderer;
import pixi.plugins.stats.Stats;
import pixi.core.renderers.Detector;
import pixi.core.display.Container;
import js.html.Event;
import js.html.CanvasElement;
import js.Browser;

/**
 * Pixi Boilerplate Helper class that can be used by any application
 * @author Adi Reddy Mora
 * http://adireddy.github.io
 * @license MIT
 * @copyright 2015
 */
class Application {

	/**
     * Sets the pixel ratio of the application.
     * default - 1
     */
	public var pixelRatio(null, default):Float;

	/**
	 * Default frame rate is 60 FPS and this can be set to true to get 30 FPS.
	 * default - false
	 */
	public var skipFrame(null, default):Bool;

	/**
	 * Width of the application.
	 * default - Browser.window.innerWidth
	 */
	public var width(null, default):Float;

	/**
	 * Height of the application.
	 * default - Browser.window.innerHeight
	 */
	public var height(null, default):Float;

	/**
	 * Renderer transparency property.
	 * default - false
	 */
	public var transparent(null, default):Bool;

	/**
	 * Graphics antialias property.
	 * default - false
	 */
	public var antialias(null, default):Bool;

	/**
	 * Force FXAA shader antialias instead of native (faster)
	 * default - false
	 */
	public var forceFXAA(null, default):Bool;

	/**
	 * Whether you want to resize the canvas and renderer on browser resize.
	 * Should be set to false when custom width and height are used for the application.
	 * default - true
	 */
	public var autoResize(null, default):Bool;

	/**
	 * Sets the background color of the stage.
	 * default - 0xFFFFFF
	 */
	public var backgroundColor(null, default):Int;

	/**
	 * Update listener 	function
	 */
	public var onUpdate:Float -> Void;

	/**
	 * Window resize listener 	function
	 */
	public var onResize:Void -> Void;

	/**
	 * Global Container.
	 * Read-only
	 */
	var _stage(default, null):Container;

	public static inline var AUTO:String = "auto";
	public static inline var RECOMMENDED:String = "recommended";
	public static inline var CANVAS:String = "canvas";
	public static inline var WEBGL:String = "webgl";

	var _canvas:CanvasElement;
	var _renderer:SystemRenderer;
	var _stats:Stats;
	var _lastTime:Date;
	var _currentTime:Date;
	var _elapsedTime:Float;
	var _skipFrame:Bool;

	public function new() {
		_lastTime = Date.now();
		_setDefaultValues();
	}

	function _setDefaultValues() {
		pixelRatio = 1;
		skipFrame = false;
		autoResize = true;
		transparent = false;
		antialias = false;
		forceFXAA = false;
		backgroundColor = 0xFFFFFF;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		_skipFrame = false;
	}

	/**
	 * Starts pixi application setup using the properties set or default values
	 * @param [renderer] - Renderer type to use AUTO (default) | CANVAS | WEBGL
	 * @param [stats] - Enable/disable stats for the application.
	 * Note that stats.js is not part of pixi so don't forget to include it you html page
	 * Can be found in libs folder. "libs/stats.min.js" <script type="text/javascript" src="libs/stats.min.js"></script>
	 * @param [parentDom] - By default canvas will be appended to body or it can be appended to custom element if passed
	 */

	public function start(?renderer:String = AUTO, ?stats:Bool = true, ?parentDom:Element) {
		_canvas = Browser.document.createCanvasElement();
		_canvas.style.width = width + "px";
		_canvas.style.height = height + "px";
		_canvas.style.position = "absolute";
		if (parentDom == null) Browser.document.body.appendChild(_canvas);
		else parentDom.appendChild(_canvas);

		_stage = new Container();

		var renderingOptions:RenderingOptions = {};
		renderingOptions.view = _canvas;
		renderingOptions.backgroundColor = backgroundColor;
		renderingOptions.resolution = pixelRatio;
		renderingOptions.antialias = antialias;
		renderingOptions.forceFXAA = forceFXAA;
		renderingOptions.autoResize = autoResize;
		renderingOptions.transparent = transparent;

		if (renderer == AUTO) _renderer = Detector.autoDetectRenderer(width, height, renderingOptions);
		else if (renderer == CANVAS) _renderer = new CanvasRenderer(width, height, renderingOptions);
		else _renderer = new WebGLRenderer(width, height, renderingOptions);

		Browser.document.body.appendChild(_renderer.view);
		if (autoResize) Browser.window.onresize = _onWindowResize;
		Browser.window.requestAnimationFrame(cast _onRequestAnimationFrame);
		_lastTime = Date.now();

		if (stats) _addStats();
	}

	@:noCompletion function _onWindowResize(event:Event) {
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		_renderer.resize(width, height);
		_canvas.style.width = width + "px";
		_canvas.style.height = height + "px";

		if (_stats != null) {
			_stats.domElement.style.top = "2px";
			_stats.domElement.style.right = "2px";
		}

		if (onResize != null) onResize();
	}

	@:noCompletion function _onRequestAnimationFrame() {
		if (skipFrame && _skipFrame) _skipFrame = false;
		else {
			_skipFrame = true;
			_calculateElapsedTime();
			if (onUpdate != null) onUpdate(_elapsedTime);
			_renderer.render(_stage);
		}
		Browser.window.requestAnimationFrame(cast _onRequestAnimationFrame);
		if (_stats != null) _stats.update();
	}

	@:noCompletion function _calculateElapsedTime() {
		_currentTime = Date.now();
		_elapsedTime = _currentTime.getTime() - _lastTime.getTime();
		_lastTime = _currentTime;
	}

	@:noCompletion function _addStats() {
		if (untyped __js__("window").Stats != null) {
			var _container = Browser.document.createElement("div");
			Browser.document.body.appendChild(_container);
			_stats = new Stats();
			_stats.domElement.style.position = "absolute";
			_stats.domElement.style.top = "2px";
			_stats.domElement.style.right = "2px";
			_container.appendChild(_stats.domElement);
			_stats.begin();
		}
	}
}