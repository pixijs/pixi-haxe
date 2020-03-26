package pixi.core.renderers.systems;

import js.html.webgl.RenderingContext;
import pixi.core.Pixi.BlendModes;
import pixi.core.display.DisplayObject;
import pixi.core.math.Matrix;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.webgl.Renderer;
import pixi.core.renderers.webgl.State;
import pixi.core.renderers.webgl.UniformGroup;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.sprites.Sprite;
import pixi.core.textures.RenderTexture;

@:native("PIXI.systems.StateSystem")
extern class StateSystem extends System {
	/**
	 * Whether current blend equation is different
	 */
	private var _blendEq:Bool;

	/**
	 * Blend mode. Default: PIXI.BLEND_MODES.NONE
	 */
	var blendMode(default, null):BlendModes;

	/**
	 * Collection of check calls
	 */
	var checks(default, null):Array<Dynamic>;

	/**
	 * Default WebGL State
	 */
	var defaultState(default, null):State;

	/**
	 * GL context
	 */
	var gl(default, null):RenderingContext;

	/**
	 * Collection of calls
	 */
	var map(default, null):Array<Dynamic>;

	/**
	 * Polygon offset
	 */
	var polygonOffset(default, null):Float;

	/**
	 * State ID
	 */
	var stateId(default, null):Float;

	/**
	 * System plugin to the renderer to manage WebGL state machines.
	 * @param	renderer The renderer this manager works for
	 */
	function new(renderer:Renderer);

	/**
	 * Sets the state, when previous state is unknown
	 * @param	state The state to set
	 */
	function forceState(state:Dynamic):Void;

	/**
	 * Resets all the logic and disables the vaos
	 */
	function reset():Void;

	/**
	 * Sets the current state
	 * @param	state The state to set.
	 */
	function set(state:Dynamic):Void;

	/**
	 * Enables or disabled blending.
	 * @param	value Turn on or off webgl blending.
	 */
	function setBlend(value:Bool):Void;

	/**
	 * Sets the blend mode.
	 * @param	value The blend mode to set to.
	 */
	function setBlendMode(value:BlendModes):Void;

	/**
	 * Sets whether to enable or disable cull face.
	 * @param	value Turn on or off webgl cull face.
	 */
	function setCullMode(value:Bool):Void;

	/**
	 * Sets whether to enable or disable depth test.
	 * @param	value
	 */
	function setDepthTest(value:Bool):Void;

	/**
	 * Sets the gl front face.
	 * @param	value true is clockwise and false is counter-clockwise
	 */
	function setFrontFace(value:Bool):Void;

	/**
	 * Enables or disable polygon offset fill
	 * @param	value Turn on or off webgl polygon offset testing.
	 */
	function setOffset(value:Bool):Void;

	/**
	 * Sets the polygon offset.
	 * @param	value the polygon offset
	 * @param	scale the polygon offset scale
	 */
	function setPolygonOffset(value:Float, scale:Float):Void;

	/**
	 * checks to see which updates should be checked based on which settings have been activated. For example, if blend is enabled then we should check the blend modes each time the state is changed or if polygon fill is activated then we need to check if the polygon offset changes. The idea is that we only check what we have too.
	 * @param	func the checking function to add or remove
	 * @param	value should the check function be added or removed.
	 */
	function updateCheck(func:Dynamic, value:Bool):Void;
}
