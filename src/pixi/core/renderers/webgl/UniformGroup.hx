package pixi.core.renderers.webgl;

@:native("PIXI.UniformGroup")
extern class UniformGroup {
	/**
	 * Uniform group holds uniform map and some ID's for work
	 * @param	uniforms Custom uniforms to use to augment the built-in ones.
	 * @param	_static Uniforms wont be changed after creation
	 */
	public function new(?uniforms:Dynamic, ?_static:Bool);

	/**
	 * dirty version
	 */
	private var dirtyId:Float;

	/**
	 * Its a group and not a single uniforms. Default: true
	 */
	var group(default, null):Bool;

	/**
	 * unique id
	 */
	private var id:Float;

	/**
	 * Uniforms wont be changed after creation
	 */
	@:native('static') var isStatic:Bool;

	/**
	 * uniform values
	 */
	var uniforms:Dynamic;
}
