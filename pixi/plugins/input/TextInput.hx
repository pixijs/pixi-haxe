package pixi.plugins.input;

@:native("PIXI.Input")
extern class TextInput extends InputObject {
	function new(?options:Options);

	var value:String;
}

typedef Options = {
	@:optional var readonly:Bool;
	@:optional var maxlength:Bool;
	@:optional var placeholder:String;
	@:optional var placeholderColor:String;
	@:optional var selectionColor:String;
	@:optional var value:String;
	@:optional var type:String;

	@:optional var width:Float;
	@:optional var height:Float;
	@:optional var padding:Float;
	@:optional var borderColor:String;
	@:optional var borderWidth:Float;
	@:optional var borderRadius:Float;
	@:optional var backgroundImage:Dynamic;
	@:optional var backgroundColor:String;
	@:optional var backgroundGradient:String;
	@:optional var boxShadow:Float;
	@:optional var innerShadow:Float;

	@:optional var valign:String;
	@:optional var align:String;
	@:optional var outline:Float;
	@:optional var text:InputTextStyle;

	@:optional var onsubmit:Void -> Void;
	@:optional var onkeydown:Void -> Void;
	@:optional var onkeyup:Void -> Void;
	@:optional var onfocus:Void -> Void;
	@:optional var onblur:Void -> Void;
	@:optional var onmousedown:Void -> Void;
	@:optional var onmouseup:Void -> Void;
}

typedef InputTextStyle = {
	@:optional var font:String;
	@:optional var fill:String;
	@:optional var align:String;
	@:optional var stroke:String;
	@:optional var strokeThickness:Float;
}
