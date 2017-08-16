package pixi.tilemap;
import pixi.core.Shader;

import pixi.core.renderers.webgl.WebGLRenderer;

extern class RectTileShader extends Shader {

	function new(gl:WebGLRenderer);

	var vertSize:Int;

	var vertPerQuad:Int;

	var stride:Int;

	function createVao(renderer:WebGLRenderer, vb:Dynamic):Dynamic;
}