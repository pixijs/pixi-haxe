package pixi.core.renderers.webgl;

@:native("PIXI.State")
extern class State {
	/**
	 * This is a WebGL state, and is is passed The WebGL StateManager.
	 * Each mesh rendered may require WebGL to be in a different state. For example you may want different blend mode or to enable polygon offsets
	 */
	function new();

	/**
	 * Activates blending of the computed fragment color values
	 */
	var blend:Bool;

	/**
	 * The blend mode to be applied when this state is set. Apply a value of PIXI.BLEND_MODES.NORMAL to reset the blend mode. Setting this mode to anything other than NO_BLEND will automatically switch blending on.´
	 */
	var blendMode:Int;

	/**
	 * Specifies whether or not front or back-facing polygons can be culled.
	 */
	var clockwiseFrontFace:Bool;

	/**
	 * Activates culling of polygons.
	 */
	var culling:Bool;

	/**
	 * Activates depth comparisons and updates to the depth buffer.
	 */
	var depthTest:Bool;

	/**
	 * Activates adding an offset to depth values of polygon's fragments
	 */
	var offsets:Bool;

	/**
	 * The polygon offset. Setting this property to anything other than 0 will automatically enable polygon offset fill.
	 */
	var polygonOffset:Float;
}
