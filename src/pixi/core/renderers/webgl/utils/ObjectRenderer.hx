package pixi.core.renderers.webgl.utils;

import pixi.core.display.DisplayObject;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.renderers.webgl.managers.WebGLManager;

extern class ObjectRenderer extends WebGLManager {

	/**
	 * Base for a common object renderer that can be used as a system renderer plugin.
	 *
	 * @class
	 * @extends PIXI.WebGLManager
	 * @memberof PIXI
	 * @param renderer {PIXI.WebGLRenderer} The renderer this object renderer works for.
	 */
	function new(renderer:WebGLRenderer);

	/**
	 * Starts the renderer and sets the shader
	 *
	 */
	function start():Void;

	/**
	 * Stops the renderer
	 *
	 */
	function stop():Void;

	/**
	 * Stub method for rendering content and emptying the current batch.
	 *
	 */
	function flush():Void;

	/**
	 * Renders an object
	 *
	 * @param object {PIXI.DisplayObject} The object to render.
	 */
	function render(object:DisplayObject):Void;
}