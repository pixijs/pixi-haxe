package pixi.core.renderers.systems;

import js.html.webgl.ContextEvent;
import js.html.webgl.RenderingContext;
import pixi.core.Pixi.BlendModes;
import pixi.core.display.DisplayObject;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.State;
import pixi.core.renderers.webgl.UniformGroup;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.renderers.webgl.utils.ObjectRenderer;
import pixi.core.sprites.Sprite;
import pixi.core.textures.RenderTexture;
import pixi.core.textures.FrameBuffer;

typedef TSize = {
	height:Float,
	width:Float
};

@:native("PIXI.systems.FrameBufferSystem")
extern class FrameBufferSystem extends System {
	/**
	 * A list of managed framebuffers
	 */
	var managedFramebuffers(default, null):Array<FrameBuffer>;

	/**
	 * Get the size of the current width and height. Returns object with width and height values.
	 */
	var size(default, null):TSize;

	/**
	 * Framebuffer value that shows that we don't know what is bound
	 */
	var unknownFramebuffer(default, null):FrameBuffer;

	/**
	 * System plugin to the renderer to manage framebuffers.
	 * @param	renderer The renderer this manager works for.
	 */
	function new(renderer:Renderer);

	/**
	 * Bind a framebuffer
	 * @param	frameBuffer
	 * @param	frame frame, default is framebuffer size
	 */
	function bind(frameBuffer:FrameBuffer, ?frame:Rectangle):Void;

	/**
	 * Clear the color of the context
	 * @param	r Red value from 0 to 1
	 * @param	g Green value from 0 to 1
	 * @param	b Blue value from 0 to 1
	 * @param	a Alpha value from 0 to 1
	 */
	function clear(r:Float, g:Float, b:Float, a:Float):Void;

	/**
	 * Sets up the renderer context and necessary buffers.
	 */
	function contextChange():Void;

	/**
	 * Disposes all framebuffers, but not textures bound to them
	 * @param	contextLost
	 */
	function disposeAll(contextLost:Bool):Void;

	/**
	 *  Disposes framebuffer
	 * @param	frameBuffer framebuffer that has to be disposed of
	 * @param	contextLost If context was lost, we suppress all delete function calls
	 */
	function disposeFramebuffer(frameBuffer:FrameBuffer, ?contextLost:Bool = false):Void;

	/**
	 * Initialize framebuffer
	 * @param	frameBuffer
	 */
	private function initFramebuffer(frameBuffer:FrameBuffer):Void;

	/**
	 * resets framebuffer stored state, binds screen framebuffer
	 * should be called before renderTexture reset()
	 */
	function reset():Void;

	/**
	 * Resize the framebuffer
	 * @param	frameBuffer
	 */
	private function resizeFramebuffer(frameBuffer:FrameBuffer):Void;

	/**
	 * Set the WebGLRenderingContext's viewport.
	 * @param	x X position of viewport
	 * @param	y y position of viewport
	 * @param	width width of viewport
	 * @param	height height of viewport
	 */
	function setViewPort(x:Float, y:Float, width:Float, height:Float):Void;

	/**
	 * Update the framebuffer
	 * @param	framebuffer
	 */
	function updateFrameBuffer(framebuffer:FrameBuffer):Void;
}
