package pixi.plugins.projection;

@:native("PIXI.projection.Batch2dPluginFactory")
extern class Batch2dPluginFactory {
	function new();
	//static var prototype : Batch2dPluginFactory;
	static function create(options:Dynamic):Dynamic;
}