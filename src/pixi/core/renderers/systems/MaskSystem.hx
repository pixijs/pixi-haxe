package pixi.core.renderers.systems;

import haxe.extern.EitherType;
import pixi.core.display.DisplayObject;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.sprites.Sprite;
import pixi.core.graphics.Graphics;
import pixi.filters.spritemask.SpriteMaskFilter;

@:native("PIXI.systems.MaskSystem")
extern class MaskSystem extends System {
	/**
	 * Current index of alpha mask pool
	 */
	var alphaMaskIndex(default, null):Int;

	/**
	 * Pool of used sprite mask filters
	 * @param	renderer
	 */
	var alphaMaskPool(default, null):Array<SpriteMaskFilter>;

	/**
	 * Enable scissor
	 */
	var enableScissor(default, null):Bool;

	/**
	 * true if current pushed masked is scissor
	 */
	var scissor(default, null):Bool;

	/**
	 * Mask data
	 */
	var scissorData(default, null):Graphics;

	/**
	 * Target to mask
	 */
	var scissorRenderTarget:DisplayObject;

	/**
	 * System plugin to the renderer to manage WebGL state machines.
	 * @param	renderer The renderer this manager works for
	 */
	function new(renderer:Renderer);

	/**
	 * Removes the last mask from the mask stack and doesn't return it.
	 * @param	target Display Object to pop the mask from
	 * @param	maskData The masking data.
	 */
	function pop(target:DisplayObject, maskData:EitherType<Sprite, Graphics>):Void;

	/**
	 * Pop scissor mask
	 */
	function popScissorMask():Void;

	/**
	 * Removes the last filter from the filter stack and doesn't return it.
	 */
	function popSpriteMas():Void;

	/**
	 * Removes the last filter from the filter stack and doesn't return it.
	 */
	function popStencilMask():Void;

	/**
	 * Applies the Mask and adds it to the current filter stack.
	 * @param	target Display Object to push the mask to
	 * @param	maskData The masking data.
	 */
	function push(target:DisplayObject, maskData:EitherType<Sprite, Graphics>):Void;

	/**
	 *
	 * @param	target Display Object to push the mask to
	 * @param	maskData The masking data.
	 */
	function pushScissorMask(target:DisplayObject, maskData:Graphics):Void;

	/**
	 * Applies the Mask and adds it to the current filter stack.
	 * @param	target Display Object to push the sprite mask to
	 * @param	maskData Sprite to be used as the mask
	 */
	function pushSpriteMask(target:DisplayObject, maskData:Sprite):Void;

	/**
	 * Applies the Mask and adds it to the current filter stack.
	 * @param	maskData The masking data.
	 */
	function pushStencilMask(maskData:EitherType<Sprite, Graphics>):Void;
}
