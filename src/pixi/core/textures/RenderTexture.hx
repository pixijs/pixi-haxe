package pixi.core.textures;

import pixi.core.math.shapes.Rectangle;

@:native("PIXI.RenderTexture")
extern class RenderTexture extends Texture {

	/**
	 * A RenderTexture is a special texture that allows any Pixi display object to be rendered to it.
	 *
	 * __Hint__: All DisplayObjects (i.e. Sprites) that render to a RenderTexture should be preloaded
	 * otherwise black rectangles will be drawn instead.
	 *
	 * A RenderTexture takes a snapshot of any Display Object given to its render method. The position
	 * and rotation of the given Display Objects is ignored. For example:
	 *
	 * ```haxe
	 * var renderer = Detector.autoDetectRenderer(1024, 1024, { view: canvas, ratio: 1 });
	 * var renderTexture = RenderTexture.create(800, 600);
	 * var sprite = Sprite.fromImage("spinObj_01.png");
	 *
	 * sprite.position.x = 800/2;
	 * sprite.position.y = 600/2;
	 * sprite.anchor.x = 0.5;
	 * sprite.anchor.y = 0.5;
	 *
	 * renderer.render(sprite, renderTexture);
	 * ```
	 *
	 * The Sprite in this case will be rendered to a position of 0,0. To render this sprite at its actual
	 * position a Container should be used:
	 *
	 * ```haxe
	 * var doc = new Container();
	 *
	 * doc.addChild(sprite);
	 *
	 * renderer.render(doc, renderTexture);  // Renders to center of renderTexture
	 * ```
	 *
	 * @class
	 * @extends Texture
	 * @memberof PIXI
	 * @param baseRenderTexture {BaseRenderTexture} The renderer used for this RenderTexture
 	*/
	function new(baseRenderTexture:BaseRenderTexture, frame:Rectangle);

	/**
	 * Resizes the RenderTexture.
	 *
	 * @param width {Float} The width to resize to.
	 * @param height {Float} The height to resize to.
	 * @param updateBase {Bool} Should the baseTexture.width and height values be resized as well?
	 */
	function resize(width:Float, height:Float, updateBase:Bool):Void;

	/**
	 * A short hand way of creating a render texture..
	 * @param [width=100] {Float} The width of the render texture
	 * @param [height=100] {Float} The height of the render texture
	 * @param [scaleMode] {Int} See {@link PIXI.SCALE_MODES} for possible values
	 * @param [resolution=1] {Float} The resolution of the texture being generated
	 */
	static function create(?width:Float, ?height:Float, ?scaleMode:Int, ?resolution:Float):RenderTexture;
}