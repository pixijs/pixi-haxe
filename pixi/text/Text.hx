package pixi.text;

import pixi.display.Sprite;
import pixi.DomDefinitions;

@:native("PIXI.Text")
extern class Text extends Sprite {

	/**
	 * A Text Object will create a line(s) of text. To split a line you can use '\n'
	 * or add a wordWrap property set to true and and wordWrapWidth property with a value
	 * in the style object
	 *
	 * @class Text
	 * @extends Sprite
	 * @constructor
	 * @param text {String} The copy that you would like the text to display
	 * @param [style] {TextStyle} The style parameters
	 * @param [style.font] {String} default 'bold 20px Arial' The style and size of the font
	 * @param [style.fill='black'] {String} A canvas fillstyle that will be used on the text e.g '#00FF00'
	 * @param [style.align='left'] {String} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
	 * @param [style.stroke] {String} A canvas fillstyle that will be used on the text stroke e.g ''#FCFF00'
	 * @param [style.strokeThickness=0] {Float} A number that represents the thickness of the stroke. Default is 0 (no stroke)
	 * @param [style.wordWrap=false] {Bool} Indicates if word wrap should be used
	 * @param [style.wordWrapWidth=100] {Float} The width at which text will wrap, it needs wordWrap to be set to true
	 * @param [style.dropShadow=false] {Bool} Set a drop shadow for the text
	 * @param [style.dropShadowColor='#000000'] {String} A fill style to be used on the dropshadow e.g 'red', '#00FF00'
	 * @param [style.dropShadowAngle=Math.PI/4] {Number} Set a angle of the drop shadow
	 * @param [style.dropShadowDistance=5] {Number} Set a distance of the drop shadow
	 */
	function new(text:String, ?style:TextStyle):Void;

	/**
	 * Set the style of the text
	 *
	 * @method setStyle
	 * @param style {TextStyle} The style parameters
	 * @param [style.font] {String} default 'bold 20px Arial' The style and size of the font
	 * @param [style.fill='black'] {String} A canvas fillstyle that will be used on the text e.g '#00FF00'
	 * @param [style.align='left'] {String} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
	 * @param [style.stroke] {String} A canvas fillstyle that will be used on the text stroke e.g ''#FCFF00'
	 * @param [style.strokeThickness=0] {Float} A number that represents the thickness of the stroke. Default is 0 (no stroke)
	 * @param [style.wordWrap=false] {Bool} Indicates if word wrap should be used
	 * @param [style.wordWrapWidth=100] {Float} The width at which text will wrap, it needs wordWrap to be set to true
	 * @param [style.dropShadow=false] {Bool} Set a drop shadow for the text
	 * @param [style.dropShadowColor='#000000'] {String} A fill style to be used on the dropshadow e.g 'red', '#00FF00'
	 * @param [style.dropShadowAngle=Math.PI/4] {Number} Set a angle of the drop shadow
	 * @param [style.dropShadowDistance=5] {Number} Set a distance of the drop shadow
	 */
	function setStyle(style:TextStyle):Void;

	/**
	 * Set the copy for the text object. To split a line you can use '\n'
	 *
	 * @method setText
	 * @param {String} text The copy that you would like the text to display
	 */
	function setText(text:String):Void;

	/**
	 * Destroys this text object
	 *
	 * @method destroy
	 * @param [destroyBaseTexture] {Bool} whether to destroy the base texture as well
	 */
	function destroy(?destroyBaseTexture:Bool):Void;

	/**
	 * Text value
	 * @type String
	 */
	var text:String;

	/**
	 * The canvas element that everything is drawn to
	 * @property canvas
	 * @type CanvasElement
	 */
	var canvas:CanvasElement;

	/**
	 * The canvas 2d context that everything is drawn with
	 * @property context
	 * @type CanvasRenderingContext2D
	 */
	var context:CanvasRenderingContext2D;
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
}