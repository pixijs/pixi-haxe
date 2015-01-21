package pixi;

interface IApplication {

	var pixelRatio(null, default):Float;
	var skipFrame(null, default):Bool;
	var resize(null, default):Bool;
	var stats(null, set):Bool;
	var backgroundColor(null, default):Int;
	var width(null, default):Float;
	var height(null, default):Float;

	var onUpdate:Float -> Void;
	var onResize:Void -> Void;

	function start():Void;
}