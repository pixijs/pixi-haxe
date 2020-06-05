package pixi.plugins.projection;

@:native("PIXI.projection.Projection2d")
extern class Projection2d extends LinearProjection<Matrix2d> {
	function new(legacy:pixi.plugins.projection.mixins.Transform, ?enable:Bool);
	var matrix : Matrix2d;
	var pivot : pixi.plugins.projection.mixins.ObservablePoint;
	var reverseLocalOrder : Bool;
	function onChange():Void;
	function setAxisX(p:IPoint, ?factor:Float):Void;
	function setAxisY(p:IPoint, ?factor:Float):Void;
	function mapSprite(sprite:pixi.plugins.projection.mixins.Sprite, quad:Array<IPoint>):Void;
	function mapQuad(rect:Dynamic, p:Array<IPoint>):Void;
	//static var prototype : Projection2d;
}