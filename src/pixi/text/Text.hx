package pixi.text;

@:native("PIXI.Text")
extern class Text {

	/**
	 * A Text Object will create a line(s) of text. To split a line you can use '\n' 
	 * or add a wordWrap property set to true and and wordWrapWidth property with a value
	 * in the style object
	 *
	 * @class Text
	 * @extends Sprite
	 * @constructor
	 * @param text {String} The copy that you would like the text to display
	 * @param [style] {Object} The style parameters
	 * @param [style.font] {String} default 'bold 20px Arial' The style and size of the font
	 * @param [style.fill='black'] {String|Number} A canvas fillstyle that will be used on the text e.g 'red', '#00FF00'
	 * @param [style.align='left'] {String} Alignment for multiline text ('left', 'center' or 'right'), does not affect single line text
	 * @param [style.stroke] {String|Number} A canvas fillstyle that will be used on the text stroke e.g 'blue', '#FCFF00'
	 * @param [style.strokeThickness=0] {Number} A number that represents the thickness of the stroke. Default is 0 (no stroke)
	 * @param [style.wordWrap=false] {Boolean} Indicates if word wrap should be used
	 * @param [style.wordWrapWidth=100] {Number} The width at which text will wrap, it needs wordWrap to be set to true
	 * @param [style.dropShadow=false] {Boolean} Set a drop shadow for the text
	 * @param [style.dropShadowColor='#000000'] {String} A fill style to be used on the dropshadow e.g 'red', '#00FF00'
	 * @param [style.dropShadowAngle=Math.PI/4] {Number} Set a angle of the drop shadow
	 * @param [style.dropShadowDistance=5] {Number} Set a distance of the drop shadow
	*/
	public function new(text:String, style:Dynamic):Void;

	/**
	 * The width of the text, setting this will actually modify the scale to achieve the value set
	 *
	 * @property width
	 * @type Number
	*/
	public var width:Float;

	/**
	 * The height of the text, setting this will actually modify the scale to achieve the value set
	 *
	 * @property height
	 * @type Number
	*/
	public var height:Float;

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
	public function setStyle(style:Dynamic):Void;

	/**
	 * Set the copy for the text object. To split a line you can use '\n'
	 *
	 * @method setText
	 * @param {String} text The copy that you would like the text to display
	*/
	public function setText(text:String):Void;

	/**
	 * Destroys this text object
	 *
	 * @method destroy
	 * @param destroyBaseTexture {Boolean} whether to destroy the base texture as well
	*/
	public function destroy(?destroyBaseTexture:Bool):Void;
}