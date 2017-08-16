package pixi.core.text;

import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import pixi.core.sprites.Sprite;

@:native("PIXI.Text")
extern class Text extends Sprite {

	/**
	 * A Text Object will create a line or multiple lines of text. To split a line you can use '\n' in your text string,
	 * or add a wordWrap property set to true and and wordWrapWidth property with a value in the style object.
	 *
	 * A Text can be created directly from a string and a style object
	 *
	 * ```js
	 * var text = new Text('This is a pixi text',{font : '24px Arial', fill : 0xff1010, align : 'center'});
	 * ```
	 *
	 * @class
	 * @extends PIXI.Sprite
	 * @memberof PIXI
	 * @param text {String} The string that you would like the text to display
	 * @param [style] {DefaultStyle|TextStyle} The style parameters
	 * @param {CanvasElement} [canvas] - The canvas element for drawing text
	 */
	function new(text:String, ?style:DefaultStyle, ?canvas:CanvasElement):Void;

	/**
	 * The canvas element that everything is drawn to
	 *
	 * @member {HTMLCanvasElement}
 	*/
	var canvas:CanvasElement;

	/**
	 * The canvas 2d context that everything is drawn with
	 * @member {HTMLCanvasElement}
	 */
	var context:CanvasRenderingContext2D;

	/**
	 * The resolution of the canvas.
	 * @member {Float}
	 */
	var resolution:Float;

	/**
     * Set the copy for the text object. To split a line you can use '\n'.
     *
     * @param text {String} The copy that you would like the text to display
     * @memberof Text#
     */
	var text:String;

	/**
     * Set the style of the text. Set up an event listener to listen for changes on the style object and mark the text as dirty.
     * @member {TextStyleObj|TextStyle}
     *
     */
	var style:DefaultStyle;
}