package pixi;

@:native("PIXI")
extern class Pixi {

	static var WEBGL_RENDERER:Int;
	static var CANVAS_RENDERER:Int;
	static var WEBGL:Int;
	static var HEADLESS:Int;

	static var NONE:Int;
	static var LEFT:Int;
	static var RIGHT:Int;
	static var UP:Int;
	static var DOWN:Int;

	static var SPRITE:Int;
	static var BUTTON:Int;
	static var IMAGE:Int;
	static var GRAPHICS:Int;
	static var TEXT:Int;
	static var TILESPRITE:Int;
	static var BITMAPTEXT:Int;
	static var GROUP:Int;
	static var RENDERTEXTURE:Int;
	static var TILEMAP:Int;
	static var TILEMAPLAYER:Int;
	static var EMITTER:Int;
	static var POLYGON:Int;
	static var BITMAPDATA:Int;
	static var CANVAS_FILTER:Int;
	static var WEBGL_FILTER:Int;
	static var ELLIPSE:Int;
	static var SPRITEBATCH:Int;
	static var RETROFONT:Int;

	static var Float32Array:Array<Dynamic>;
	static var Uint16Array:Array<Dynamic>;

	static var INTERACTION_FREQUENCY:Int;
	static var AUTO_PREVENT_DEFAULT:Bool;
	static var RAD_TO_DEG:Float;
	static var DEG_TO_RAD:Float;

	static var dontSayHello:Bool;

	static var VERSION:String;
	static var _UID:Float;

	static var instances:Array<Dynamic>;

	static var blendModes: {
		NORMAL:Int,
		ADD:Int,
		MULTIPLY:Int,
		SCREEN:Int,
		OVERLAY:Int,
		DARKEN:Int,
		LIGHTEN:Int,
		COLOR_DODGE:Int,
		COLOR_BURN:Int,
		HARD_LIGHT:Int,
		SOFT_LIGHT:Int,
		DIFFERENCE:Int,
		EXCLUSION:Int,
		HUE:Int,
		SATURATION:Int,
		COLOR:Int,
		LUMINOSITY:Int
	};

	static var scaleModes: {
		DEFAULT:Int,
		LINEAR:Int,
		NEAREST:Int
	};

	static var TextureCache:Array<Dynamic>;
	static var FrameCache:Array<Dynamic>;

	static var TextureCacheIdGenerator:Int;

	static function sayHello(type:Dynamic):Void;
}