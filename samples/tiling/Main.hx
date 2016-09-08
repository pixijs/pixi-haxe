package tiling;

import pixi.core.textures.Texture;
import pixi.extras.TilingSprite;
import pixi.plugins.app.Application;

class Main extends Application {

	var _tilingSprite:TilingSprite;
	var _count:Float;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0x97C56E;
		onUpdate = _onUpdate;
		super.start();

		var texture = Texture.fromImage("assets/tiling/p2.jpeg");
		_tilingSprite = new TilingSprite(texture, width, height);

		stage.addChild(_tilingSprite);

		_count = 0;
	}

	function _onUpdate(elapsedTime:Float) {
		_count += 0.005;
		_tilingSprite.tileScale.x = 2 + Math.sin(_count);
		_tilingSprite.tileScale.y = 2 + Math.cos(_count);

		_tilingSprite.tilePosition.x += 1;
		_tilingSprite.tilePosition.y += 1;
	}

	static function main() {
		new Main();
	}
}