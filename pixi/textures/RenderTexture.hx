package pixi.textures;

@:native("PIXI.RenderTexture")
extern class RenderTexture extends pixi.textures.Texture {

    /**
     * A RenderTexture is a special texture that allows any Pixi display object to be rendered to it.
     *
     * __Hint__: All DisplayObjects (i.e. Sprites) that render to a RenderTexture should be preloaded otherwise black rectangles will be drawn instead.
     *
     * A RenderTexture takes a snapshot of any Display Object given to its render method. The position and rotation of the given Display Objects is ignored. For example:
     *
     *    var renderTexture = new PIXI.RenderTexture(800, 600);
     *    var sprite = PIXI.Sprite.fromImage("spinObj_01.png");
     *    sprite.position.x = 800/2;
     *    sprite.position.y = 600/2;
     *    sprite.anchor.x = 0.5;
     *    sprite.anchor.y = 0.5;
     *    renderTexture.render(sprite);
     *
     * The Sprite in this case will be rendered to a position of 0,0. To render this sprite at its actual position a DisplayObjectContainer should be used:
     *
     *    var doc = new PIXI.DisplayObjectContainer();
     *    doc.addChild(sprite);
     *    renderTexture.render(doc);  // Renders to center of renderTexture
     *
     * @class RenderTexture
     * @extends Texture
     * @constructor
     * @param width {Number} The width of the render texture
     * @param height {Number} The height of the render texture
     * @param renderer {CanvasRenderer|WebGLRenderer} The renderer used for this RenderTexture
     * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
     * @param resolution {Number} The resolution of the texture being generated
     */
	function new(?width:Float, ?height:Float, ?renderer:Dynamic, ?scaleMode:Float, ?resolution:Float);

	/**
	 * Resize the RenderTexture.
	 *
	 * @method resize
	 * @param width {Number} The width to resize to.
	 * @param height {Number} The height to resize to.
	 * @param updateBase {Boolean} Should the baseTexture.width and height values be resized as well?
	 */
	function resize(width:Float, height:Float, ?updateBase:Bool):Void;

	/**
	 * Clears the RenderTexture.
	 *
	 * @method clear
	 */
	function clear():Void;

	/**
	 * render
	 */
	var render:Dynamic;
}