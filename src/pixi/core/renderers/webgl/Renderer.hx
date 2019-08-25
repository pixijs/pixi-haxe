package pixi.core.renderers.webgl;

import pixi.core.Pixi.BlendModes;
import pixi.core.display.Transform;
import pixi.core.renderers.webgl.utils.RenderTarget;
import pixi.core.textures.Texture;
import pixi.core.textures.RenderTexture;
import pixi.core.math.Matrix;
import pixi.core.renderers.webgl.managers.FilterManager;
import pixi.core.renderers.webgl.managers.MaskManager;

@:native("PIXI.Renderer")
extern class Renderer extends SystemRenderer {

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
     * @return {PIXI.Renderer} Returns itself.
     */
	function clearRenderTexture(renderTexture:RenderTexture, ?clearColor:Int):Renderer;

	/**
     * Binds a render texture for rendering
     *
     * @param {PIXI.RenderTexture} renderTexture - The render texture to render
     * @param {PIXI.Transform} transform - The transform to be applied to the render texture
     * @return {PIXI.Renderer} Returns itself.
     */
	function bindRenderTexture(renderTexture:RenderTexture, transform:Transform):Renderer;

	/**
     * Changes the current render target to the one given in parameter
     *
     * @param {PIXI.RenderTarget} renderTarget - the new render target
     * @return {PIXI.Renderer} Returns itself.
     */
	function bindRenderTarget(renderTarget:RenderTarget):Renderer;

	/**
     * Changes the current shader to the one given in parameter
     *
     * @param {PIXI.Shader} shader - the new shader
     * @param {Bool} [autoProject=true] - Whether automatically set the projection matrix
     * @return {PIXI.Renderer} Returns itself.
     */
	function bindShader(shader:Shader, ?autoProject:Bool):Renderer;

	/**
     * Binds the texture. This will return the location of the bound texture.
     * It may not be the same as the one you pass in. This is due to optimisation that prevents
     * needless binding of textures. For example if the texture is already bound it will return the
     * current location of the texture instead of the one provided. To bypass this use force location
     *
     * @param {PIXI.Texture} texture - the new texture
     * @param {Float} location - the suggested texture location
     * @param {Bool} forceLocation - force the location
     * @return {PIXI.Renderer} Returns itself.
     */
	function bindTexture(texture:Texture, location:Float, forceLocation:Bool):Renderer;

	/**
     * unbinds the texture ...
     *
     * @param {PIXI.Texture} texture - the texture to unbind
     * @return {PIXI.Renderer} Returns itself.
     */
	function unbindTexture(texture:Texture):Renderer;

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
     * @return {PIXI.Renderer} Returns itself.
     */
	function bindVao(vao:Dynamic):Renderer;

	/**
     * Resets the WebGL state so you can render things however you fancy!
     *
     * @return {PIXI.Renderer} Returns itself.
     */
	function reset():Renderer;
}