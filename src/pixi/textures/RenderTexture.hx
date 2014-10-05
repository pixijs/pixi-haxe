package pixi.textures;

@:native("PIXI.RenderTexture")
extern class RenderTexture extends pixi.textures.Texture {

	/**
	 A RenderTexture is a special texture that allows any pixi displayObject to be rendered to it.

	 __Hint__: All DisplayObjects (exmpl. Sprites) that render on RenderTexture should be preloaded.
	 Otherwise black rectangles will be drawn instead.

	 RenderTexture takes snapshot of DisplayObject passed to render method. If DisplayObject is passed to render method, position and rotation of it will be ignored. For example:

	    var renderTexture = new PIXI.RenderTexture(800, 600);
	    var sprite = PIXI.Sprite.fromImage("spinObj_01.png");
	    sprite.position.x = 800/2;
	    sprite.position.y = 600/2;
	    sprite.anchor.x = 0.5;
	    sprite.anchor.y = 0.5;
	    renderTexture.render(sprite);

	 Sprite in this case will be rendered to 0,0 position. To render this sprite at center DisplayObjectContainer should be used:

	    var doc = new PIXI.DisplayObjectContainer();
	    doc.addChild(sprite);
	    renderTexture.render(doc);  // Renders to center of renderTexture

	 * @class RenderTexture
	 * @extends Texture
	 * @constructor
	 * @param width {Number} The width of the render texture
	 * @param height {Number} The height of the render texture
	 * @param scaleMode {Number} Should be one of the PIXI.scaleMode consts
	 */
	function new (width:Float, height:Float, ?renderer:Dynamic, ?scaleMode:Float);

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
