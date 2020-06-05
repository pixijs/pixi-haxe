package pixi.plugins.projection;

@:native("PIXI.projection.Mesh2d")
extern class Mesh2d extends pixi.mesh.Mesh {
	function new(geometry:Dynamic, shader:Dynamic, state:Dynamic, ?drawMode:Float);
	var vertexData2d : js.lib.Float32Array;
	var proj : Projection2d;
	function calculateVertices():Void;
	function _renderDefault(renderer:Dynamic):Void;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	//final worldTransform : Dynamic;
	//static var prototype : Mesh2d;
	static var defaultVertexShader : String;
	static var defaultFragmentShader : String;
}