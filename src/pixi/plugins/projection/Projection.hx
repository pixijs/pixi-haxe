package pixi.plugins.projection;

@:native("PIXI.projection")
@valueModuleOnly
extern class Projection {
	static function container2dWorldTransform():Dynamic;
	dynamic static function container2dToLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:global.pixi.projection.TRANSFORM_STEP):T;
	static function container3dWorldTransform():Dynamic;
	dynamic static function container3dToLocal<T>(position:IPoint, ?from:Dynamic, ?point:T, ?skipUpdate:Bool, ?step:global.pixi.projection.TRANSFORM_STEP):T;
	dynamic static function container3dGetDepth(?forceUpdate:Bool):Float;
	dynamic static function container3dIsFrontFace(?forceUpdate:Bool):Bool;
}