package pixi.plugins.projection;

@:native("PIXI.projection.BatchBilineardGeometry")
extern class BatchBilineardGeometry extends pixi.mesh.Geometry {
	function new(?_static:Bool);
	var _buffer : Dynamic;
	var _indexBuffer : Dynamic;
	//static var prototype : BatchBilineardGeometry;
}