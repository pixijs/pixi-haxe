package pixi.tilemap;

import pixi.core.graphics.Graphics;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;

extern class GraphicsLayer extends Graphics {

	function new(zIndex:Float);
	
	function renderCanvas(renderer:CanvasRenderer):Void;
	
	function renderWebGL(renderer:WebGLRenderer):Void;
	
	function isModified(anim:Bool):Bool; //TODO: Check if anim is really bool
	
	function clearModify():Void;
}