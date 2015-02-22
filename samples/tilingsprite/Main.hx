package samples.tilingsprite;

import pixi.Application;
import pixi.extras.TilingSprite;
import pixi.display.Stage;
import pixi.textures.Texture;

class Main extends Application {

	var _tilingSprite:TilingSprite;
	var _count:Float;

	public function new() {
		super();
		_init();

		var texture = Texture.fromImage("assets/tilingsprite/p2.jpeg");
		_tilingSprite = new TilingSprite(texture, width, height);

		_stage.addChild(_tilingSprite);

		_count = 0;
	}

	function _init() {
		backgroundColor = 0x97C56E;
		onUpdate = _onUpdate;
		super.start();
		stats = true;
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