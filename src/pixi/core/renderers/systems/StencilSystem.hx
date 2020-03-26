package pixi.core.renderers.systems;

import pixi.core.graphics.Graphics;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.systems.System;

@:native("PIXI.systems.StencilSystem")
extern class StencilSystem extends System {
	/**
	 * System plugin to the renderer to manage stencils (used for masks).
	 * @param	renderer
	 */
	function new(renderer:Renderer);

	/**
	 * The mask stack
	 */
	var stencilMaskStack:Array<Graphics>;

	/**
	 * Removes the last mask from the stencil stack.
	 */
	function popStencil():Void;

	/**
	 * Applies the Mask and adds it to the current stencil stack.
	 * @param	graphics The mask
	 */
	function pushStencil(graphics:Graphics):Void;

	/**
	 * Changes the mask stack that is used by this System.
	 * @param	stencilMaskStack
	 */
	function setMaskStack(stencilMaskStack:Array<Graphics>):Void;
}
