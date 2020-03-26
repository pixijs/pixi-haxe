package pixi.core.renderers.systems;

import pixi.core.Pixi.GCModes;
import pixi.core.display.DisplayObject;
import pixi.core.renderers.webgl.Renderer;

@:native("PIXI.systems.TextureGCSystem")
extern class TextureGCSystem extends System {
	/**
	 * Check count
	 */
	var checkCount(default, null):Int;

	/**
	 * Maximum number of item to check
	 */
	var checkCountMax:Int;

	/**
	 * Count
	 */
	var count(default, null):Int;

	/**
	 * Maximum idle time, in seconds
	 */
	var maxIdle:Float;

	/**
	 * Current garabage collection mode
	 */
	var mode:GCModes;

	/**
	 * System plugin to the renderer to manage texture garbage collection on the GPU, ensuring that it does not get clogged up with textures that are no longer being used.
	 * @param	renderer The renderer this system works for
	 */
	function new(renderer:Renderer);

	/**
	 * Checks to see when the last time a texture was used if the texture has not been used for a specified amount of time it will be removed from the GPU
	 */
	function postrender():Void;

	/**
	 * Checks to see when the last time a texture was used if the texture has not been used for a specified amount of time it will be removed from the GPU
	 */
	function run():Void;

	/**
	 * Removes all the textures within the specified displayObject and its children from the GPU
	 * @param	displayObject the displayObject to remove the textures from.
	 */
	function unload(displayObject:DisplayObject):Void;
}
