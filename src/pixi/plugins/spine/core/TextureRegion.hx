package pixi.plugins.spine.core;

import pixi.core.math.shapes.Rectangle;
import pixi.core.textures.Texture;

@:native("PIXI.spine.core.TextureRegion")
extern class TextureRegion {
	var texture:Texture;
	var size:Rectangle;
	var width:Float;
	var height:Float;
	var u:Float;
	var v:Float;
	var u2:Float;
	var v2:Float;
	var offsetX:Float;
	var offsetY:Float;
	var pixiOffsetY:Float;
	var spineOffsetY:Float;
	var originalWidth:Float;
	var originalHeight:Float;
	var x:Float;
	var y:Float;
	var rotate:Bool;
}