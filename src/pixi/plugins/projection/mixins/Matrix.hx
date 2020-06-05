package pixi.plugins.projection.mixins;

@:native("PIXI.Matrix")
extern class Matrix extends pixi.core.math.Matrix {
	function apply(pos:IPoint, ?newPos:IPoint):IPoint;
	function applyInverse(pos:IPoint, ?newPos:IPoint):IPoint;
}