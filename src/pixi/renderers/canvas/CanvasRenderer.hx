package phaser.pixi.renderers.canvas;

@:native("PIXI.CanvasRenderer")
extern class CanvasRenderer {
	
	/**
	 * the CanvasRenderer draws the stage and all its content onto a 2d canvas. This renderer should be used for browsers that do not support webGL.
	 * Dont forget to add the view to your DOM or you will not see anything :)
	 */
	function new (Number:Dynamic, Number:Dynamic, HTMLCanvasElement:Dynamic, Boolean:Dynamic);
	
	/**
	 * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
	 * If the Stage is NOT transparent Pixi will use a canvas sized fillRect operation every frame to set the canvas background color.
	 * If the Stage is transparent Pixi will use clearRect to clear the canvas every frame.
	 * Disable this by setting this to false. For example if your game has a canvas filling background image you often don't need this set.
	 */
	var clearBeforeRender:Bool;
	
	/**
	 * Whether the render view is transparent
	 */
	var transparent:Bool;
	
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
	 * The canvas 2d context that everything is drawn with
	 */
	var context:Dynamic;
	
	/**
	 * Instance of a PIXI.CanvasMaskManager, handles masking when using the canvas renderer
	 */
	var CanvasMaskManager:Dynamic;
	
	/**
	 * The render session is just a bunch of parameter used for rendering
	 */
	var renderSession:Dynamic;
	
}
