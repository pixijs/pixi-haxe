package pixi.tilemap;

import pixi.core.display.Container;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.textures.Texture;

@:native("PIXI.tilemap.CompositeRectTileLayer")
extern class CompositeRectTileLayer extends Container {

	function new();
	
	var useSquare:Bool;
	
	var modificationMarker:Int;
	
	//can be initialized multiple times
	function initialize(zIndex:Float, bitmaps:Array<Texture>, useSquare:Bool):Void;
	
	function setBitmaps(bitmaps:Array<Texture>):Void;
	
	function clear():Void;
	
	function addRect(num:Int, u:Float, v:Float, x:Float, y:Float, tileWidth:Int, tileHeight:Int):Void;
	
	/**
	 * "hello world!" of pixi-tilemap library. Pass it texture and it will be added
	 * @param texture {string|Texture}
	 * @param x {number}
	 * @param y {number}
	 * @returns {boolean}
	 */
	function addFrame(texture:Dynamic, x:Float, y:Float):Bool;
	
	function renderCanvas(renderer:CanvasRenderer):Void;
	
	function renderWebGL(renderer:WebGLRenderer):Void;
	
	function isModified(anim:Bool):Bool;	//TODO: Check if anim is really bool
	
	function clearModify():Void;
}