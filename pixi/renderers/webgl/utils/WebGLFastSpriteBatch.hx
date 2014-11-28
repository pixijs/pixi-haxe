package pixi.renderers.webgl.utils;

import pixi.display.Sprite;
import pixi.renderers.webgl.utils.WebGLSpriteBatch;
import pixi.core.Matrix;
import pixi.textures.BaseTexture;

@:native("PIXI.WebGLFastSpriteBatch")
extern class WebGLFastSpriteBatch {

	/**
	 * @class WebGLFastSpriteBatch
	 */
	function new();

	/**
     * @property vertSize
     * @type Number
     */
	var vertSize:Int;

	/**
     * @property maxSize
     * @type Number
     */
	var maxSize:Float;//Math.pow(2, 16) /  this.vertSize;

	/**
     * @property size
     * @type Number
     */
	var size:Float;

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
	var indices:Array<Int>;

	/**
     * @property vertexBuffer
     * @type Object
     */
	var vertexBuffer:Dynamic;

	/**
     * @property indexBuffer
     * @type Object
     */
	var indexBuffer:Dynamic;

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
     * @property currentBlendMode
     * @type Number
     */
	var currentBlendMode:Int;

	/**
     * @property renderSession
     * @type Object
     */
	var renderSession:Dynamic;

	/**
     * @property shader
     * @type Object
     */
	var shader:Dynamic;

	/**
     * @property matrix
     * @type Matrix
     */
	var matrix:Matrix;

	/**
	 * Sets the WebGL Context.
	 *
	 * @method setContext
	 * @param gl {WebGLContext} the current WebGL drawing context
	 */
	function setContext(gl:Dynamic):Void;

	/**
	 * @method begin
	 * @param spriteBatch {WebGLSpriteBatch}
	 * @param renderSession {Object}
	 */
	function begin(spriteBatch:WebGLSpriteBatch, renderSession:Dynamic):Void;

	/**
	* @method end
	*/
	function end():Void;

	/**
	 * @method render
	 * @param spriteBatch {WebGLSpriteBatch}
	 */
	function render(spriteBatch:WebGLSpriteBatch):Void;

	/**
	 * @method renderSprite
	 * @param sprite {Sprite}
	 */
	function renderSprite(sprite:Sprite):Void;

	/**
	* Renders the content and empties the current batch.
	*
	* @method flush
	*/
	function flush():Void;

	/**
	* @method stop
	*/
	function stop():Void;

	/**
	* @method start
	*/
	function start():Void;
}