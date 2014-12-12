package pixi.filters;

import pixi.geom.Point;
import pixi.textures.Texture;

@:native("PIXI.DisplacementFilter")
extern class DisplacementFilter {

	/**
	 * The DisplacementFilter class uses the pixel values from the specified texture (called the displacement map) to perform a displacement of an object.
	 * You can use this filter to apply all manor of crazy warping effects
	 * Currently the r property of the texture is used offset the x and the g property of the texture is used to offset the y.
	 *
	 * @class DisplacementFilter
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
	 * The multiplier used to scale the displacement result from the map calculation.
	 */
	var scale:Point;

	/**
	 * The offset used to move the displacement map.
	 */
	var offset:Point;

	/**
	 * Sets the map dimensions uniforms when the texture becomes available.
	 *
	 * @method onTextureLoaded
	 */
	function onTextureLoaded():Void;

}