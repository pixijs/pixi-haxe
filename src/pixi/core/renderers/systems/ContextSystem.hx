package pixi.core.renderers.systems;

import js.html.webgl.ContextEvent;
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

@:native("PIXI.systems.ContextSystem")
extern class ContextSystem extends System {
	/**
	 * true if the context is lost
	 */
	var isLost(default, null):Bool;

	/**
	 * Either 1 or 2 to reflect the WebGL version being used
	 */
	var webGLVersion(default, null):Int;

	/**
	 * System plugin to the renderer to manage the context.
	 * @param	renderer The renderer this manager works for.
	 */
	function new(renderer:Renderer);

	/**
	 * Handle the context change event
	 * @param	gl new webgl context
	 */
	function contextChange(gl:RenderingContext):Void;

	/**
	 * Auto-populate the extensions
	 */
	private function getExtensions():Void;

	/**
	 * Handles a lost webgl context
	 * @param	event The context lost event.
	 */
	private function handleContextLost(event:ContextEvent):Void;

	/**
	 * Handles a restored webgl context
	 */
	private function handleContextRestored():Void;

	/**
	 * Initialize the context
	 * @param	gl WebGL context
	 */
	private function initFromContext(gl:RenderingContext):Void;

	/**
	 * Initialize from context options
	 * @param	options context attributes. See https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement/getContext
	 */
	private function initFromOptions(options:Dynamic):Void;

	/**
	 * Handle the post-render runner event
	 */
	private function postrender():Void;

	/**
	 * Validate context
	 * @param	gl Render context
	 */
	private function validateContext(gl:RenderingContext):Void;
}
