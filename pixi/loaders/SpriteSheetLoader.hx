package pixi.loaders;

import pixi.textures.Texture;
import pixi.utils.EventTarget;

@:native("PIXI.SpriteSheetLoader")
extern class SpriteSheetLoader extends EventTarget {

    /**
     * The sprite sheet loader is used to load in JSON sprite sheet data
     * To generate the data you can use http://www.codeandweb.com/texturepacker and publish in the 'JSON' format
     * There is a free version so thats nice, although the paid version is great value for money.
     * It is highly recommended to use Sprite sheets (also know as a 'texture atlas') as it means sprites can be batched and drawn together for highly increased rendering speed.
     * Once the data has been loaded the frames are stored in the PIXI texture cache and can be accessed though PIXI.Texture.fromFrameId() and PIXI.Sprite.fromFrameId()
     * This loader will load the image file that the Spritesheet points to as well as the data.
     * When loaded this class will dispatch a 'loaded' event
     *
     * @class SpriteSheetLoader
     * @uses EventTarget
     * @constructor
     * @param url {String} The url of the sprite sheet JSON file
     * @param crossorigin {Bool} Whether requests should be treated as crossorigin
     */
	function new(url:String, ?crossorigin:Bool);

	/**
     * The url of the atlas data
     *
     * @property url
     * @type String
     */
	var url:String;

	/**
     * Whether the requests should be treated as cross origin
     *
     * @property crossorigin
     * @type Boolean
     */
	var crossorigin:Bool;

	/**
     * [read-only] The base url of the bitmap font data
     *
     * @property baseUrl
     * @type String
     * @readOnly
     */
	var baseUrl:String;

	/**
     * The texture being loaded
     *
     * @property texture
     * @type Texture
     */
	var texture:Texture;

	/**
     * The frames of the sprite sheet
     *
     * @property frames
     * @type Object
     */
	var frames:Dynamic;

    /**
	 * Parsed json response
	 */
    var json:Dynamic;

    /**
	 * Loads the SpriteSheet JSON data
	 *
	 * @method load
	 */
    function load():Void;
}