package pixi.core.renderers.webgl.extract;
import js.html.CanvasElement;
import js.html.ImageElement;
import js.html.Uint8ClampedArray;
import pixi.core.display.DisplayObject;
import pixi.core.renderers.webgl.WebGLRenderer;
import pixi.core.textures.RenderTexture;
import haxe.extern.EitherType;

/**
 * The extract manager provides functionality to export content from the renderers.
 * 
 * An instance of this class is automatically created by default, and can be found at renderer.plugins.extract
 */
@:native("PIXI.extract.WebGLExtract")
extern class WebGLExtract 
{

	/**
     * Creates WebGLExtract
     *
     * @param {PIXI.WebGLRenderer} renderer - A reference to the current renderer 
     */
	public function new(renderer:WebGLRenderer);	

	/**
     * Will return a a base64 encoded string of this target. It works by calling WebGLExtract.getCanvas and then running toDataURL on that.
     *
     * @param {PIXI.DisplayObject | PIXI.RenderTexture} target - A displayObject or renderTexture to convert. If left empty will use the main renderer
	 * @return {String} A base64 encoded string of the texture.
     */
	public function base64(?target:EitherType<DisplayObject, RenderTexture>):String;
	
	/**
     * Creates a Canvas element, renders this target to it and then returns it.
     *
     * @param {PIXI.DisplayObject | PIXI.RenderTexture} target - A displayObject or renderTexture to convert. If left empty will use the main renderer
	 * @return {HTMLCanvasElement} A Canvas element with the texture rendered on.
     */
	public function canvas(?target:EitherType<DisplayObject, RenderTexture>):CanvasElement;
	
	/**
     * Will return a HTML Image of the target
     *
     * @param {PIXI.DisplayObject | PIXI.RenderTexture} target - A displayObject or renderTexture to convert. If left empty will use the main renderer
	 * @return {HTMLImageElement} HTML Image of the target
     */
	public function image(?target:EitherType<DisplayObject, RenderTexture>):ImageElement;
	
	/**
     * Will return a one-dimensional array containing the pixel data of the entire texture in RGBA order, with integer values between 0 and 255 (included).
     *
     * @param {PIXI.DisplayObject | PIXI.RenderTexture} target - A displayObject or renderTexture to convert. If left empty will use the main renderer
	 * @return {Uint8ClampedArray} One-dimensional array containing the pixel data of the entire texture
     */
	public function pixels(?target:EitherType<DisplayObject, RenderTexture>):Uint8ClampedArray;
	
	/**
	 * Destroys the extract
	 */
	public function destroy():Void;
	
	
}