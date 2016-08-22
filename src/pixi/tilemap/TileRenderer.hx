package pixi.tilemap;

import js.html.Uint16Array;
import pixi.core.Shader;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.renderers.webgl.utils.ObjectRenderer;

extern class TileRenderer extends ObjectRenderer {
	
	/**
	 * The default vertex shader source
	 *
	 * @static
	 * @constant
	 */
	function new(renderer:WebGLRenderer):Void;
	
	var vbs:Dynamic;
	
	var lastTimeCheck:Float;
	
	var tileAnim:Array<Float>;
	
	var indices:Uint16Array;
	
	var rectShader:RectTileShader;
	
	var squareShader:SquareTileShader;
	
	var indexBuffer:Dynamic;
	
	function onContextChange():Void;
	
	function checkLeaks():Void;
	
	function start():Void;
	
	function getVb():Dynamic;
	
	function createVb(useSquare:Bool):Dynamic;
	
	function removeVb(id:Int):Void;
	
	function getShader(useSquare:Bool):Shader;
	
	function destroy():Void;
	
}