package pixi.plugins.spine.core;
import pixi.core.math.Matrix;
import pixi.plugins.dragonbones.model.BoneData;

@:native("PIXI.spine.core.Bone")
extern class Bone 
{

	public var children:Array<Bone>;
	
	public var matrix:Matrix;
	
	public var x:Float;
	
	public var y:Float;
	
	public var worldX:Float;
	
	public var worldY:Float;
	
	public var rotation:Float;
	
	public var data:BoneData;
}