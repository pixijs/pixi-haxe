package pixi.core;

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
	 * @param {Float} [width=800] - the width of the renderers view
     * @param {Float} [height=600] - the height of the renderers view
     * @param {RenderOptions} [options] - The optional renderer parameters
     * @param {Bool} [noWebGL=false] - prevents selection of WebGL renderer, even if such is present
     * @param {Bool} [options.legacy=false] - If true Pixi will aim to ensure compatibility with older / less advanced devices.
     *       If you experience unexplained flickering try setting this to true.
	 */
	function new(?width:Float, ?height:Float, ?options:RenderOptions, ?noWebGL:Bool);

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