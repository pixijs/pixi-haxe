package pixi.plugins.projection;

@:native("PIXI.projection.Text2s")
extern class Text2s extends pixi.core.text.Text {
	function new(?text:String, ?style:Dynamic, ?canvas:js.html.CanvasElement);
	var proj : ProjectionSurface;
	var aTrans : global.pixi.Matrix;
	//final worldTransform : Dynamic;
	//static var prototype : Text2s;
}