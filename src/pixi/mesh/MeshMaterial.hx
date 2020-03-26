package pixi.mesh;

import pixi.core.renderers.canvas.CanvasRenderer;
import pixi.core.renderers.webgl.Attribute;
import pixi.core.renderers.webgl.Buffer;
import pixi.core.renderers.webgl.Program;
import pixi.core.textures.Texture;
import pixi.core.textures.TextureMatrix;

@:native("PIXI.MeshMaterial")
extern class MeshMaterial {
	/**
	 * Slightly opinionated default shader for PixiJS 2D objects.
	 * @param	uSampler {Texture}
	 * @param	options {Dynamic}
	 */
	function new(uSampler:Texture, ?options:MeshOptions);

	/**
	 * This gets automatically set by the object using this.
	 */
	var alpha:Float;

	/**
	 * true if shader can be batch with the renderer's batch system.
	 */
	var batchable:Bool;

	/**
	 * Renderer plugin for batching
	 */
	var pluginName:String;

	/**
	 * Reference to the texture being rendered.
	 */
	var texture:Texture;

	/**
	 * Multiply tint for the material.
	 */
	var tint:Int;

	/**
	 * TextureMatrix instance for this Mesh, used to track Texture changes
	 */
	var uvMatrix(default, null):TextureMatrix;

	/**
	 * Renders the mesh using the Canvas renderer
	 * @param	renderer {CanvasRenderer} The canvas renderer.
	 * @param	mesh {Mesh} Mesh to render.
	 */
	private function render(renderer:CanvasRenderer, mesh:Mesh):Void;

	/**
	 * Gets called automatically by the Mesh. Intended to be overridden for custom MeshMaterial objects.
	 */
	function update():Void;
}

typedef MeshOptions = {
	?alpha:Float,
	?tint:Int,
	?pluginName:String,
	?program:Dynamic,
	?uniforms:Dynamic
}
