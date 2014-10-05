package phaser.pixi.renderers.webgl.utils;

@:native("PIXI.WebGLBlendModeManager")
extern class WebGLBlendModeManager {
	
	/**
	 * @class WebGLMaskManager
	 * @constructor
	 * @param gl {WebGLContext} the current WebGL drawing context
	*/
	function new (gl:Dynamic);

	/**
	 * Sets-up the given blendMode from WebGL's point of view
	 * @method setBlendMode 
	 *
	 * @param blendMode {Number} the blendMode, should be a Pixi const, such as PIXI.BlendModes.ADD
	 */
	function setBlendMode(blendMode:Float):Void;

	function destroy():Void;
}