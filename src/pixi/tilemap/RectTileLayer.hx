package pixi.tilemap;

import pixi.core.display.DisplayObject;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.textures.Texture;

extern class RectTileLayer extends DisplayObject {

	function new(zIndex:Float, texture:Texture);
	
	var pointsBuf:Array<Float>;
	
	var modificationMarker:Int;
	
	var hasAnim:Bool;
	
	function initialize(zIndex:Float, texture:Texture):Void;
	
	function clear():Void;
	
	function renderCanvas(renderer:CanvasRenderer):Void;
	
	function addRect(u:Float, v:Float, x:Float, y:Float, tileWidth:Int, tileHeight:Int, animX:Float, animY:Float):Void;
	
	function renderWebGL(renderer:WebGLRenderer, useSquare:Bool):Void;
}