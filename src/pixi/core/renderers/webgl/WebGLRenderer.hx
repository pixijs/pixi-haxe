package pixi.core.renderers.webgl;

import pixi.core.Pixi.BlendModes;
import pixi.core.display.Transform;
import pixi.core.renderers.webgl.utils.RenderTarget;
import pixi.core.textures.Texture;
import pixi.core.textures.RenderTexture;
import pixi.core.math.Matrix;
import pixi.core.renderers.webgl.managers.FilterManager;
import pixi.core.renderers.webgl.managers.MaskManager;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer extends SystemRenderer {

	/**
	 * The WebGLRenderer draws the scene and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatchs.
	 * So no need for Sprite Batches or Sprite Clouds.
	 * Don't forget to add the view to your DOM or you will not see anything :)
	 *
	 * @param system {String} The name of the system this renderer is for.
	 * @param [width=800] {Float} the width of the canvas view
	 * @param [height=600] {Float} the height of the canvas view
	 * @param [options] {RenderingOptions} The optional renderer parameters
	 * @param [options.view] {HTMLCanvasElement} the canvas to use as a view, optional
	 * @param [options.transparent=false] {Bool} If the render view is transparent, default false
	 * @param [options.autoResize=false] {Bool} If the render view is automatically resized, default false
	 * @param [options.antialias=false] {Bool} sets antialias (only applicable in chrome at the moment)
	 * @param [options.resolution=1] {Float} the resolution of the renderer retina would be 2
	 * @param [options.clearBeforeRender=true] {Bool} This sets if the CanvasRenderer will clear the canvas or
	 *      not before the new render pass.
	 * @param [options.backgroundColor=0x000000] {Int} The background color of the rendered area (shown if not transparent).
	 * @param [options.roundPixels=false] {Bool} If true Pixi will Math.floor() x/y values when rendering, stopping pixel interpolation.
	 * @param {Bool} [options.legacy=false] - If true Pixi will aim to ensure compatibility with older / less advanced devices.
	 *      If you experience unexplained flickering try setting this to true.
	 */
	function new(width:Float, height:Float, ?options:RenderOptions);

	/**
     * Manages the masks using the stencil buffer.
     *
     * @member {MaskManager}
     */
	var maskManager:MaskManager;

	/**
     * Manages the stencil buffer.
     *
     * @member {StencilManager}
     */
	var stencilManager:Dynamic;

	/**
	 * An empty renderer.
	 *
	 * @member {PIXI.ObjectRenderer}
	 */
	var emptyRenderer:Dynamic;

	/**
	 * The currently active ObjectRenderer.
	 *
	 * @member {PIXI.WebGLState}
	 */
	var state:Dynamic;

	/**
	 * Holds the current state of textures bound to the GPU.
	 * @type {Array}
	 */
	var boundTextures:Array<Dynamic>;

	/**
     * Manages the filters.
     *
     * @member {FilterManager}
     */
	var filterManager:FilterManager;

	/**
     * object renderer @alvin
     * @member {ObjectRenderer}
     */
	var currentRenderer:Dynamic;

	/**
     * Changes the current renderer to the one given in parameter
     *
     * @param {PIXI.ObjectRenderer} objectRenderer - The object renderer to use.
     */
	function setObjectRenderer(objectRenderer:Dynamic):Void;

	/**
     * This should be called if you wish to do some custom rendering
     * It will basically render anything that may be batched up such as sprites
     *
     */
	function flush():Void;

	/**
     * Resizes the webGL view to the specified width and height.
     *
     * @param {Int} blendMode - the desired blend mode
     */
	function setBlendMode(blendMode:BlendModes):Void;

	/**
     * Erases the active render target and fills the drawing area with a colour
     *
     * @param {Int} [clearColor] - The colour
     */
	function clear(clearColor:Int):Void;

	/**
     * Sets the transform of the active render target to the given matrix
     *
     * @param {PIXI.Matrix} matrix - The transformation matrix
     */
	function setTransform(matrix:Matrix):Void;

	/**
     * Erases the render texture and fills the drawing area with a colour
     *
     * @param {PIXI.RenderTexture} renderTexture - The render texture to clear
     * @param {Int} [clearColor] - The colour
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function clearRenderTexture(renderTexture:RenderTexture, ?clearColor:Int):WebGLRenderer;

	/**
     * Binds a render texture for rendering
     *
     * @param {PIXI.RenderTexture} renderTexture - The render texture to render
     * @param {PIXI.Transform} transform - The transform to be applied to the render texture
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function bindRenderTexture(renderTexture:RenderTexture, transform:Transform):WebGLRenderer;

	/**
     * Changes the current render target to the one given in parameter
     *
     * @param {PIXI.RenderTarget} renderTarget - the new render target
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function bindRenderTarget(renderTarget:RenderTarget):WebGLRenderer;

	/**
     * Changes the current shader to the one given in parameter
     *
     * @param {PIXI.Shader} shader - the new shader
     * @param {Bool} [autoProject=true] - Whether automatically set the projection matrix
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function bindShader(shader:Shader, ?autoProject:Bool):WebGLRenderer;

	/**
     * Binds the texture. This will return the location of the bound texture.
     * It may not be the same as the one you pass in. This is due to optimisation that prevents
     * needless binding of textures. For example if the texture is already bound it will return the
     * current location of the texture instead of the one provided. To bypass this use force location
     *
     * @param {PIXI.Texture} texture - the new texture
     * @param {Float} location - the suggested texture location
     * @param {Bool} forceLocation - force the location
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function bindTexture(texture:Texture, location:Float, forceLocation:Bool):WebGLRenderer;

	/**
     * unbinds the texture ...
     *
     * @param {PIXI.Texture} texture - the texture to unbind
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function unbindTexture(texture:Texture):WebGLRenderer;

	/**
     * Creates a new VAO from this renderer's context and state.
     *
     * @return {VertexArrayObject} The new VAO.
     */
	function createVao():Dynamic;

	/**
     * Changes the current Vao to the one given in parameter
     *
     * @param {PIXI.VertexArrayObject} vao - the new Vao
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function bindVao(vao:Dynamic):WebGLRenderer;

	/**
     * Resets the WebGL state so you can render things however you fancy!
     *
     * @return {PIXI.WebGLRenderer} Returns itself.
     */
	function reset():WebGLRenderer;
}