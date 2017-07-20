package pixi.core.renderers;
import haxe.Constraints.Function;
import pixi.core.display.Container;
import pixi.core.display.DisplayObject;
import pixi.core.graphics.Graphics;
import pixi.core.renderers.SystemRenderer;
import pixi.core.text.Text;
import pixi.core.textures.BaseTexture;
import pixi.core.textures.Texture;
import haxe.extern.EitherType;

typedef Uplodable = 
	EitherType<Text,
	EitherType<Graphics,
	EitherType<Texture,
	EitherType<BaseTexture,
	EitherType<Container,
			   DisplayObject
			   >>>>>;

/**
 * The prepare manager provides functionality to upload content to the GPU.
 * BasePrepare handles basic queuing functionality and is extended by PIXI.prepare.WebGLPrepare and PIXI.prepare.CanvasPrepare
 * to provide preparation capabilities specific to their respective renderers.
 */
@:native("PIXI.prepare.BasePrepare")
extern class BasePrepare
{
	/**
	 * Creates BasePrepare
	 * @param {PIXI.SystemRenderer} renderer - A reference to the current renderer
	 */
	public function new(renderer:SystemRenderer);
		
	
	/**
	 * Manually add an item to the uploading queue.
	 * @param {	PIXI.DisplayObject | PIXI.Container | PIXI.BaseTexture | PIXI.Texture | PIXI.Graphics | PIXI.Text } item Object to add to the queue
	 * @return {PIXI.CanvasPrepare | PIXI.WebGLPrepare} Instance of plugin for chaining.
	 */
	public function add(item:Uplodable):BasePrepare;
	
	/**
	 * @deprecated since 4.4.2
	 * 
	 * Register hooks	 
	 * @param {	function } addHook - Function call that takes two parameters: item:*, queue:Array function must return true if it was able to add item to the queue.
	 * @param {	function } uploadHook -  Function call that takes two parameters: prepare:CanvasPrepare, item:* and function must return true if it was able to handle upload of item.
	 * @return {PIXI.CanvasPrepare | PIXI.WebGLPrepare} Instance of plugin for chaining.
	 */	
	public function register(?addHoook:Function, ?uploadHook:Function):BasePrepare;
	
	
	/**	 
	 * Register find hook	 
	 * @param {	function } addHook - Function call that takes two parameters: item:*, queue:Array function must return true if it was able to add item to the queue.	 
	 * @return {PIXI.CanvasPrepare | PIXI.WebGLPrepare} Instance of plugin for chaining.
	 */	
	public function registerFindHook(addHook:Function):BasePrepare;
		
	
	/**	 
	 * Register upload hook	 
	 * @param {	function } uploadHook -  Function call that takes two parameters: prepare:CanvasPrepare, item:* and function must return true if it was able to handle upload of item.
	 * @return {PIXI.CanvasPrepare | PIXI.WebGLPrepare} Instance of plugin for chaining.
	 */	
	public function registerUploadHook(uploadHook:Function):BasePrepare;
		
	/**
	 * Upload all the textures and graphics to the GPU.
	 * @param {	PIXI.DisplayObject | PIXI.Container | PIXI.BaseTexture | PIXI.Texture | PIXI.Graphics | PIXI.Text | * } Either the container or display object to search for items to upload, the items to upload themselves, or the callback function, if items have been added using prepare.add
	 * @param { function } done Optional callback when all queued uploads have completed
	 * @return {PIXI.CanvasPrepare | PIXI.WebGLPrepare} Instance of plugin for chaining.
	 */
	public function upload(?item:Uplodable, ?done:Void->Void):BasePrepare;
	
	
	
	/**
	 * Destroys the plugin, don't use after this.
	 */
	public function destroy():Void;
}