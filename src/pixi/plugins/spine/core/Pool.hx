package pixi.plugins.spine.core;

@:native("PIXI.spine.core.Pool")
extern class Pool<T> {
	private var items:Array<T>;
	private var instantiator:Void->T;
	function new(instantiator:Void->T);
	function obtain():T;
	function free(item:T):Void;
	function freeAll(items:Array<T>):Void;
	function clear():Void;
}
