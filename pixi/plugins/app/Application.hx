package pixi.plugins.app;

import js.html.DivElement;
import js.html.Element;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.Detector;
import pixi.core.display.Container;
import js.html.Event;
import js.html.CanvasElement;
import js.Browser;

#if fps import jsfps.simplefps.Fps; #end
#if fpsmeter import jsfps.fpsmeter.FPSMeter; #end
#if stats import jsfps.stats.Stats; #end

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
	public var pixelRatio:Float;

	/**
	 * Default frame rate is 60 FPS and this can be set to true to get 30 FPS.
	 * default - false
	 */
	public var skipFrame(default, set):Bool;

	/**
	 * Default frame rate is 60 FPS and this can be set to anything between 1 - 60.
	 * default - 60
	 */
	public var fps(default, set):Int;

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
	public var renderer(default, null):Dynamic;

	/**
	 * Global Container.
	 * Read-only
	 */
	public var stage(default, null):Container;

	public static inline var AUTO:String = "auto";
	public static inline var RECOMMENDED:String = "recommended";
	public static inline var CANVAS:String = "canvas";
	public static inline var WEBGL:String = "webgl";

	var _lastTime:Date;
	var _currentTime:Date;
	var _elapsedTime:Float;
	var _frameCount:Int;

	#if fps
	var _fps:Fps;
	var _fpsDiv:DivElement;
	#end

	#if stats var _stats:Stats; #end
	#if fpsmeter var _fpsMeter:FPSMeter; #end

	public function new() {
		_lastTime = Date.now();
		_setDefaultValues();
	}

	function set_fps(val:Int):Int {
		_frameCount = 0;
		return fps = (val >= 1 && val < 60) ? Std.int(val) : 60;
	}

	function set_skipFrame(val:Bool):Bool {
		if (val) {
			trace("pixi.plugins.app.Application > Deprecated: skipFrame - use fps property and set it to 30 instead");
			fps = 30;
		}
		return skipFrame = val;
	}

	inline function _setDefaultValues() {
		pixelRatio = 1;
		skipFrame = false;
		autoResize = true;
		transparent = false;
		antialias = false;
		forceFXAA = false;
		roundPixels = false;
		backgroundColor = 0xFFFFFF;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		fps = 60;
	}

	/**
	 * Starts pixi application setup using the properties set or default values
	 * @param [rendererType] - Renderer type to use AUTO (default) | CANVAS | WEBGL
	 * @param [stats] - Enable/disable stats for the application.
	 * Note that stats.js is not part of pixi so don't forget to include it you html page
	 * Can be found in libs folder. "libs/stats.min.js" <script type="text/javascript" src="libs/stats.min.js"></script>
	 * @param [parentDom] - By default canvas will be appended to body or it can be appended to custom element if passed
	 */

	public function start(?rendererType:String = "auto", ?parentDom:Element) {
		canvas = Browser.document.createCanvasElement();
		canvas.style.width = width + "px";
		canvas.style.height = height + "px";
		canvas.style.position = "absolute";
		if (parentDom == null) Browser.document.body.appendChild(canvas);
		else parentDom.appendChild(canvas);

		stage = new Container();

		var renderingOptions:RenderingOptions = {};
		renderingOptions.view = canvas;
		renderingOptions.backgroundColor = backgroundColor;
		renderingOptions.resolution = pixelRatio;
		renderingOptions.antialias = antialias;
		renderingOptions.forceFXAA = forceFXAA;
		renderingOptions.autoResize = autoResize;
		renderingOptions.transparent = transparent;

		if (rendererType == AUTO) renderer = Detector.autoDetectRenderer(width, height, renderingOptions);
		else if (rendererType == CANVAS) renderer = new CanvasRenderer(width, height, renderingOptions);
		else renderer = new WebGLRenderer(width, height, renderingOptions);

		if (roundPixels) renderer.roundPixels = true;

		Browser.document.body.appendChild(renderer.view);
		if (autoResize) Browser.window.onresize = _onWindowResize;
		Browser.window.requestAnimationFrame(cast _onRequestAnimationFrame);
		_lastTime = Date.now();

		_addStats();
	}

	@:noCompletion function _onWindowResize(event:Event) {
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		renderer.resize(width, height);
		canvas.style.width = width + "px";
		canvas.style.height = height + "px";

		if (onResize != null) onResize();
	}

	@:noCompletion function _onRequestAnimationFrame() {
		_frameCount++;
		if (_frameCount == Std.int(60 / fps)) {
			_frameCount = 0;
			_calculateElapsedTime();
			if (onUpdate != null) onUpdate(_elapsedTime);
			renderer.render(stage);
		}
		Browser.window.requestAnimationFrame(cast _onRequestAnimationFrame);

		#if fps _fps.tick(); #end
		#if stats if (_stats != null) _stats.update(); #end
		#if fpsmeter if (_fpsMeter != null) _fpsMeter.tick(); #end
	}

	@:noCompletion function _calculateElapsedTime() {
		_currentTime = Date.now();
		_elapsedTime = _currentTime.getTime() - _lastTime.getTime();
		_lastTime = _currentTime;
	}

	@:noCompletion function _addStats() {
		#if fps
		_fps = new Fps(_updateFps);
		_fpsDiv = Browser.document.createDivElement();
		_fpsDiv.style.position = "absolute";
		_fpsDiv.style.right = "0px";
		_fpsDiv.style.top = "14px";
		_fpsDiv.style.width = "76px";
		_fpsDiv.style.background = "#CCCCC";
		_fpsDiv.style.backgroundColor = "#00FF00";
		_fpsDiv.style.fontFamily = "Helvetica,Arial";
		_fpsDiv.style.padding = "2px";
		_fpsDiv.style.color = "#000000";
		_fpsDiv.style.fontSize = "9px";
		_fpsDiv.style.fontWeight = "bold";
		_fpsDiv.style.textAlign = "center";
		_fpsDiv.innerHTML = "FPS: 60";
		Browser.document.body.appendChild(_fpsDiv);
		_addRenderStats();
		#end

		#if stats
		if (untyped __js__("window").Stats != null) {
			var container = Browser.document.createDivElement();
			Browser.document.body.appendChild(container);
			_stats = new Stats();
			_stats.domElement.style.position = "absolute";
			_stats.domElement.style.top = "14px";
			_stats.domElement.style.right = "0px";
			container.appendChild(_stats.domElement);
			_stats.begin();
			_addRenderStats();
		}
		else trace("Unable to find stats.js");
		#end

		#if fpsmeter
		if (untyped __js__("window").FPSMeter != null) {
			_fpsMeter = new FPSMeter( {theme: "colorful", top: "14px", right: "0px", left: "auto"});
			_addRenderStats();
		}
		else trace("Unable to find fpsmeter.js");
		#end
	}

	inline function _addRenderStats(?top:Int = 0) {
		var ren:DivElement = Browser.document.createDivElement();
		ren.style.position = "absolute";
		ren.style.width = "76px";
		ren.style.right = "0px";
		ren.style.background = "#CCCCC";
		ren.style.backgroundColor = "#105CB6";
		ren.style.fontFamily = "Helvetica,Arial";
		ren.style.padding = "2px";
		ren.style.color = "#0FF";
		ren.style.fontSize = "9px";
		ren.style.fontWeight = "bold";
		ren.style.textAlign = "center";
		Browser.document.body.appendChild(ren);
		ren.innerHTML = ["UNKNOWN", "WEBGL", "CANVAS"][renderer.type] + " - " + pixelRatio;
	}

	#if fps
	function _updateFps(val:Float) {
		_fpsDiv.innerHTML = "FPS: " + val;
	}
	#end
}