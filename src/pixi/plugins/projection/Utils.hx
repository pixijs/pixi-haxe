package pixi.plugins.projection;

@:native("PIXI.projection.utils")
@valueModuleOnly
extern class Utils {
	static function getIntersectionFactor(p1:IPoint, p2:IPoint, p3:IPoint, p4:IPoint, out:IPoint):Float;
	static function getPositionFromQuad(p:Array<IPoint>, anchor:IPoint, out:IPoint):IPoint;
}