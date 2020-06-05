package pixi.plugins.projection;

@:native("PIXI.projection.Text3d")
extern class Text3d extends pixi.core.text.Text {
	function new(?text:String, ?style:Dynamic, ?canvas:js.html.CanvasElement);
	var proj : Projection3d;
	var vertexData2d : js.lib.Float32Array;
	//final worldTransform : Dynamic;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	function isFrontFace(?forceUpdate:Bool):Dynamic;
	function getDepth(?forceUpdate:Bool):Dynamic;
	var position3d : IPoint;
	var scale3d : IPoint;
	var euler : IEuler;
	var pivot3d : IPoint;
	//static var prototype : Text3d;
}