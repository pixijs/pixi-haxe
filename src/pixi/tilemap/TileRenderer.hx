package pixi.tilemap;

import js.lib.Uint16Array;
import pixi.core.Shader;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.utils.ObjectRenderer;

extern class TileRenderer extends ObjectRenderer {
	/**
	 * The default vertex shader source
	 *
	 * @static
	 * @constant
	 */
	function new(renderer:Renderer);

	var vbs:Dynamic;

	var lastTimeCheck:Float;

	var tileAnim:Array<Float>;

	var indices:Uint16Array;

	var rectShader:RectTileShader;

	var squareShader:SquareTileShader;

	var indexBuffer:Dynamic;

	function checkLeaks():Void;

	function getVb():Dynamic;

	function createVb(useSquare:Bool):Dynamic;

	function removeVb(id:Int):Void;

	function getShader(useSquare:Bool):Shader;
}
