package pixi.display;

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
	public function new(texture:Dynamic):Void;

	/**
	 * The width of the sprite, setting this will actually modify the scale to achieve the value set
	 *
	 * @property width
	 * @type Number
	*/
	public var width:Float;

	/**
	 * The height of the sprite, setting this will actually modify the scale to achieve the value set
	 *
	 * @property height
	 * @type Number
	*/
	public var height:Float;

	/**
	 * Sets the texture of the sprite
	 *
	 * @method setTexture
	 * @param texture {Texture} The PIXI texture that is displayed by the sprite
	*/
	public function setTexture(texture:Dynamic):Void;

	/**
	 * When the texture is updated, this event will fire to update the scale and frame
	 *
	 * @method onTextureUpdate
	 * @param event
	 * @private
	*/
	public function onTextureUpdate():Void;

	/**
	 * Returns the framing rectangle of the sprite as a PIXI.Rectangle object
	 *
	 * @method getBounds
	 * @param matrix {Matrix} the transformation matrix of the sprite
	 * @return {Rectangle} the framing rectangle
	 */
	public function getBounds(matrix:Dynamic):Dynamic;

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
	public static function fromFrame(frameId:String):Dynamic;

	/**
	 * A short hand way of creating a movieclip from an array of image ids
	 *
	 * @static
	 * @method fromFrames
	 * @param frames {Array} the array of image ids the movieclip will use as its texture frames
	*/
	public static function fromImage(imageId:String, crossorigin:Dynamic, scaleMode:Dynamic):Dynamic;

}