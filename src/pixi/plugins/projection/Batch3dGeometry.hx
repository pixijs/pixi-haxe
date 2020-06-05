package pixi.plugins.projection;

@:native("PIXI.projection.Batch3dGeometry")
extern class Batch3dGeometry extends pixi.mesh.Geometry {
	function new(?_static:Bool);
	var _buffer : Dynamic;
	var _indexBuffer : Dynamic;
	//static var prototype : Batch3dGeometry;
}