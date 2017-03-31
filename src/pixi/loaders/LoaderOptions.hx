package pixi.loaders;

typedef LoaderOptions = {
	@:optional var crossOrigin:Dynamic;
	@:optional var loadType:Int;
	@:optional var xhrType:String;
	@:optional var parentResource:Resource;
	@:optional var metadata:LoaderMetadata;
}

typedef LoaderMetadata = {
	@:optional var loadElement:Dynamic;
	@:optional var skipSource:Bool;
}