package pixi.plugins.projection;

@:native("PIXI.projection.BilinearSurface")
extern class BilinearSurface extends Surface {
	function new();
	var distortion : pixi.plugins.projection.mixins.Point;
	function apply(pos:IPoint, ?newPos:IPoint):IPoint;
	function mapSprite(sprite:pixi.plugins.projection.mixins.Sprite, quad:Array<IPoint>, ?outTransform:pixi.plugins.projection.mixins.Transform):BilinearSurface;
	function mapQuad(rect:Dynamic, quad:Array<IPoint>, outTransform:pixi.plugins.projection.mixins.Transform):BilinearSurface;
	//static var prototype : BilinearSurface;
}