package phaser.pixi.renderers.canvas.utils;

@:native("PIXI.CanvasTinter")
extern class CanvasTinter {
	
	/**
	 * @class CanvasTinter
	 */
	static function new ();
	
	/**
	 * Number of steps which will be used as a cap when rounding colors
	 */
	var cacheStepsPerColorChannel:Float;
	
	/**
	 * Number of steps which will be used as a cap when rounding colors
	 */
	var convertTintToImage:Bool;
	
	/**
	 * Whether or not the Canvas BlendModes are supported, consequently the ability to tint using the multiply method
	 */
	var canUseMultiply:Bool;
	
}
