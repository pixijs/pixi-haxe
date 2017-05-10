package pixi.core;

import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.SystemRenderer;
import js.html.CanvasElement;
import pixi.core.ticker.Ticker;
import pixi.core.display.Container;

@:native("PIXI.Application")
extern class Application {

	/**
	 * Convenience class to create a new PIXI application.
	 * This class automatically creates the renderer, ticker
	 * and root container.
	 *
	 * @example
	 * // Create the application
	 * var app = new Application();
	 *
	 * // Add the view to the DOM
	 * document.body.appendChild(app.view);
	 *
	 * // ex, add display objects
	 * app.stage.addChild(PIXI.Sprite.fromImage('something.png'));
	 *
	 * @class
	 * @memberof PIXI
	 * @param {RenderOptions} [options] - The optional renderer parameters
	 */
	function new(?options:RenderOptions);

	/**
	 * WebGL renderer if available, otherwise CanvasRenderer
	 * @member {WebGLRenderer|CanvasRenderer}
	 */
	var renderer:SystemRenderer;

	/**
	 * The root display container that's renderered.
	 * @member {Container}
	 */
	var stage:Container;

	/**
	 * Ticker for doing render updates.
	 * @member {Ticker}
	 */
	var ticker:Ticker;

	/**
     * Reference to the renderer's canvas element.
     * @member {HTMLCanvasElement}
     * @readonly
     */
	var view:CanvasElement;

	/**
     * Reference to the renderer's screen rectangle. Its safe to use as filterArea or hitArea for whole screen
     * @member {Rectangle}
     * @readonly
     */
	var screen:Rectangle;

	/**
     * Render the current stage.
     */
	function render():Void;

	/**
     * Convenience method for stopping the render.
     */
	function stop():Void;

	/**
     * Convenience method for starting the render.
     */
	function start():Void;

	/**
     * Destroy and don't use after this.
     * @param {Boolean} [removeView=false] Automatically remove canvas from DOM.
     */
	function destroy(?removeView:Bool):Void;
}