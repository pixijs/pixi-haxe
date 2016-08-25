package pixi.tilemap;

import pixi.core.renderers.canvas.CanvasRenderer;

extern class CanvasTileRenderer {

	public function new(renderer:CanvasRenderer);
	
	var renderer:CanvasRenderer;
	
	var tileAnim:Array<Float>;
}