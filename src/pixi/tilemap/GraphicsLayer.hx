package pixi.tilemap;

import pixi.core.graphics.Graphics;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.Renderer;

extern class GraphicsLayer extends Graphics {
	function new(zIndex:Float);

	function renderCanvas(renderer:CanvasRenderer):Void;

	function render(renderer:Renderer):Void;

	function isModified(anim:Bool):Bool;

	function clearModify():Void;
}
