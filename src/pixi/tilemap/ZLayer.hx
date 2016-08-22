package pixi.tilemap;

import pixi.core.display.Container;
import pixi.core.renderers.canvas.CanvasRenderer;

extern class ZLayer extends Container {

	function new();
	
	var tilemap:Dynamic;
	
	function initialize(tilemap:Dynamic, zIndex:Int):Void;
	
	function clear():Void;
	
	function cacheIfDirty():Void;
	
	function renderCanvas(renderer:CanvasRenderer):Void;
}