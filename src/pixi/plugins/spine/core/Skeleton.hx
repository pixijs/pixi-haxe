package pixi.plugins.spine.core;
import pixi.plugins.spine.core.attachments.Attachment;

@:native("PIXI.spine.core.Skeleton")
extern class Skeleton 
{

	public var data: SkeletonData;
	public var bones: Array<Bone>;
	public var slots: Array<Slot>;
	public var drawOrder: Array<Slot>;
	public var ikConstraints: Array<IkConstraint>;
	public var transformConstraints: Array<TransformConstraint>;
	public var pathConstraints: Array<PathConstraint>;
	public var _updateCache: Array<Updatable>;
	public var updateCacheReset: Array<Updatable>;
	public var skin: Skin;
	public var color: Color;
	public var time: Float;
	public var flipX: Bool;
	public var flipY: Bool;
	public var x: Float;
	public var y: Float;
	public function new(data: SkeletonData);
	public function updateCache(): Void;
	public function sortIkConstraint(constraint: IkConstraint): Void;
	public function sortPathConstraint(constraint: PathConstraint): Void;
	public function sortTransformConstraint(constraint: TransformConstraint): Void;
	public function sortPathConstraintAttachment(skin: Skin, slotIndex: Float, slotBone: Bone): Void;
	public function sortPathConstraintAttachmentWith(attachment: Attachment, slotBone: Bone): Void;
	public function sortBone(bone: Bone): Void;
	public function sortReset(bones: Array<Bone>): Void;
	public function updateWorldTransform(): Void;
	public function setToSetupPose(): Void;
	public function setBonesToSetupPose(): Void;
	public function setSlotsToSetupPose(): Void;
	public function getRootBone(): Bone;
	public function findBone(boneName: String): Bone;
	public function findBoneIndex(boneName: String): Float;
	public function findSlot(slotName: String): Slot;
	public function findSlotIndex(slotName: String): Float;
	public function setSkinByName(skinName: String): Void;
	public function setSkin(newSkin: Skin): Void;
	public function getAttachmentByName(slotName: String, attachmentName: String): Attachment;
	public function getAttachment(slotIndex: Float, attachmentName: String): Attachment;
	public function setAttachment(slotName: String, attachmentName: String): Void;
	public function findIkConstraint(constraintName: String): IkConstraint;
	public function findTransformConstraint(constraintName: String): TransformConstraint;
	public function findPathConstraint(constraintName: String): PathConstraint;
	public function getBounds(offset: Vector2, size: Vector2, temp: Array<Float>): Void;
	public function update(delta: Float): Void;
}