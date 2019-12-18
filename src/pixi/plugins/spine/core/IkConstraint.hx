package pixi.plugins.spine.core;

extern class IkConstraint implements Updatable {
	var data: IkConstraintData;
	var bones: Array<Bone>;
	var target: Bone;
	var bendDirection: Float;
	var compress: Bool;
	var stretch: Bool;
	var mix: Float;
	var softness: Float;
	var active: Bool;
	function new(data: IkConstraintData, skeleton: Skeleton);
	function isActive(): Bool;
	function apply(): Void;
	function update(): Void;
	function apply1(bone: Bone, targetX: Float, targetY: Float, compress: Bool, stretch: Bool, uniform: Bool, alpha: Float): Void;
	function apply2(parent: Bone, child: Bone, targetX: Float, targetY: Float, bendDir: Float, stretch: Bool, softness: Float, alpha: Float): Void;
}