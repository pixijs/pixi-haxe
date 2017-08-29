package pixi.plugins.spine.core.utils;

@:native("PIXI.spine.core.Color")
extern class Color {

	static var WHITE:Color;
	static var RED:Color;
	static var GREEN:Color;
	static var BLUE:Color;
	static var MAGENTA:Color;

	function new(?r:Int, ?g:Int, ?b:Int, ?a:Int);

	function set(r:Int, g:Int, b:Int, a:Int):Color;
	function setFromColor(c:Color):Color;
	function setFromString (hex:String):Color;
	function add(r:Int, g:Int, b:Int, a:Int):Color;
	function clamp():Void;
}