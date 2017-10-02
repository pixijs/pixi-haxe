package pixi.plugins.spine.core;

import haxe.extern.EitherType;

@:native("PIXI.spine.core.SkeletonJson")
extern class SkeletonJson 
{

	function new(attachementsLoader:AttachmentLoader):Void;
	
	var scale:Float;
	
	function readSkeletonData(json: EitherType<String, Dynamic>): SkeletonData;
}