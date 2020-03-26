package pixi.core.renderers.systems;

import haxe.ds.ObjectMap;
import pixi.Quad;
import pixi.QuadUv;
import pixi.core.display.DisplayObject;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.UniformGroup;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.sprites.Sprite;
import pixi.core.textures.RenderTexture;

@:native("PIXI.System")
extern class System {
	/**
	 * System is a base class used for extending systems used by the PIXI.Renderer
	 * @param	renderer The renderer this manager works for.
	 */
	function new(renderer:Renderer);

	/**
	 * The renderer this manager works for.
	 */
	var renderer:Renderer;

	/**
	 * Generic destroy methods to be overridden by the subclass
	 */
	function destroy():Void;
}
