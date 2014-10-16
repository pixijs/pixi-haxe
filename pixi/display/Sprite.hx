package pixi.display;

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
	function new(texture:Dynamic):Void;

	/**
	 * The anchor sets the origin point of the texture.
	 * The default is 0,0 this means the texture's origin is the top left
	 * Setting than anchor to 0.5,0.5 means the textures origin is centred
	 * Setting the anchor to 1,1 would mean the textures origin points will be the bottom right corner
	*/
	var anchor:Point;
	
	/**
	 * The texture that the sprite is using
	*/
	var texture:Dynamic;
	
	/**
	 * The tint applied to the sprite. This is a hex value
	 */
	var tint:Float;
	
	/**
	 * The blend mode to be applied to the sprite
	*/
	var blendMode:Float;

	/**
	 * Sets the texture of the sprite
	 *
	 * @method setTexture
	 * @param texture {Texture} The PIXI texture that is displayed by the sprite
	*/
	function setTexture(texture:Dynamic):Void;

	/**
	 * When the texture is updated, this event will fire to update the scale and frame
	 *
	 * @method onTextureUpdate
	 * @param event
	 * @private
	*/
	function onTextureUpdate():Void;

	/**
	 * Returns the framing rectangle of the sprite as a PIXI.Rectangle object
	 *
	 * @method getBounds
	 * @param matrix {Matrix} the transformation matrix of the sprite
	 * @return {Rectangle} the framing rectangle
	 */
	override function getBounds(matrix:Dynamic):Dynamic;

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
	static function fromFrame(frameId:String):Dynamic;

	/**
	 * A short hand way of creating a movieclip from an array of image ids
	 *
	 * @static
	 * @method fromImage
	 * @param imageId {String}
	*/
	static function fromImage(imageId:String, ?crossorigin:Dynamic, ?scaleMode:Dynamic):Dynamic;

}