package pixi.tilemap;

import pixi.core.display.Container;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.textures.Texture;

@:native("PIXI.tilemap.CompositeRectTileLayer")
extern class CompositeRectTileLayer extends Container {
	function new();

	var useSquare:Bool;

	var modificationMarker:Int;

	/// can be initialized multiple times
	function initialize(zIndex:Float, bitmaps:Array<Texture>, useSquare:Bool):Void;

	function setBitmaps(bitmaps:Array<Texture>):Void;

	function clear():Void;

	function addRect(num:Int, u:Float, v:Float, x:Float, y:Float, tileWidth:Int, tileHeight:Int):Void;

	function addFrame(texture:Dynamic, x:Float, y:Float):Bool;

	function renderCanvas(renderer:CanvasRenderer):Void;

	function render(renderer:Renderer):Void;

	function isModified(anim:Bool):Bool;

	function clearModify():Void;
}
