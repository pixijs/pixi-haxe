package pixi.plugins.projection;

@:native("PIXI.projection.SimpleMesh2d")
extern class SimpleMesh2d extends Mesh2d {
	function new(texture:Dynamic, ?vertices:js.lib.Float32Array, ?uvs:js.lib.Float32Array, ?indices:js.lib.Uint16Array, ?drawMode:Float);
	var autoUpdate : Bool;
	var vertices : js.lib.Float32Array;
	private function _render(?renderer:Dynamic):Void;
	//static var prototype : SimpleMesh2d;
}