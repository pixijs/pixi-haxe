package pixi.core.utils;

typedef IsMobile = {
	any: Bool,
	phone: Bool,
	seven_inch: Bool,
	tablet: Bool,
	amazon: { tablet:Bool, phone: Bool, device:Bool },
	android: { tablet:Bool, phone: Bool, device:Bool },
	windows: { tablet:Bool, phone: Bool, device:Bool },
	apple: { tablet:Bool, phone: Bool, device:Bool, ipod: Bool },
	other: {
		blackberry: Bool,
		blackberry10: Bool,
		chrome: Bool,
		device: Bool,
		firefox: Bool,
		opera: Bool
	}
}

@:native("PIXI.utils")
extern class Utils {

	static var EventEmitter:Dynamic;
	static var pluginTarget:Dynamic;
	static var async:Dynamic;
	static var TextureCache:Dynamic;
	static var BaseTextureCache:Dynamic;


	/**
	 * True if pixi is running on mobile device
	 */
	static var isMobile:IsMobile;

	/**
     * Gets the next unique identifier
     *
     * @return {Int} The next unique identifier to use.
     */
	static function uid():Int;

	/**
     * Converts a hex color number to an [R, G, B] array
     *
     * @param hex {Int}
     * @param out {Array<Int>}
     * @return {Array<Int>} An array representing the [R, G, B] of the color.
     */
	static function hex2rgb(hex:Int, out:Array<Int>):Array<Int>;

	/**
     * Converts a hex color number to a string.
     *
     * @param hex {Int}
     * @return {string} The string color.
     */
	static function hex2string(hex:Int):String;

	/**
     * Converts a color as an [R, G, B] array to a hex number
     *
     * @param rgb {Array<Int>}
     * @return {Int} The color number
     */
	static function rgb2hex(rgb:Array<Int>):Int;

	/**
     * Checks whether the Canvas BlendModes are supported by the current browser
     *
     * @return {Bool} whether they are supported
     */
	static function canUseNewCanvasBlendModes():Bool;

	/**
     * Given a number, this function returns the closest number that is a power of two
     * this function is taken from Starling Framework as its pretty neat ;)
     *
     * @param number {Float}
     * @return {Float} the closest number that is a power of two
     */
	static function getNextPowerOfTwo(number:Float):Float;

	/**
     * checks if the given width and height make a power of two rectangle
     *
     * @param width {Float}
     * @param height {Float}
     * @return {Bool}
     */
	static function isPowerOfTwo(width:Float, height:Float):Bool;

	/**
	 * get the resolution of an asset by looking for the prefix
	 * used by spritesheets and image urls
	 *
	 * @param url {String} the image path
	 * @return {Float}
	 */
	static function getResolutionOfUrl(url:String):Float;

	/**
     * Logs out the version and renderer information for this running instance of PIXI.
     * If you don't want to see this message you can set `PIXI.utils._saidHello = true;`
     * so the library thinks it already said it. Keep in mind that doing that will forever
     * makes you a jerk face.
     *
     * @param {String} type - The string renderer type to log.
     * @constant
     * @static
     */
	static function sayHello(type:String):Void;

	/**
	 * Helper for checking for webgl support
	 *
	 * @return {Bool}
	 */
	static function isWebGLSupported():Bool;

	/**
     * Returns sign of number
     *
     * @param n {Float}
     * @returns {Int} 0 if n is 0, -1 if n is negative, 1 if n i positive
     */
	static function sign(n:Float):Int;

	/**
     * removeItems
     *
     * @param {Array} arr The target array
     * @param {Int} startIdx The index to begin removing from (inclusive)
     * @param {Int} removeCount How many items to remove
     */
	static function removeItems(arr:Array<Dynamic>, startIdx:Int, removeCount:Int):Void;

	/**
	 * Destroys all texture in the cache
	 */
	static function destroyTextureCache():Void;

	/**
	 * Removes all textures from cache, but does not destroy them
	 */
	static function clearTextureCache():Void;
}