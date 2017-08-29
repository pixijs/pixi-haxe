package pixi.core.renderers;

import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI")
extern class Detector {

	@:overload(function(?width:Float, ?height:Float, ?options:RenderOptions, ?noWebGL:Bool):CanvasRenderer {})
	@:overload(function(?options:RenderOptions, ?width:Float, ?height:Float, ?noWebGL:Bool):CanvasRenderer {})
	@:overload(function(?width:Float, ?height:Float, ?options:RenderOptions, ?noWebGL:Bool):WebGLRenderer {})
	static function autoDetectRenderer(?options:RenderOptions, ?width:Float, ?height:Float, ?noWebGL:Bool):WebGLRenderer;
}