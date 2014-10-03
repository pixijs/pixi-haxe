package pixi.display;

@:native("PIXI.SpriteBatch")
extern class SpriteBatch {

	/**
	 * The SpriteBatch class is a really fast version of the DisplayObjectContainer 
	 * built solely for speed, so use when you need a lot of sprites or particles.
	 * And it's extremely easy to use : 

	    var container = new PIXI.SpriteBatch();
	 
	    stage.addChild(container);
	 
	    for(var i  = 0; i < 100; i++)
	    {
	        var sprite = new PIXI.Sprite.fromImage("myImage.png");
	        container.addChild(sprite);
	    }
	 * And here you have a hundred sprites that will be renderer at the speed of light
	 *
	 * @class SpriteBatch
	 * @constructor
	 * @param texture {Texture}
	*/
	function new(texture:Dynamic):Void;

	/*
	 * Initialises the spriteBatch
	 *
	 * @method initWebGL
	 * @param gl {WebGLContext} the current WebGL drawing context
	*/
	function initWebGL(gl:Dynamic):Void;

	/*
	 * Updates the object transform for rendering
	 *
	 * @method updateTransform
	 * @private
	*/
	function updateTransform():Void;

}