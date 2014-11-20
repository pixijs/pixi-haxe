package pixi.filters;

import pixi.textures.Texture;

@:native("PIXI.AlphaMaskFilter")
extern class AlphaMaskFilter extends AbstractFilter {

	/**
	 * The AlphaMaskFilter class uses the pixel values from the specified texture (called the displacement map) to perform a displacement of an object.
	 * You can use this filter to apply all manor of crazy warping effects
	 * Currently the r property of the texture is used to offset the x and the g property of the texture is used to offset the y.
	 *
	 * @class AlphaMaskFilter
	 * @extends AbstractFilter
	 * @constructor
	 * @param texture {Texture} The texture used for the displacement map * must be power of 2 texture at the moment
	 */
	function new(texture:Texture):Void;

	/**
	 * The texture used for the displacemtent map * must be power of 2 texture at the moment
	 */
	var map:Texture;

	/**
	 * Sets the map dimensions uniforms when the texture becomes available.
	 *
	 * @method onTextureLoaded
	 */
	function onTextureLoaded():Void;

}