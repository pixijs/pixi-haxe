package pixi.core.renderers.webgl.managers;

import pixi.core.renderers.webgl.Renderer;

extern class WebGLManager {
	/**
	 * @class
	 * @memberof PIXI
	 * @param renderer {Renderer} The renderer this manager works for.
	 */
	function new(renderer:Renderer);

	/**
	 * Generic method called when there is a WebGL context change.
	 *
	 */
	function onContextChange():Void;

	/**
	 * Generic destroy methods to be overridden by the subclass
	 *
	 */
	function destroy():Void;
}
