package pixi.text;

import pixi.display.DisplayObjectContainer;

@:native("PIXI.BitmapText")
extern class BitmapText extends DisplayObjectContainer {

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
	function new(text:String, style:BitmapTextStyle):Void;

    /**
     * Set the style of the text
     * style.font {String} The size (optional) and bitmap font id (required) eq 'Arial' or '20px Arial' (must have loaded previously)
     * [style.align='left'] {String} Alignment for multiline text ('left', 'center' or 'right'), does not affect single lines of text
     *
     * @method setStyle
     * @param style {Object} The style parameters, contained as properties of an object
     */
	function setStyle(style:BitmapTextStyle):Void;

	/**
	 * Set the copy for the text object. To split a line you can use '\n'
	 *
	 * @method setText
	 * @param {String} text The copy that you would like the text to display
	*/
	function setText(text:String):Void;

	/**
     * [read-only] The width of the overall text, different from fontSize,
     * which is defined in the style object
     *
     * @property textWidth
     * @type Number
     */
    var textWidth:Float;

    /**
     * [read-only] The height of the overall text, different from fontSize,
     * which is defined in the style object
     *
     * @property textHeight
     * @type Number
     */
    var textHeight:Float;
}

typedef BitmapTextStyle = {
	@:optional var font:String;
	@:optional var align:String;
}