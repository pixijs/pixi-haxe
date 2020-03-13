package pixi.plugins.spine.core;

@:native("PIXI.spine.core.Color")
extern class Color {
	var r:Float;
	var g:Float;
	var b:Float;
	var a:Float;
	static final WHITE:Color;
	static final RED:Color;
	static final GREEN:Color;
	static final BLUE:Color;
	static final MAGENTA:Color;

	function new(?r:Float, ?g:Float, ?b:Float, ?a:Float);

	function set(r:Float, g:Float, b:Float, a:Float):Color;
	function setFromColor(c:Color):Color;
	function setFromString(hex:String):Color;
	function add(r:Float, g:Float, b:Float, a:Float):Color;
	function clamp():Color;

	static function rgba8888ToColor(color:Color, value:Float):Void;
	static function rgb888ToColor(color:Color, value:Float):Void;
}
