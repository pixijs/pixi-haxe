package pixi.core.renderers;

import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;
import js.html.CanvasElement;

@:native("PIXI")
extern class Detector {

	@:overload(function(width:Float, height:Float, ?options:RenderingOptions, ?noWebGL:Bool):CanvasRenderer {})
	static function autoDetectRenderer(width:Float, height:Float, ?options:RenderingOptions, ?noWebGL:Bool):WebGLRenderer;
}

typedef RenderingOptions = {
	@:optional var backgroundColor:Int;
	@:optional var view:CanvasElement;
	@:optional var transparent:Bool;
	@:optional var autoResize:Bool;
	@:optional var resolution:Float;
	@:optional var clearBeforeRender:Bool;
	@:optional var antialias:Bool;
	@:optional var forceFXAA:Bool;
	@:optional var preserveDrawingBuffer:Bool;
	@:optional var roundPixels:Bool;
}