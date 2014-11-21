package pixi.renderers.webgl.utils;

import pixi.extras.TilingSprite;
import pixi.filters.AbstractFilter;
import pixi.display.Sprite;
import pixi.textures.Texture;
import pixi.textures.BaseTexture;
@:native("PIXI.WebGLSpriteBatch")
extern class WebGLSpriteBatch {

	/**
	 * @class WebGLSpriteBatch
	 */
	function new();

	/**
     * @property vertSize
     * @type Number
     */
	var vertSize:Int;

	/**
     * The number of images in the SpriteBatch before it flushes
     * @property size
     * @type Number
     */
	var size:Float; //Math.pow(2, 16) /  this.vertSize;

	/**
    * Holds the vertices
    *
    * @property vertices
    * @type Float32Array
    */
	var vertices:Array<Float>;

	/**
     * Holds the indices
     *
     * @property indices
     * @type Uint16Array
     */
	var indices:Array<UInt>;

	/**
     * @property lastIndexCount
     * @type Number
     */
	var lastIndexCount:Int;

	/**
     * @property drawing
     * @type Boolean
     */
	var drawing:Bool;

	/**
     * @property currentBatchSize
     * @type Number
     */
	var currentBatchSize:Float;

	/**
     * @property currentBaseTexture
     * @type BaseTexture
     */
	var currentBaseTexture:BaseTexture;

	/**
     * @property dirty
     * @type Boolean
     */
	var dirty:Bool;

	/**
     * @property textures
     * @type Array
     */
	var textures:Array<Texture>;

	/**
     * @property blendModes
     * @type Array
     */
	var blendModes:Array<Dynamic>;

	/**
     * @property shaders
     * @type Array
     */
	var shaders:Array<Dynamic>;

	/**
     * @property sprites
     * @type Array
     */
	var sprites:Array<Sprite>;

	/**
     * @property defaultShader
     * @type AbstractFilter
     */
	var defaultShader:AbstractFilter;

	/**
	* @method setContext
	* @param gl {WebGLContext} the current WebGL drawing context
	*/
	function setContext(gl:Dynamic):Void;

	/**
	* @method begin
	* @param renderSession {Object} The RenderSession object
	*/
	function begin(renderSession:Dynamic):Void;

	/**
	* @method end
	*/
	function end():Void;

	/**
	* @method render
	* @param sprite {Sprite} the sprite to render when using this spritebatch
	*/
	function render(sprite:Sprite):Void;

	/**
	* Renders a TilingSprite using the spriteBatch.
	*
	* @method renderTilingSprite
	* @param tilingSprite {TilingSprite} the tilingSprite to render
	*/
	function renderTilingSprite(tilingSprite:TilingSprite):Void;

	/**
	* Renders the content and empties the current batch.
	*
	* @method flush
	*/
	function flush():Void;

	/**
	* @method renderBatch
	* @param texture {Texture}
	* @param size {Number}
	* @param startIndex {Number}
	*/
	function renderBatch(texture:Texture, size:Float, startIndex:Int):Void;

	/**
	* @method stop
	*/
	function stop():Void;

	/**
	* @method start
	*/
	function start():Void;

	/**
	* Destroys the SpriteBatch.
	*
	* @method destroy
	*/
	function destroy():Void;
}