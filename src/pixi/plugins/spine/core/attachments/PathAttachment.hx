package pixi.plugins.spine.core.attachments;

@:native("PIXI.spine.core.PathAttachment")
extern class PathAttachment extends VertexAttachment {
	var lengths: Array<Float>;
	var closed: Bool;
	var constantSpeed: Bool;
	var color: Color;
	function new(name: String);
}