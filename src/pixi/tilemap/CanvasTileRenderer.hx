package pixi.tilemap;

import pixi.core.renderers.canvas.CanvasRenderer;

extern class CanvasTileRenderer {

	public function new(renderer:CanvasRenderer):Void;
	
	var renderer:CanvasRenderer;
	
	var tileAnim:Array<Float>;
}