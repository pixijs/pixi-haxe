package pixi.display;

import pixi.filters.AbstractFilter;
import pixi.textures.VideoTexture;
import pixi.core.Matrix;
import pixi.core.Rectangle;
import pixi.textures.Texture;
import pixi.core.Point;

@:native("PIXI.Sprite")
extern class Sprite extends DisplayObjectContainer {

	/**
	 * The Sprite object is the base for all textured objects that are rendered to the screen
	 *
	 * @class Sprite
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param texture {Texture} The texture for this sprite
	 *
	 * A sprite can be created directly from an image like this :
	 * var sprite = new PIXI.Sprite.fromImage('assets/image.png');
	 * yourStage.addChild(sprite);
	 * then obviously don't forget to add it to the stage you have already created
	*/
	@:overload(function(texture:VideoTexture):Void {})
	function new(texture:Texture):Void;

	/**
     * The anchor sets the origin point of the texture.
     * The default is 0,0 this means the texture's origin is the top left
     * Setting than anchor to 0.5,0.5 means the textures origin is centered
     * Setting the anchor to 1,1 would mean the textures origin points will be the bottom right corner
     *
     * @property anchor
     * @type Point
     */
	var anchor:Point;

	/**
     * The texture that the sprite is using
     *
     * @property texture
     * @type Texture
     */
	var texture:Texture;

	/**
     * The tint applied to the sprite. This is a hex value. A value of 0xFFFFFF will remove any tint effect.
     *
     * @property tint
     * @type Int
     * @default 0xFFFFFF
     */
	var tint:Int;

	/**
     * The blend mode to be applied to the sprite. Set to PIXI.blendModes.NORMAL to remove any blend mode.
     *
     * @property blendMode
     * @type Int
     * @default PIXI.blendModes.NORMAL;
     */
	var blendMode:Int;

	/**
     * The shader that will be used to render the texture to the stage. Set to null to remove a current shader.
     *
     * @property shader
     * @type PIXI.AbstractFilter
     * @default null
     */
	var shader:AbstractFilter;

	/**
	 * Sets the texture of the sprite
	 *
	 * @method setTexture
	 * @param texture {Texture} The PIXI texture that is displayed by the sprite
	*/
	function setTexture(texture:Texture):Void;

	/**
	 *
	 * Helper function that creates a sprite that will contain a texture from the TextureCache based on the frameId
	 * The frame ids are created when a Texture packer file has been loaded
	 *
	 * @method fromFrame
	 * @static
	 * @param frameId {String} The frame Id of the texture in the cache
	 * @return {Sprite} A new Sprite using a texture from the texture cache matching the frameId
	*/
	static function fromFrame(frameId:String):Sprite;

	/**
	 * A short hand way of creating a movieclip from an array of image ids
	 *
	 * @static
	 * @method fromImage
	 * @param imageId {String}
	 * @param [crossorigin] {Bool}
	 * @param [scaleMode] {Int}
	 * @return {Sprite} A new Sprite using a texture from the texture cache matching the imageId
	*/
	static function fromImage(imageId:String, ?crossorigin:Bool, ?scaleMode:Int):Sprite;
}