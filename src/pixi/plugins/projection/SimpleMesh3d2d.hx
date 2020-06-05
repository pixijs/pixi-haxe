package pixi.plugins.projection;

@:native("PIXI.projection.SimpleMesh3d2d")
extern class SimpleMesh3d2d extends Mesh3d2d {
	function new(texture:Dynamic, ?vertices:js.lib.Float32Array, ?uvs:js.lib.Float32Array, ?indices:js.lib.Uint16Array, ?drawMode:Float);
	var autoUpdate : Bool;
	var vertices : js.lib.Float32Array;
	private function _render(?renderer:Dynamic):Void;
	//static var prototype : SimpleMesh3d2d;
}