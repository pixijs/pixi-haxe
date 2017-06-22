package dragging;

import pixi.interaction.InteractionData;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

class Bunny extends Sprite {

	public var data:InteractionData;
	public var dragging:Bool;

	public function new(texture:Texture) {
		super(texture);
	}
}