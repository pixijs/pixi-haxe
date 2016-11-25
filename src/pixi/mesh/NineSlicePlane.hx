package pixi.mesh;

import pixi.core.textures.Texture;
@:native("PIXI.mesh.NineSlicePlane")
extern class NineSlicePlane extends Plane {

	var leftWidth:Int;
	var rightWidth:Int;
	var topHeight:Int;
	var bottomHeight:Int;

	function new(texture:Texture, ?leftWidth:Int, ?topHeight:Int, ?rightWidth:Int, ?bottomHeight:Int);

	function updateHorizontalVertices():Void;

	function updateVerticalVertices():Void;
}