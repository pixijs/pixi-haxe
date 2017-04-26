package bunnymark;

import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

class Bunny extends Sprite {

	public var speedX(default, default):Float;
	public var speedY(default, default):Float;
	public var scaleSpeed(default, default):Float;
	public var rotationSpeed(default, default):Float;

	public function new(texture:Texture) {
		super(texture);
	}
}