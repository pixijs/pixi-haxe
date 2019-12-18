package pixi.plugins.spine.core.attachments;

@:native("PIXI.spine.core.VertexAttachment")
extern class VertexAttachment extends Attachment {
	// private static var nextID;
	var id: Float;
	var bones: Array<Float>;
	var vertices: Array<Float>;
	var worldVerticesLength: Float;
	var deformAttachment: VertexAttachment;
	function new(name: String);
	function computeWorldVerticesOld(slot: Slot, worldVertices: Array<Float>): Void;
	function computeWorldVertices(slot: Slot, start: Float, count: Float, worldVertices: Array<Float>, offset: Float, stride: Float): Void;
	function copyTo(attachment: VertexAttachment): Void;
}