package pixi.plugins.projection;

@:native("PIXI.projection.Mesh3d2d")
extern class Mesh3d2d extends pixi.mesh.Mesh {
	function new(geometry:Dynamic, shader:Dynamic, state:Dynamic, ?drawMode:Float);
	var vertexData2d : js.lib.Float32Array;
	var proj : Projection3d;
	function calculateVertices():Void;
	//final worldTransform : Dynamic;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	function isFrontFace(?forceUpdate:Bool):Dynamic;
	function getDepth(?forceUpdate:Bool):Dynamic;
	var position3d : IPoint;
	var scale3d : IPoint;
	var euler : Euler;
	var pivot3d : IPoint;
	//static var prototype : Mesh3d2d;
}