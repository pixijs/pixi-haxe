package pixi.core.renderers.systems;

import js.html.webgl.RenderingContext;
import pixi.core.Pixi.BlendModes;
import pixi.core.display.DisplayObject;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.State;
import pixi.core.renderers.webgl.UniformGroup;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.renderers.webgl.utils.ObjectRenderer;
import pixi.core.sprites.Sprite;
import pixi.core.textures.RenderTexture;

@:native("PIXI.systems.BatchSystem")
extern class BatchSystem extends System {
	/**
	 * The currently active ObjectRenderer.
	 */
	var currentRenderer:ObjectRenderer;

	/**
	 * An empty renderer.
	 */
	var emptyRenderer:ObjectRenderer;

	/**
	 * System plugin to the renderer to manage batching.
	 * @param	renderer The renderer this manager works for.
	 */
	function new(renderer:Renderer);

	/**
	 * This should be called if you wish to do some custom rendering It will basically render anything that may be batched up such as sprites
	 */
	function flush():Void;

	/**
	 * Reset the system to an empty renderer
	 */
	function reset():Void;

	/**
	 * Changes the current renderer to the one given in parameter
	 * @param	objectRenderer The object renderer to use.
	 */
	function setObjectRenderer(objectRenderer:ObjectRenderer):Void;
}
