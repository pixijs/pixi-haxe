package pixi.core.sprites;

import pixi.core.math.Point;
import pixi.core.textures.Texture;
import pixi.core.display.Container;

@:native("PIXI.Sprite")
extern class Sprite extends Container {

	/**
	 * The Sprite object is the base for all textured objects that are rendered to the screen
	 *
	 * A sprite can be created directly from an image like this:
	 *
	 * ```haxe
	 * 	var sprite = new Sprite.fromImage('assets/image.png');
	 * ```
	 *
	 * @class Sprite
	 * @extends Container
	 * @namespace PIXI
	 * @param texture {Texture} The texture for this sprite
	 */
	function new(?texture:Texture);

	/**
	 * The anchor sets the origin point of the texture.
	 * The default is 0,0 this means the texture's origin is the top left
	 * Setting than anchor to 0.5,0.5 means the textures origin is centered
	 * Setting the anchor to 1,1 would mean the textures origin points will be the bottom right corner
	 *
	 * @member {Point}
	 */
	var anchor:Point;

	/**
	 * The height of the sprite, setting this will actually modify the scale to achieve the value set
	 *
	 * @member
	 * @memberof Sprite#
	 */
	var texture:Texture;

	/**
	 * The tint applied to the sprite. This is a hex value. A value of 0xFFFFFF will remove any tint effect.
	 *
	 * @member {Int}
	 * @default 0xFFFFFF
	 */
	var tint:Int;

	/**
	 * The blend mode to be applied to the sprite. Set to CONST.blendModes.NORMAL to remove any blend mode.
	 *
	 * @member {Int}
	 * @default CONST.blendModes.NORMAL;
	 */
	var blendMode:Int;

	/**
	 * The shader that will be used to render the sprite. Set to null to remove a current shader.
	 *
	 * @member {AbstractFilter}
	 */
	var shader:Dynamic;

	/**
	* Renders the object using the Canvas renderer
	*
	* @param renderer {CanvasRenderer} The renderer
	*/
	function renderCanvas(renderer:Dynamic):Void;

	/**
	 * Helper function that creates a new sprite based on the source you provide.
	 * The soucre can be - frame id, image url, video url, canvae element, video element, base texture
	 *
	 * @static
	 * @param source {}
	 * @return {Sprite} A Texture
	 */
	function from(source:Dynamic):Sprite;

	/**
	 * Helper function that creates a sprite that will contain a texture from the TextureCache based on the frameId
	 * The frame ids are created when a Texture packer file has been loaded
	 *
	 * @static
	 * @param frameId {String} The frame Id of the texture in the cache
	 * @return {Sprite} A new Sprite using a texture from the texture cache matching the frameId
	 */
	static function fromFrame(frameId:String):Sprite;

	/**
	 * Helper function that creates a sprite that will contain a texture based on an image url
	 * If the image is not in the texture cache it will be loaded
	 *
	 * @static
	 * @param imageId {String} The image url of the texture
	 * @return {Sprite} A new Sprite using a texture from the texture cache matching the image id
	 */
	static function fromImage(imageId:String, ?crossorigin:Bool, ?scaleMode:Int):Sprite;
}
