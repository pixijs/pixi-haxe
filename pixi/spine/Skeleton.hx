package pixi.spine;

@:native("spine.Skeleton")
extern class Skeleton {

	var data:SkeletonData;
	var bones:Array<Dynamic>;
	var slots:Array<Dynamic>;
	var drawOrder:Array<Dynamic>;

	var x:Float;
	var y:Float;
	var skin:Dynamic;
	var r:Int;
	var g:Int;
	var b:Int;
	var a:Int;
	var time:Float;
	var flipX:Bool;
	var flipY:Bool;

}