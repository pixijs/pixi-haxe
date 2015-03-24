package pixi.plugins.eventemitter;

typedef EventTarget = {
	var stopped:Bool;
	var type:String;
	var data:Dynamic;
	var target:Dynamic;
}