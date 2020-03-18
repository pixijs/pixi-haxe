package pixi.filters.spritemask;

import pixi.core.math.Matrix;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.sprites.Sprite;

@:native("PIXI.SpriteMaskFilter")
extern class SpriteMaskFilter extends Filter {
	/**
	 * Mask matrix
	 */
	var maskMatrix:Matrix;

	/**
	 * Sprite Mask
	 */
	var maskSprite:Sprite;

	/**
	 * This handles a Sprite acting as a mask, as opposed to a Graphic. WebGL only.
	 * @param	sprite the target sprite
	 */
	function new(sprite:Sprite);
}
