package pixi.plugins.spine.core;

extern class Vector2 {
	var x:Float;
	var y:Float;
	function new(?x:Float, ?y:Float);
	function set(x:Float, y:Float):Vector2;
	function length():Float;
	function normalize():Vector2;
}
