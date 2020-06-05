package pixi.plugins.projection.mixins;

@:native("PIXI.SimpleMesh")
extern class SimpleMesh extends pixi.mesh.SimpleMesh {
	@:optional
	function convertTo2d():Void;
}