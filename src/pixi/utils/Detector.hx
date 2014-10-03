package pixi.utils;

@:native("PIXI")
extern class Detector {

	/**
	 * This helper function will automatically detect which renderer you should be using.
	 * WebGL is the preferred renderer as it is a lot faster. If webGL is not supported by
	 * the browser then this function will return a canvas renderer
	 * @class autoDetectRenderer
	 * @static
	 * @param width=800 {Number} the width of the renderers view
	 * @param height=600 {Number} the height of the renderers view
	 * @param [view] {Canvas} the canvas to use as a view, optional 
	 * @param [transparent=false] {Boolean} the transparency of the render view, default false
	 * @param [antialias=false] {Boolean} sets antialias (only applicable in webGL chrome at the moment)
	 *
	*/
	public static function autoDetectRenderer(width:Int, height:Int, ?view:Dynamic, ?transparent:Bool, ?antialias:Bool):Dynamic;

	/**
	 * This helper function will automatically detect which renderer you should be using.
	 * This function is very similar to the autoDetectRenderer function except that is will return a canvas renderer for android.
	 * Even thought both android chrome suports webGL the canvas implementation perform better at the time of writing. 
	 * This function will likely change and update as webGL performance imporoves on thease devices.
	 * @class getRecommendedRenderer
	 * @static
	 * @param width=800 {Number} the width of the renderers view
	 * @param height=600 {Number} the height of the renderers view
	 * @param [view] {Canvas} the canvas to use as a view, optional 
	 * @param [transparent=false] {Boolean} the transparency of the render view, default false
	 * @param [antialias=false] {Boolean} sets antialias (only applicable in webGL chrome at the moment)
	 *
	*/
	public static function autoDetectRecommendedRenderer(width:Int, height:Int, ?view:Dynamic, ?transparent:Bool, ?antialias:Bool):Dynamic;
}
