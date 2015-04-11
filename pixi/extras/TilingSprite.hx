package pixi.extras;

import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.sprites.Sprite;
import pixi.core.math.Point;
import pixi.core.textures.Texture;

@:native("PIXI.extras.TilingSprite")
extern class TilingSprite extends Sprite {

	/**
	 * A tiling sprite is a fast way of rendering a tiling image
	 *
	 * @class
	 * @extends Sprite
	 * @memberof PIXI.extras
	 * @param texture {Texture} the texture of the tiling sprite
	 * @param width {Float}  the width of the tiling sprite
	 * @param height {Float} the height of the tiling sprite
	 */
	function new(texture:Texture, width:Float, height:Float);

	/**
	 * The scaling of the image that is being tiled
	 *
	 * @member {Point}
	 */
	var tileScale:Point;

	/**
	 * The offset position of the image that is being tiled
	 *
	 * @member {Point}
	 */
	var tilePosition:Point;

	/**
	 * Creates the tiling texture
	 * @param renderer {CanvasRenderer|WebGLRenderer} a reference to the current renderer
	 * @param texture {Texture} The texture to use to generate the tiling texture
	 * @param forcePowerOfTwo {Bool} Whether we want to force the texture to be a power of two
	 */
	@:overload( function(renderer:WebGLRenderer, texture:Texture, forcePowerOfTwo:Bool):Void {})
	function generateTilingTexture(renderer:CanvasRenderer, texture:Texture, forcePowerOfTwo:Bool):Void;

	/**
	 * Checks if a point is inside this tiling sprite
	 * @param point {Point} the point to check
	 */
	function containsPoint(point:Point):Bool;
}