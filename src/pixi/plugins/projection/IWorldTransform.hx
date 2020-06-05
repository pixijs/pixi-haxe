package pixi.plugins.projection;

interface IWorldTransform {
	function apply(pos:IPoint, newPos:IPoint):IPoint;
	function applyInverse(pos:IPoint, newPos:IPoint):IPoint;
}