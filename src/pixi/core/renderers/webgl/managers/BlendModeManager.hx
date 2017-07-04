package pixi.core.renderers.webgl.managers;
import pixi.core.Pixi.BlendModes;

extern class BlendModeManager extends WebGLManager {

	/**
	 * @class
	 * @memberof PIXI
	 * @extends WebGlManager
	 * @param renderer {WebGLRenderer} The renderer this manager works for.
	 */
	function new(renderer:WebGLRenderer);

	/**
	 * Sets-up the given blendMode from WebGL's point of view.
	 *
	 * @param blendMode {number} the blendMode, should be a Pixi const, such as BlendModes.ADD
	 */
	function setBlendMode(blendMode:BlendModes):Void;
}