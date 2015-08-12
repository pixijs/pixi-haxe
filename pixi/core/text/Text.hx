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
	 * 	var text = new PIXI.Text('This is a pixi text',{font : '24px Arial', fill : 0xff1010, align : 'center'});
	 * ```
	 *
	 * @class
	 * @extends Sprite
	 * @memberof PIXI.text
	 * @param text {String} The copy that you would like the text to display
	 * @param [style] {TextStyle} The style parameters
	 * @param [style.font] {string} default 'bold 20px Arial' The style and size of the font
	 * @param [style.fill='black'] {String|Number} A canvas fillstyle that will be used on the text e.g 'red', '#00FF00'
	 * @param [style.align='left'] {string} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
	 * @param [style.stroke] {String|Number} A canvas fillstyle that will be used on the text stroke e.g 'blue', '#FCFF00'
	 * @param [style.strokeThickness=0] {number} A number that represents the thickness of the stroke. Default is 0 (no stroke)
	 * @param [style.wordWrap=false] {boolean} Indicates if word wrap should be used
	 * @param [style.wordWrapWidth=100] {number} The width at which text will wrap, it needs wordWrap to be set to true
	 * @param [style.lineHeight] {number} The line height, a number that represents the vertical space that a letter uses
	 * @param [style.dropShadow=false] {boolean} Set a drop shadow for the text
	 * @param [style.dropShadowColor='#000000'] {string} A fill style to be used on the dropshadow e.g 'red', '#00FF00'
	 * @param [style.dropShadowAngle=Math.PI/4] {number} Set a angle of the drop shadow
	 * @param [style.dropShadowDistance=5] {number} Set a distance of the drop shadow
	 * @param [style.padding=0] {number} Occasionally some fonts are cropped. Adding some padding will prevent this from happening
	 */
	function new(text:String, ?style:TextStyle, ?resolution:Float):Void;

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
	 * @member {number}
	 */
	var resolution:Float;

	/**
     * Set the style of the text
     *
     * @param [style] {TextStyle} The style parameters
     * @param [style.font='bold 20pt Arial'] {string} The style and size of the font
     * @param [style.fill='black'] {object} A canvas fillstyle that will be used on the text eg 'red', '#00FF00'
     * @param [style.align='left'] {string} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
     * @param [style.stroke='black'] {string} A canvas fillstyle that will be used on the text stroke eg 'blue', '#FCFF00'
     * @param [style.strokeThickness=0] {number} A number that represents the thickness of the stroke. Default is 0 (no stroke)
     * @param [style.wordWrap=false] {boolean} Indicates if word wrap should be used
     * @param [style.wordWrapWidth=100] {number} The width at which text will wrap
     * @param [style.lineHeight] {number} The line height, a number that represents the vertical space that a letter uses
     * @param [style.dropShadow=false] {boolean} Set a drop shadow for the text
     * @param [style.dropShadowColor='#000000'] {string} A fill style to be used on the dropshadow e.g 'red', '#00FF00'
     * @param [style.dropShadowAngle=Math.PI/6] {number} Set a angle of the drop shadow
     * @param [style.dropShadowDistance=5] {number} Set a distance of the drop shadow
     * @param [style.padding=0] {number} Occasionally some fonts are cropped. Adding some padding will prevent this from happening
     * @memberof Text#
     */
	var style:TextStyle;

	/**
     * Set the copy for the text object. To split a line you can use '\n'.
     *
     * @param text {String} The copy that you would like the text to display
     * @memberof Text#
     */
	var text:String;
}

typedef TextStyle = {
	@:optional var font:String;
	@:optional var fill:String;
	@:optional var align:String;
	@:optional var stroke:String;
	@:optional var strokeThickness:Float;
	@:optional var wordWrap:Bool;
	@:optional var wordWrapWidth:Float;
	@:optional var dropShadow:Bool;
	@:optional var dropShadowColor:String;
	@:optional var dropShadowAngle:Float;
	@:optional var dropShadowDistance:Float;
	@:optional var padding:Float;
}