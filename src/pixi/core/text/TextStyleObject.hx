package pixi.core.text;

import haxe.extern.EitherType;

typedef TextStyleObject = {
	@:optional var align:String;						//left
	@:optional var breakWords:Bool;						//false
	@:optional var dropShadow:Bool;						//false
	@:optional var dropShadowAngle:Float;				//Math.PI / 6
	@:optional var dropShadowBlur:Float;				//0
	@:optional var dropShadowColor:String;				//#000000
	@:optional var dropShadowDistance:Float;			//5
	@:optional var fill:Dynamic;						//black
	@:optional var fillGradientType:Int;				//Pixi.TEXT_GRADIENT.LINEAR_VERTICAL
	@:optional var fontFamily:String;					//Arial
	@:optional var fontSize:EitherType<String, Float>;	//26
	@:optional var fontStyle:String;					//normal
	@:optional var fontVariant:String;					//normal
	@:optional var fontWeight:String;					//normal
	@:optional var letterSpacing:Float;					//0
	@:optional var lineHeight:Float;					//0
	@:optional var lineJoin:String;						//miter
	@:optional var miterLimit:Float;					//10
	@:optional var padding:Float;						//0
	@:optional var stroke:EitherType<String, Int>;  	//black
	@:optional var strokeThickness:Float;				//0
	@:optional var textBaseline:String;					//alphabetic
	@:optional var wordWrap:Bool;						//false
	@:optional var wordWrapWidth:Float;					//100
}