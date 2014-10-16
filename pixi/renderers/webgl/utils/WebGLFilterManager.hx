package phaser.pixi.renderers.webgl.utils;

@:native("PIXI.WebGLFilterManager")
extern class WebGLFilterManager {
	
	/**
	 * @class WebGLFilterManager
	 * @constructor
	 * @param gl {WebGLContext} the current WebGL drawing context
	 * @param transparent {Boolean} Whether or not the drawing context should be transparent
	 */
	function new (gl:Dynamic, transparent:Bool);
	
}
