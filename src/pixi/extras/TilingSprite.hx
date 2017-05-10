package pixi.extras;

import pixi.core.textures.BaseTexture;
import js.html.CanvasElement;
import js.html.VideoElement;
import pixi.core.display.TransformStatic;
import pixi.core.math.ObservablePoint;
import pixi.core.sprites.Sprite;
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
	 * @param width {Float} [width=100] the width of the tiling sprite
	 * @param height {Float} [height=100] the height of the tiling sprite
	 */
	function new(texture:Texture, ?width:Float, ?height:Float);

	/**
	 * Tile transform
	 *
	 * @member {TransformStatic}
	 */
	var tileTransform:TransformStatic;

	/**
	 * transform that is applied to UV to get the texture coords
	 *
	 * @member {TextureTransform}
	 */
	var uvTransform:TextureTransform;

	/**
	 * Whether or not anchor affects uvs
	 *
	 * @member {Bool}
	 * @default false
	 */
	var uvRespectAnchor:Bool;

	/**
	 * The scaling of the image that is being tiled
	 *
	 * @member {ObservablePoint}
	 */
	var tileScale:ObservablePoint;

	/**
	 * The offset position of the image that is being tiled
	 *
	 * @member {ObservablePoint}
	 */
	var tilePosition:ObservablePoint;

	/**
	 * Changes frame clamping in corresponding textureTransform, shortcut
	 * Change to -0.5 to add a pixel to the edge, recommended for transparent trimmed textures in atlas
	 * @default 0.5
	 */
	var clampMargin:Float;

	/**
     * Helper function that creates a new sprite based on the source you provide.
     * The source can be - frame id, image url, video url, canvas element, video element, base texture
     *
     * @static
     * @param {Int|String|BaseTexture|HTMLCanvasElement|HTMLVideoElement} source Source to create texture from
     * @param {Float} width - the width of the tiling sprite
     * @param {Float} height - the height of the tiling sprite
     * @return {TilingSprite} The newly created sprite
     */
	@:overload(function(source:Int):TilingSprite {})
	@:overload(function(source:String):TilingSprite {})
	@:overload(function(source:BaseTexture):TilingSprite {})
	@:overload(function(source:CanvasElement):TilingSprite {})
	@:overload(function(source:VideoElement):TilingSprite {})
	static function from(source:Dynamic, width:Float, height:Float):TilingSprite;

	/**
	* Helper function that creates a tiling sprite that will use a texture from the TextureCache based on the frameId
	* The frame ids are created when a Texture packer file has been loaded
	*
	* @static
	* @param {String} frameId - The frame Id of the texture in the cache
	* @param {Float} width - the width of the tiling sprite
	* @param {Float} height - the height of the tiling sprite
	* @return {TilingSprite} A new TilingSprite using a texture from the texture cache matching the frameId
	*/
	static function fromFrame(frameId:String, width:Float, height:Float):TilingSprite;

	/**
     * Helper function that creates a sprite that will contain a texture based on an image url
     * If the image is not in the texture cache it will be loaded
     *
     * @static
     * @param {String} imageId - The image url of the texture
     * @param {Float} width - the width of the tiling sprite
     * @param {Float} height - the height of the tiling sprite
     * @param {Bool} [crossorigin] - if you want to specify the cross-origin parameter
     * @param {Int} [scaleMode=PIXI.settings.SCALE_MODE] - if you want to specify the scale mode,
     *  see {@link PIXI.SCALE_MODES} for possible values
     * @return {TilingSprite} A new TilingSprite using a texture from the texture cache matching the image id
     */
	static function fromImage(imageId:String, width:Float, height:Float, ?crossorigin:Bool, ?scaleMode:Int):TilingSprite;
}
