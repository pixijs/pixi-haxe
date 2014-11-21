package pixi.renderers.webgl.utils;

@:native("PIXI.WebGLGraphics")
extern class WebGLGraphics {

}

@:native("PIXI.WebGLGraphicsData")
extern class WebGLGraphicsData {

	/**
	 * @method reset
	 */
	function reset():Void;

	/**
	 * @method upload
	 */
	function upload():Void;
}