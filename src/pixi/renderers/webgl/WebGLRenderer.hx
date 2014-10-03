package phaser.pixi.renderers.webgl;

@:native("PIXI.WebGLRenderer")
extern class WebGLRenderer {
	
	/**
	 * @author Mat Groves <a href='http://matgroves.com/'>http://matgroves.com/</a> @Doormat23
	 */
	var glContexts:Dynamic;
	
	/**
	 * the WebGLRenderer draws the stage and all its content onto a webGL enabled canvas. This renderer
	 * should be used for browsers that support webGL. This Render works by automatically managing webGLBatch's.
	 * So no need for Sprite Batch's or Sprite Cloud's
	 * Dont forget to add the view to your DOM or you will not see anything :)
	 */
	function new (Number:Dynamic, Number:Dynamic, HTMLCanvasElement:Dynamic, Boolean:Dynamic, Boolean:Dynamic, Boolean:Dynamic);
	
	/**
	 * Whether the render view is transparent
	 */
	var transparent:Bool;
	
	/**
	 * The value of the preserveDrawingBuffer flag affects whether or not the contents of the stencil buffer is retained after rendering.
	 */
	var preserveDrawingBuffer:Bool;
	
	/**
	 * The width of the canvas view
	 */
	var width:Float;
	
	/**
	 * The height of the canvas view
	 */
	var height:Float;
	
	/**
	 * The canvas element that everything is drawn to
	 */
	var view:Dynamic;
	
	/**
	 * Whether the context was lost
	 */
	var contextLost:Bool;
	
}
