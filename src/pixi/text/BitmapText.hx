package pixi.text;

@:native("PIXI.BitmapText")
extern class BitmapText extends pixi.display.DisplayObjectContainer {

	/**
	 * A Text Object will create a line(s) of text using bitmap font. To split a line you can use '\n', '\r' or '\r\n'
	 * You can generate the fnt files using
	 * http://www.angelcode.com/products/bmfont/ for windows or
	 * http://www.bmglyph.com/ for mac.
	 *
	 * @class BitmapText
	 * @extends DisplayObjectContainer
	 * @constructor
	 * @param text {String} The copy that you would like the text to display
	 * @param style {Object} The style parameters
	 * @param style.font {String} The size (optional) and bitmap font id (required) eq 'Arial' or '20px Arial' (must have loaded previously)
	 * @param [style.align='left'] {String} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
	*/
	function new(text:String, style:Dynamic):Void;

	/**
	 * Set the style of the text
	 *
	 * @method setStyle
	 * @param [style] {Object} The style parameters
	 * @param [style.font='bold 20pt Arial'] {String} The style and size of the font
	 * @param [style.fill='black'] {Object} A canvas fillstyle that will be used on the text eg 'red', '#00FF00'
	 * @param [style.align='left'] {String} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
	 * @param [style.stroke='black'] {String} A canvas fillstyle that will be used on the text stroke eg 'blue', '#FCFF00'
	 * @param [style.strokeThickness=0] {Number} A number that represents the thickness of the stroke. Default is 0 (no stroke)
	 * @param [style.wordWrap=false] {Boolean} Indicates if word wrap should be used
	 * @param [style.wordWrapWidth=100] {Number} The width at which text will wrap
	 * @param [style.dropShadow=false] {Boolean} Set a drop shadow for the text
	 * @param [style.dropShadowColor='#000000'] {String} A fill style to be used on the dropshadow e.g 'red', '#00FF00'
	 * @param [style.dropShadowAngle=Math.PI/4] {Number} Set a angle of the drop shadow
	 * @param [style.dropShadowDistance=5] {Number} Set a distance of the drop shadow
	*/
	function setStyle(style:Dynamic):Void;

	/**
	 * Set the copy for the text object. To split a line you can use '\n'
	 *
	 * @method setText
	 * @param {String} text The copy that you would like the text to display
	*/
	function setText(text:String):Void;
}