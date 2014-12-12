package pixi.utils;

@:native("PIXI.Utils")
extern class Utils {

	/**
	 * Converts a hex color number to an [R, G, B] array
	 *
	 * @method hex2rgb
	 * @param hex {Float}
	 * @return Array<Float>
	*/
	static function hex2rgb(hex:Float):Array<Float>;

	/**
	 * Converts a color as an [R, G, B] array to a hex number
	 *
	 * @method rgb2hex
	 * @param rgb {Array}
	 * @return Float
	*/
	static function rgb2hex(rgb:Array<Float>):Float;

	/**
	 * Checks whether the Canvas BlendModes are supported by the current browser
	 *
	 * @method canUseNewCanvasBlendModes
	 * @return {Bool} whether they are supported
	*/
	static function canUseNewCanvasBlendModes():Bool;

	/**
	 * Given a number, this function returns the closest number that is a power of two
	 * this function is taken from Starling Framework as its pretty neat ;)
	 *
	 * @method getNextPowerOfTwo
	 * @param number {Float}
	 * @return {Float} the closest number that is a power of two
	*/
	static function getNextPowerOfTwo(hex:Float):Float;

	/**
	 * checks if the given width and height make a power of two texture
	 * @method isPowerOfTwo
	 * @param width {Float}
	 * @param height {Float}
	 * @return {Bool}
	 */
	static function isPowerOfTwo(width:Float, height:Float):Bool;
}

/**
 * A wrapper for ajax requests to be handled cross browser
 *
 * @method AjaxRequest
*/
@:native("PIXI.AjaxRequest")
extern class AjaxRequest {

	var overrideMimeType:String -> Void;
	var responseXML:Dynamic;
	var responseText:String;
	var status:Int;
	var readyState:Int;
	var onreadystatechange:Void -> Void;

	function new():Void;
	function open(method:String, url:String, value:Bool):Void;
	function send(data:Dynamic):Void;
}