package pixi.filters.displacement;

import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import pixi.core.renderers.webgl.filters.Filter;

@:native("PIXI.filters.DisplacementFilter")
extern class DisplacementFilter extends Filter {

	/**
	 * The DisplacementFilter class uses the pixel values from the specified texture (called the displacement map) to perform a displacement of an object.
	 * You can use this filter to apply all manor of crazy warping effects
	 * Currently the r property of the texture is used to offset the x and the g property of the texture is used to offset the y.
	 *
	 * @class
	 * @extends Filter
	 * @memberof PIXI.filters
	 * @param sprite {Sprite} the sprite used for the displacement map. (make sure its added to the scene!)
	 */
	function new(sprite:Sprite, ?scale:Float);

	/**
     * The texture used for the displacement map. Must be power of 2 sized texture.
     *
     * @member {Texture}
     * @memberof PIXI.filters.DisplacementFilter#
     */
	var map:Texture;
}