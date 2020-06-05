package pixi.plugins.projection;

@:native("PIXI.projection.UniformBatchRenderer")
extern class UniformBatchRenderer extends pixi.core.renderers.webgl.AbstractBatchRenderer {
	function new();
	var _iIndex : Float;
	var _aIndex : Float;
	var _dcIndex : Float;
	var _bufferedElements : Array<Dynamic>;
	var _attributeBuffer : Dynamic;
	var _indexBuffer : js.lib.Uint16Array;
	//var vertexSize : Float;
	var forceMaxTextures : Float;
	function getUniforms(sprite:pixi.plugins.projection.mixins.Sprite):Dynamic;
	function syncUniforms(obj:Dynamic):Void;
	var defUniforms : { };
	function buildDrawCalls(texArray:Dynamic, start:Float, finish:Float):Void;
	function drawBatches():Void;
	function contextChange():Void;
	//static var prototype : UniformBatchRenderer;
}