package pixi.core.renderers;

import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI")
extern class Detector {

	@:overload(function(width:Float, height:Float, ?options:RenderOptions, ?noWebGL:Bool):CanvasRenderer {})
	static function autoDetectRenderer(width:Float, height:Float, ?options:RenderOptions, ?noWebGL:Bool):WebGLRenderer;
}