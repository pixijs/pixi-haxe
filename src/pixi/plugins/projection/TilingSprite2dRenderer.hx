package pixi.plugins.projection;

@:native("PIXI.projection.TilingSprite2dRenderer")
extern class TilingSprite2dRenderer extends pixi.core.renderers.webgl.utils.ObjectRenderer {
	function new(renderer:Dynamic);
	var shader : Dynamic;
	var simpleShader : Dynamic;
	var quad : Dynamic;
	function render(ts:Dynamic):Void;
	//static var prototype : TilingSprite2dRenderer;
}