package pixi.plugins.dragonbones.armature;

import pixi.plugins.dragonbones.geom.Transform;
import pixi.plugins.dragonbones.geom.Matrix;
import pixi.plugins.dragonbones.core.BaseObject;

@:native("dragonBones.TransformObject")
extern class TransformObject extends BaseObject {

	var name:String;
	var globalTransformMatrix:Matrix;
	var global:Transform;
	var offset:Transform;
	var origin:Transform;
	var userData:Dynamic;

	var armature:Armature;
	var parent:Bone;
}