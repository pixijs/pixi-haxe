package pixi.plugins.projection;

@:native("PIXI.projection.ProjectionSurface")
extern class ProjectionSurface extends AbstractProjection {
	function new(legacy:pixi.plugins.projection.mixins.Transform, ?enable:Bool);
	var _surface : Surface;
	var _activeProjection : ProjectionSurface;
	var surface : Surface;
	function applyPartial(pos:IPoint, ?newPos:IPoint):IPoint;
	function apply(pos:IPoint, ?newPos:IPoint):IPoint;
	function applyInverse(pos:IPoint, newPos:IPoint):IPoint;
	function mapBilinearSprite(sprite:pixi.plugins.projection.mixins.Sprite, quad:Array<IPoint>):Void;
	var _currentSurfaceID : Float;
	var _currentLegacyID : Float;
	var _lastUniforms : Dynamic;
	final uniforms : Dynamic;
	//static var prototype : ProjectionSurface;
}