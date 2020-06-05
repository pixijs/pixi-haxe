package pixi.plugins.projection;

@:native("PIXI.projection.TilingSprite2d")
extern class TilingSprite2d extends pixi.extras.TilingSprite {
	function new(texture:Dynamic, width:Float, height:Float);
	var tileProj : Projection2d;
	var proj : Projection2d;
	//final worldTransform : Dynamic;
	function toLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:TRANSFORM_STEP):T;
	function _render(renderer:Dynamic):Void;
	//static var prototype : TilingSprite2d;
}