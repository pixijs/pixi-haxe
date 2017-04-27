package pixi.plugins.dragonbones.model;

import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.CustomData")
extern class CustomData extends BaseObject{

	var ints:Array<Int>;
	var floats:Array<Float>;
	var strings:Array<String>;

	function getInt(?index:Int):Int;
	function getFloat(?index:Int):Float;
	function getString(?index:Int):String;
}