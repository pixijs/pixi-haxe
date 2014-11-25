package pixi.utils;

import js.html.DivElement;

@:native("Stats")
extern class Stats {

	var domElement(default, null):DivElement;

	function new();

	function begin():Void;
	function end():Void;
	function update():Void;
	function setMode(value:Int):Void;
}