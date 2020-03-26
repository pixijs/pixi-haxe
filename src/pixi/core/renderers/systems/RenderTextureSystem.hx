package pixi.core.renderers.systems;

import haxe.extern.EitherType;
import pixi.core.display.DisplayObject;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.sprites.Sprite;
import pixi.core.graphics.Graphics;
import pixi.core.textures.RenderTexture;
import pixi.filters.spritemask.SpriteMaskFilter;

@:native("PIXI.systems.RenderTextureSystem")
extern class RenderTextureSystem extends System {
	/**
	 * The clear background color as rgba
	 */
	var clearColor:Array<Int>;

	/**
	 * Render texture
	 */
	var current(default, null):RenderTexture;

	/**
	 * List of masks for the StencilSystem
	 */
	var defaultMaskStack(default, null):Array<Graphics>;

	/**
	 * Destination frame
	 */
	var destinationFrame(default, null):Rectangle;

	/**
	 * Source frame
	 */
	var sourceFrame(default, null):Rectangle;

	/**
	 * System plugin to the renderer to manage render textures.
	 * Should be added after FramebufferSystem
	 * @param	renderer The renderer this manager works for
	 */
	function new(renderer:Renderer);

	/**
	 * Bind the current render texture
	 * @param	renderTexture RenderTexture to bind, by default its null, the screen
	 * @param	sourceFrame part of screen that is mapped to the renderTexture
	 * @param	destinationFrame part of renderTexture, by default it has the same size as sourceFrame
	 */
	function bind(?renderTexture:RenderTexture, ?sourceFrame:Rectangle, ?destinationFrame:Rectangle):Void;

	/**
	 * Erases the render texture and fills the drawing area with a colour
	 * @param	clearColor The color as rgba, default to use the renderer backgroundColor
	 * @return Returns itself.
	 */
	function clear(?clearColor:Array<Int>):Renderer;
}
