package pixi.core.renderers.systems;

import haxe.extern.EitherType;
import js.html.webgl.RenderingContext;
import pixi.core.Shader;
import pixi.core.display.DisplayObject;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Program;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.sprites.Sprite;
import pixi.core.graphics.Graphics;
import pixi.core.textures.RenderTexture;
import pixi.filters.spritemask.SpriteMaskFilter;

@:native("PIXI.systems.ShaderSystem")
extern class ShaderSystem extends System {
	/**
	 * The current WebGL rendering context
	 */
	var gl:RenderingContext;

	/**
	 * System plugin to the renderer to manage shaders.
	 * @param	renderer The renderer this system works for
	 */
	function new(renderer:Renderer);

	/**
	 * Changes the current shader to the one given in parameter
	 * @param	shader the new shader
	 * @param	dontSync false if the shader should automatically sync its uniforms.
	 * @return  the glProgram that belongs to the shader.
	 */
	function bind(shader:Shader, dontSync:Bool):Program;

	/**
	 * Returns the underlying GLShade rof the currently bound shader. This can be handy for when you to have a little more control over the setting of your uniforms.
	 * @return the glProgram for the currently bound Shader for this context
	 */
	function getGlProgram():Program;

	/**
	 * Resets ShaderSystem state, does not affect WebGL state
	 */
	function reset():Void;

	/**
	 * Uploads the uniforms values to the currently bound shader.
	 * @param	uniforms the uniforms values that be applied to the current shader
	 */
	function setUniforms(uniforms:Dynamic):Void;
}
