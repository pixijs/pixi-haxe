package pixi.core.sprites;

import pixi.core.Pixi.BlendModes;
import pixi.core.renderers.webgl.filters.Filter;
import js.html.VideoElement;
import js.html.CanvasElement;
import pixi.core.textures.BaseTexture;
import pixi.core.math.ObservablePoint;
import haxe.extern.EitherType;
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
	 * @member {ObservablePoint}
	 */
	var anchor:ObservablePoint;

	/**
     * The texture that the sprite is using
     *
     * @member {Texture}
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
	var blendMode:BlendModes;

	/**
	 * The shader that will be used to render the sprite. Set to null to remove a current shader.
	 *
	 * @member {Shader|Filter}
	 */
	var shader:EitherType<Shader, Filter>;

	/**
	 * Plugin that is responsible for rendering this element.
	 * Allows to customize the rendering process without overriding '_renderWebGL' & '_renderCanvas' methods.
	 *
	 * @member {String}
	 * @default 'sprite'
	 */
	var pluginName:String;

	/**
     * Tests if a point is inside this sprite
     *
     * @param {Point} point - the point to test
     * @return {Bool} the result of the test
     */
	function containsPoint(point:Point):Bool;

	/**
     * Helper function that creates a new sprite based on the source you provide.
     * The source can be - frame id, image url, video url, canvas element, video element, base texture
     *
     * @static
     * @param {Int|String|BaseTexture|HTMLCanvasElement|HTMLVideoElement} source Source to create texture from
     * @return {Sprite} The newly created sprite
     */
	@:overload(function(source:Int):Sprite {})
	@:overload(function(source:String):Sprite {})
	@:overload(function(source:BaseTexture):Sprite {})
	@:overload(function(source:CanvasElement):Sprite {})
	@:overload(function(source:VideoElement):Sprite {})
	static function from(source:Dynamic):Sprite;

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
