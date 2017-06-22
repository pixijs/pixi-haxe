package pixi.core.text;

import haxe.extern.EitherType;
@:native("PIXI.TextStyle")
extern class TextStyle {

	/**
     * @param {DefaultStyle} [style] - The style parameters
     * @param {String} [style.align='left'] - Alignment for multiline text ('left', 'center' or 'right'),
     *  does not affect single line text
     * @param {Bool} [style.breakWords=false] - Indicates if lines can be wrapped within words, it
     *  needs wordWrap to be set to true
     * @param {Bool} [style.dropShadow=false] - Set a drop shadow for the text
     * @param {Float} [style.dropShadowAlpha=1] - Set alpha for the drop shadow
     * @param {Float} [style.dropShadowAngle=Math.PI/6] - Set a angle of the drop shadow
     * @param {Float} [style.dropShadowBlur=0] - Set a shadow blur radius
     * @param {String} [style.dropShadowColor='#000000'] - A fill style to be used on the dropshadow e.g 'red', '#00FF00'
     * @param {Float} [style.dropShadowDistance=5] - Set a distance of the drop shadow
     * @param {String|String[]|Float|Float[]|CanvasGradient|CanvasPattern} [style.fill='black'] - A canvas
     *  fillstyle that will be used on the text e.g 'red', '#00FF00'. Can be an array to create a gradient
     *  eg ['#000000','#FFFFFF']
     * {@link https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle|MDN}
     * @param {Int} [style.fillGradientType=PIXI.TEXT_GRADIENT.LINEAR_VERTICAL] - If fills styles are
     *  supplied, this can change the type/direction of the gradient. See {@link PIXI.TEXT_GRADIENT} for possible values
     * @param {Array<Float>} [style.fillGradientStops] - If fill is an array of colours to create a gradient, this array can set
     * the stop points (numbers between 0 and 1) for the color, overriding the default behaviour of evenly spacing them.
     * @param {String|String[]} [style.fontFamily='Arial'] - The font family
     * @param {Float|String} [style.fontSize=26] - The font size (as a Float it converts to px, but as a String,
     *  equivalents are '26px','20pt','160%' or '1.6em')
     * @param {String} [style.fontStyle='normal'] - The font style ('normal', 'italic' or 'oblique')
     * @param {String} [style.fontVariant='normal'] - The font variant ('normal' or 'small-caps')
     * @param {String} [style.fontWeight='normal'] - The font weight ('normal', 'bold', 'bolder', 'lighter' and '100',
     *  '200', '300', '400', '500', '600', '700', 800' or '900')
     * @param {Float} [style.letterSpacing=0] - The amount of spacing between letters, default is 0
     * @param {Float} [style.lineHeight] - The line height, a Float that represents the vertical space that a letter uses
     * @param {String} [style.lineJoin='miter'] - The lineJoin property sets the type of corner created, it can resolve
     *      spiked text issues. Default is 'miter' (creates a sharp corner).
     * @param {Float} [style.miterLimit=10] - The miter limit to use when using the 'miter' lineJoin mode. This can reduce
     *      or increase the spikiness of rendered text.
     * @param {Float} [style.padding=0] - Occasionally some fonts are cropped. Adding some padding will prevent this from
     *     happening by adding padding to all sides of the text.
     * @param {String|Int} [style.stroke='black'] - A canvas fillstyle that will be used on the text stroke e.g 'blue', '#FCFF00'
     * @param {Float} [style.strokeThickness=0] - A Float that represents the thickness of the stroke. Default is 0 (no stroke)
     * @param {Bool} [style.trim=false] - Trim transparent borders
     * @param {String} [style.textBaseline='alphabetic'] - The baseline of the text that is rendered.
     * @param {Bool} [style.wordWrap=false] - Indicates if word wrap should be used
     * @param {Float} [style.wordWrapWidth=100] - The width at which text will wrap, it needs wordWrap to be set to true
     */
	function new(?style:DefaultStyle);

	/**
     * Creates a new TextStyle object with the same values as this one.
     * Note that the only the properties of the object are cloned.
     *
     * @return {PIXI.TextStyle} New cloned TextStyle object
     */
	function clone():TextStyle;

	/**
     * Resets all properties to the defaults specified in TextStyle.prototype._default
     */
	function reset():Void;

	var styleID:Int;

	var align:String;
	var breakWords:Bool;
	var dropShadow:Bool;
	var dropShadowAlpha:Float;
	var dropShadowAngle:Float;
	var dropShadowBlur:Float;
	var dropShadowColor:String;
	var dropShadowDistance:Float;
	var fill:Dynamic;
	var fillGradientType:Int;
	var fillGradientStops:Array<Float>;
	var fontFamily:EitherType<String, Array<String>>;
	var fontSize:EitherType<String, Float>;
	var fontStyle:String;
	var fontVariant:String;
	var fontWeight:String;
	var letterSpacing:Float;
	var lineHeight:Float;
	var lineJoin:String;
	var miterLimit:Float;
	var padding:Float;
	var stroke:EitherType<String, Int>;
	var strokeThickness:Float;
	var trim:Bool;
	var textBaseline:String;
	var wordWrap:Bool;
	var wordWrapWidth:Float;
}