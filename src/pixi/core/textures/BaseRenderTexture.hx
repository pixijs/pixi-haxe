package pixi.core.textures;

@:native("PIXI.BaseRenderTexture")
extern class BaseRenderTexture extends BaseTexture {

	/**
	 * A BaseRenderTexture is a special texture that allows any Pixi display object to be rendered to it.
	 *
	 * __Hint__: All DisplayObjects (i.e. Sprites) that render to a BaseRenderTexture should be preloaded
	 * otherwise black rectangles will be drawn instead.
	 *
	 * A BaseRenderTexture takes a snapshot of any Display Object given to its render method. The position
	 * and rotation of the given Display Objects is ignored. For example:
	 *
	 * ```js
	 * var renderer = PIXI.autoDetectRenderer(1024, 1024, { view: canvas, ratio: 1 });
	 * var BaserenderTexture = new PIXI.BaseRenderTexture(renderer, 800, 600);
	 * var sprite = PIXI.Sprite.fromImage("spinObj_01.png");
	 *
	 * sprite.position.x = 800/2;
	 * sprite.position.y = 600/2;
	 * sprite.anchor.x = 0.5;
	 * sprite.anchor.y = 0.5;
	 *
	 * BaserenderTexture.render(sprite);
	 * ```
	 *
	 * The Sprite in this case will be rendered to a position of 0,0. To render this sprite at its actual
	 * position a Container should be used:
	 *
	 * ```js
	 * var doc = new Container();
	 *
	 * doc.addChild(sprite);
	 *
	 * var baseRenderTexture = new BaserenderTexture(100, 100);
	 * var renderTexture = new RenderTexture(baseRenderTexture);
	 *
	 * renderer.render(doc, renderTexture);  // Renders to center of RenderTexture
	 * ```
	 *
	 * @class
	 * @extends BaseTexture
	 * @memberof PIXI
	 * @param [width=100] {Float} The width of the base render texture
	 * @param [height=100] {Float} The height of the base render texture
	 * @param [scaleMode] {Int} See {@link PIXI.SCALE_MODES} for possible values
	 * @param [resolution=1] {Float} The resolution / device pixel ratio of the texture being generated
	 */
	function new(?width:Float, ?height:Float, ?scaleMode:Int, ?resolution:Float);

	/**
	 * Resizes the BaseRenderTexture.
	 *
	 * @param width {Float} The width to resize to.
	 * @param height {Float} The height to resize to.
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * This will let the renderer know if the texture is valid. If it's not then it cannot be rendered.
	 *
	 * @member {Bool}
	 */
	var valid:Bool;
}