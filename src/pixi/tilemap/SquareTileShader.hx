package pixi.tilemap;

import pixi.core.Shader;
import pixi.core.renderers.webgl.Renderer;

extern class SquareTileShader extends Shader {
	function new(gl:Renderer);

	var vertSize:Int;

	var vertPerQuad:Int;

	var stride:Int;

	function createVao(renderer:Renderer, vb:Dynamic):Dynamic;
}
