package pixi.utils;

@:native("PIXI.Utils")
extern class Utils {
	
	/**
	 * Converts a hex color number to an [R, G, B] array
	 *
	 * @method hex2rgb
	 * @param hex {Number}
	*/
	static function hex2rgb(hex:Float):Array<Float>;

	/**
	 * Converts a color as an [R, G, B] array to a hex number
	 *
	 * @method rgb2hex
	 * @param rgb {Array}
	*/
	static function rgb2hex(rgb:Array<Float>):Float;

	/**
	 * A wrapper for ajax requests to be handled cross browser
	 *
	 * @method AjaxRequest
	*/
	static function AjaxRequest():Dynamic;

	/**
	 * Checks whether the Canvas BlendModes are supported by the current browser
	 *
	 * @method canUseNewCanvasBlendModes
	 * @return {Boolean} whether they are supported
	*/
	static function canUseNewCanvasBlendModes():Bool;

	/**
	 * Given a number, this function returns the closest number that is a power of two
	 * this function is taken from Starling Framework as its pretty neat ;)
	 *
	 * @method getNextPowerOfTwo
	 * @param number {Number}
	 * @return {Number} the closest number that is a power of two
	*/
	static function getNextPowerOfTwo(hex:Float):Float;
}