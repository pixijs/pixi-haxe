package pixi.core.renderers;

import js.html.CanvasElement;
import pixi.core.Pixi.RendererType;
import pixi.core.Pixi.ScaleModes;
import pixi.core.RenderOptions;
import pixi.core.display.DisplayObject;
import pixi.core.math.shapes.Rectangle;
import pixi.core.textures.RenderTexture;
import pixi.interaction.EventEmitter;

@:native("PIXI.AbstractRenderer")
extern class AbstractRenderer extends EventEmitter {
	/**
	 * The AbstractRenderer is the base for a PixiJS Renderer. It is extended by the PIXI.CanvasRenderer and PIXI.Renderer which can be used for rendering a PixiJS scene.
	 * @param	system The name of the system this renderer is for.
	 * @param	options The optional renderer parameters.
	 */
	public function new(system:String, ?options:RenderOptions);

	/**
	 * The background color as a number.
	 */
	private var _backgroundColor:Int;

	/**
	 * The background color as an [R, G, B] array.
	 */
	private var _backgroundColorRgba:Array<Int>;

	/**
	 * The background color as a string.
	 */
	private var _backgroundColorString:String;

	/**
	 * The last root object that the renderer tried to render.
	 */
	private var _lastObjectRendered:DisplayObject;

	/**
	 * This temporary display object used as the parent of the currently being rendered item.
	 */
	private var _tempDisplayObjectParent:DisplayObject;

	/**
	 * Whether CSS dimensions of canvas view should be resized to screen dimensions automatically.
	 */
	private var autoDensity:Bool;

	/**
	 * The background color to fill if not transparent
	 */
	var backgroundColor:Int;

	/**
	 * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
	 * If the scene is NOT transparent PixiJS will use a canvas sized fillRect operation every
	 * frame to set the canvas background color. If the scene is transparent PixiJS will use
	 * clearRect to clear the canvas every frame. Disable this by setting this to false. For
	 * example, if your game has a canvas filling background image you often don't need this set.
	 */
	var clearBeforeRender:Bool;

	/**
	 * Same as view.height, actual number of pixels in the canvas by vertical.
	 */
	var height(default, null):Float;

	/**
	 * The supplied constructor options.
	 */
	var options(default, null):RenderOptions;

	/**
	 * Collection of plugins.
	 */
	var plugins(default, null):Dynamic;

	/**
	 * The value of the preserveDrawingBuffer flag affects whether or not the contents of the stencil buffer is retained after rendering.
	 */
	var preserveDrawingBuffer:Bool;

	/**
	 * The resolution / device pixel ratio of the renderer.
	 */
	var resolution:Float;

	/**
	 * Measurements of the screen. (0, 0, screenWidth, screenHeight).
	 * Its safe to use as filterArea or hitArea for the whole stage.
	 */
	var screen:Rectangle;

	/**
	 * Whether the render view is transparent.
	 */
	var transparent:Bool;

	/**
	 * The type of the renderer.
	 */
	var type:RendererType;

	/**
	 * The canvas element that everything is drawn to.
	 */
	var view:CanvasElement;

	/**
	 * Same as view.width, actual number of pixels in the canvas by horizontal.
	 */
	var width(default, null):Float;

	/**
	 * Removes everything from the renderer and optionally removes the Canvas DOM element.
	 * @param	removeView Removes the Canvas element from the DOM.
	 */
	function destroy(?removeView:Bool = false):Void;

	/**
	 * Useful function that returns a texture of the display object that can then be used to create sprites This can be quite useful if your displayObject is complicated and needs to be reused multiple times.
	 * @param	displayObject The displayObject the object will be generated from.
	 * @param	scaleMode Should be one of the scaleMode consts.
	 * @param	resolution The resolution / device pixel ratio of the texture being generated.
	 * @param	region The region of the displayObject, that shall be rendered, if no region is specified, defaults to the local bounds of the displayObject.
	 * @return A texture of the graphics object.
	 */
	function generateTexture(displayObject:DisplayObject, scaleMode:ScaleModes, resolution:Float, ?region:Rectangle):RenderTexture;

	/**
	 * Initialize the plugins.
	 * @param	staticMap The dictionary of statically saved plugins.
	 */
	private function initPlugins(staticMap:Dynamic):Void;

	/**
	 * Resizes the screen and canvas to the specified width and height. Canvas dimensions are multiplied by resolution.
	 * @param	screenWidth The new width of the screen.
	 * @param	screenHeight The new height of the screen.
	 */
	private function resize(screenWidth:Float, screenHeight:Float):Void;
}
