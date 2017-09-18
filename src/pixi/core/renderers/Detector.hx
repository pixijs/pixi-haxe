package pixi.core.renderers;

import pixi.core.renderers.SystemRenderer;

@:native("PIXI")
extern class Detector {

	static function autoDetectRenderer(?options:RenderOptions, ?width:Int, ?height:Int, ?forceCanvas:Bool):SystemRenderer;
}