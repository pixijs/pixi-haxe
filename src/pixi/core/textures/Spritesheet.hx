package pixi.core.textures;
import haxe.DynamicAccess;

/**
 * Utility class for maintaining reference to a collection of Textures
 * on a single Spritesheet.
 * 
 * With the sheet.textures you can create Sprite objects,sheet.animations
 *  can be used to create an AnimatedSprite.
 * 
 * Sprite sheets can be packed using tools like TexturePacker, Shoebox 
 * or Spritesheet.js. Default anchor points (see PIXI.Texture#defaultAnchor) 
 * and grouping of animation sprites are currently only supported by TexturePacker.
 */
@:native("PIXI.Spritesheet")
extern class Spritesheet {
	static var BATCH_SIZE:Int;

	/**
	* @param {PIXI.BaseTexture} baseTexture Reference to the source BaseTexture object.
	* @param {Object} data - Spritesheet image data.
	* @param {String} [resolutionFilename] - The filename to consider when determining
	*        the resolution of the spritesheet. If not provided, the imageUrl will
	*        be used on the BaseTexture.
	*/
	function new(baseTexture:BaseTexture, data:Dynamic, ?resolutionFilename:String = null);

	/**
	 * Reference to ths source texture
	 * @type {PIXI.BaseTexture}
	 */
	var baseTexture:BaseTexture;

	/**
	 * Map of spritesheet textures.
	 * @type {Object}
	 */
	var textures:DynamicAccess<Texture>;

	/**
	 * Reference to the original JSON data.
	 * @type {Object}
	 */
	var data:Dynamic;

	/**
	 * A map containing the textures for each animation. Can be used to create an AnimatedSprite.
	 */
	var animations:Dynamic;

	/**
	 * The resolution of the spritesheet.
	 * @type {Float}
	 */
	var resolution:Float;

	/**
	* Parser spritesheet from loaded data. This is done asynchronously
	* to prevent creating too many Texture within a single process.
	*
	* @param {Function} callback - Callback when complete returns
	*        a map of the Textures for this spritesheet.
	*/
	function parse(callback:Dynamic):Void;

	/**
	* Destroy Spritesheet and don't use after this.
	*
	* @param {Bool} [destroyBase=false] Whether to destroy the base texture as well
	*/
	function destroy(?destroyBase:Bool = false):Void;
}