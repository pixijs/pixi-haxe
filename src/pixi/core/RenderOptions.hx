package pixi.core;

typedef RenderOptions = {
	@:optional var view:Dynamic;
	@:optional var resolution:Float;
	@:optional var antialias:Bool;
	@:optional var forceFXAA:Bool;
	@:optional var autoResize:Bool;
	@:optional var transparent:Bool;
	@:optional var backgroundColor:Int;
	@:optional var clearBeforeRender:Bool;
	@:optional var preserveDrawingBuffer:Bool;
}