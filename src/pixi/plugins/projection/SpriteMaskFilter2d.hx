package pixi.plugins.projection;

@:native("PIXI.projection.SpriteMaskFilter2d")
extern class SpriteMaskFilter2d extends pixi.core.renderers.webgl.filters.Filter {
	function new(sprite:pixi.plugins.projection.mixinsSprite);
	var maskSprite : pixi.plugins.projection.mixinsSprite;
	var maskMatrix : Matrix2d;
	function apply(filterManager:Dynamic, input:Dynamic, output:Dynamic, ?clearMode:Bool):Void;
	//static var prototype : SpriteMaskFilter2d;
	static function calculateSpriteMatrix(input:Dynamic, mappedMatrix:Matrix2d, sprite:pixi.plugins.projection.mixins.Sprite):Matrix2d;
}