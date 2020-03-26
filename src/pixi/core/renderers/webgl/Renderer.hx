package pixi.core.renderers.webgl;

import js.html.webgl.RenderingContext;
import pixi.core.Pixi.BlendModes;
import pixi.core.Pixi.ScaleModes;
import pixi.core.display.DisplayObject;
import pixi.core.display.Transform;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.AbstractRenderer;
import pixi.core.renderers.systems.BatchSystem;
import pixi.core.renderers.systems.ContextSystem;
import pixi.core.renderers.systems.FrameBufferSystem;
import pixi.core.renderers.systems.GeometrySystem;
import pixi.core.renderers.systems.MaskSystem;
import pixi.core.renderers.systems.ProjectionSystem;
import pixi.core.renderers.systems.RenderTextureSystem;
import pixi.core.renderers.systems.ShaderSystem;
import pixi.core.renderers.systems.StateSystem;
import pixi.core.renderers.systems.StencilSystem;
import pixi.core.renderers.systems.TextureGCSystem;
import pixi.core.renderers.systems.TextureSystem;
import pixi.core.renderers.webgl.extract.Extract;
import pixi.core.renderers.webgl.utils.RenderTarget;
import pixi.core.textures.Texture;
import pixi.core.textures.RenderTexture;
import pixi.core.math.Matrix;
import pixi.core.renderers.webgl.managers.MaskManager;
import pixi.core.renderers.systems.FilterSystem;

@:native("PIXI.Renderer")
extern class Renderer extends AbstractRenderer {
	/**
	 * The Renderer draws the scene and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatchs.
	 * So no need for Sprite Batches or Sprite Clouds.
	 * Don't forget to add the view to your DOM or you will not see anything :)
	 *
	 * @param system {String} The name of the system this renderer is for.
	 * @param [width=800] {Float} the width of the canvas view
	 * @param [height=600] {Float} the height of the canvas view
	 * @param [options] {RenderingOptions} The optional renderer parameters
	 */
	function new(?options:RenderOptions);

	/**
	 * Batch system instance
	 */
	var batch(default, null):BatchSystem;

	/**
	 * Context system instance
	 */
	var context(default, null):ContextSystem;

	/**
	 * Collection of methods for extracting data (image, pixels, etc.) from a display object or render texture
	 */
	var extract:Extract;

	/**
	 * Filter system instance
	 */
	var filter(default, null):FilterSystem;

	/**
	 * Framebuffer system instance
	 */
	var framebuffer(default, null):FrameBufferSystem;

	/**
	 * Geometry system instance
	 */
	var geometry(default, null):GeometrySystem;

	/**
	 * WebGL context, set by the contextSystem (this.context)
	 */
	var gl(default, null):RenderingContext;

	/**
	 * Global uniforms
	 */
	var globalUniforms:UniformGroup;

	/**
	 * Mask system instance
	 */
	var mask(default, null):MaskSystem;

	/**
	 * Projection system instance
	 */
	var project(default, null):ProjectionSystem;

	/**
	 * Flag if we are rendering to the screen vs renderTexture
	 */
	var renderingToScreen(default, null):Bool;

	/**
	 * RenderTexture system instance
	 */
	var renderTexture(default, null):RenderTextureSystem;

	/**
	 * Shader system instance
	 */
	var shader(default, null):ShaderSystem;

	/**
	 * State system instance
	 */
	var state(default, null):StateSystem;

	/**
	 * Stencil system instance
	 */
	var stencil(default, null):StencilSystem;

	/**
	 * Texture system instance
	 */
	var texture(default, null):TextureSystem;

	/**
	 * Texture garbage collector system instance
	 */
	var textureGC(default, null):TextureGCSystem;

	/**
	 * Adds a plugin to the renderer.
	 * @param	pluginName The name of the plugin.
	 * @param	ctor The constructor function or class for the plugin.
	 */
	static function registerPlugin(pluginName:String, ctor:Dynamic):Void;

	/**
	 * Add a new system to the renderer.
	 * @param	ClassRef Class reference
	 * @param	name Property name for system, if not specified will use a static name property on the class itself. This name will be assigned as s property on the Renderer so make sure it doesn't collide with properties on Renderer.
	 * @return	Return instance of renderer
	 */
	function addSystem(ClassRef:Dynamic, ?name:String):Renderer;

	/**
	 * Clear the frame buffer
	 */
	function clear():Void;

	/**
	 * Renders the object to its WebGL view
	 * @param	displayObject The object to be rendered.
	 * @param	renderTexture The render texture to render to.
	 * @param	clear Should the canvas be cleared before the new render.
	 * @param	transform A transform to apply to the render texture before rendering.
	 * @param	skipUpdateTransform Should we skip the update transform pass?
	 */
	function render(displayObject:DisplayObject, ?renderTexture:RenderTarget, ?clear:Bool = true, ?transform:Matrix, skipUpdateTransform:Bool = false):Void;

	/**
	 * Resets the WebGL state so you can render things however you fancy!
	 * @return Returns itself.
	 */
	function reset():Renderer;
}
