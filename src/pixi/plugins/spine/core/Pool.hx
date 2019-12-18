package pixi.plugins.spine.core;

extern class Pool<T> {
	private var items:Array<T>;
	private var instantiator:() -> T;
	function new(instantiator: () -> T);
	function obtain():T;
	function free(item: T): Void;
	function freeAll(items: Array<T>): Void;
	function clear(): Void;
}
