package pixi.core.text;

import js.html.CanvasElement;

@:native("PIXI.TextMetrics")
extern class TextMetrics {

	/**
     * @param {String} text - the text that was measured
     * @param {TextStyle} style - the style that was measured
     * @param {Float} width - the measured width of the text
     * @param {Float} height - the measured height of the text
     * @param {Array<String>} lines - an array of the lines of text broken by new lines and wrapping if specified in style
     * @param {Array<Float>} lineWidths - an array of the line widths for each line matched to `lines`
     * @param {Float} lineHeight - the measured line height for this style
     * @param {Float} maxLineWidth - the maximum line width for all measured lines
     * @param {Object} fontProperties - the font properties object from TextMetrics.measureFont
     */
	function new(text:String, style:TextStyle, width:Float, height:Float, lines:Array<String>, lineWidths:Array<Float>, lineHeight:Float, maxLineWidth:Float, fontProperties:Dynamic);

	/**
     * Measures the supplied string of text and returns a Rectangle.
     *
     * @param {String} text - the text to measure.
     * @param {TextStyle} style - the text style to use for measuring
     * @param {Bool} [wordWrap] - optional override for if word-wrap should be applied to the text.
     * @param {CanvasElement} [canvas] - optional specification of the canvas to use for measuring.
     * @return {TextMetrics} measured width and height of the text.
     */
	static function measureText(text:String, style:TextStyle, ?wordWrap:Bool, ?canvas:CanvasElement):TextMetrics;

	/**
     * Applies newlines to a string to have it optimally fit into the horizontal
     * bounds set by the Text object's wordWrapWidth property.
     *
     * @private
     * @param {String} text - String to apply word wrapping to
     * @param {TextStyle} style - the style to use when wrapping
     * @param {CanvasElement} [canvas] - optional specification of the canvas to use for measuring.
     * @return {String} New string with new lines applied where required
     */
	static function wordWrap(text:String, style:TextStyle, ?canvas:CanvasElement):String;

	/**
     * Calculates the ascent, descent and fontSize of a given font-style
     *
     * @static
     * @param {String} font - String representing the style of the font
     * @return {TextMetrics~FontMetrics} Font properties object
     */
	static function measureFont(font:String):TextMetrics;
}