package pixi.text;

class TextStyle {
	public var font:String = "bold 20px Arial";
	public var fill:String = "#000000";
	public var align:String = "left";
	public var stroke:String;
	public var strokeThickness:Float = 0;
	public var wordWrap:Bool = false;
	public var wordWrapWidth:Float = 100;
	public var dropShadow:Bool = false;
	public var dropShadowColor:String = "#000000";
	public var dropShadowAngle:Float = Math.PI / 4;
	public var dropShadowDistance:Float = 5;

	public function new(?font:String, ?fill:String, ?align:String, ?stroke:String, ?strokeThickness:Float, ?wordWrap:Bool, ?wordWrapWidth:Float, ?dropShadow:Bool, ?dropShadowColor:String, ?dropShadowAngle:Float, ?dropShadowDistance:Float) {
		if (font != null) this.font = font;
		if (fill != null) this.fill = fill;
		if (align != null) this.align = align;
		if (stroke != null) this.stroke = stroke;
		if (strokeThickness != null) this.strokeThickness = strokeThickness;
		if (wordWrap != null) this.wordWrap = wordWrap;
		if (wordWrapWidth != null) this.wordWrapWidth = wordWrapWidth;
		if (dropShadow != null) this.dropShadow = dropShadow;
		if (dropShadowColor != null) this.dropShadowColor = dropShadowColor;
		if (dropShadowAngle != null) this.dropShadowAngle = dropShadowAngle;
		if (dropShadowDistance != null) this.dropShadowDistance = dropShadowDistance;
	}
}