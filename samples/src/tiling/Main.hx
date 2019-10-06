package tiling;

import pixi.core.Application.ApplicationOptions;
import pixi.core.textures.Texture;
import pixi.extras.TilingSprite;
import pixi.core.Application;

class Main extends Application {

	var _tilingSprite:TilingSprite;
	var _count:Float;

	public function new() {
		var options:ApplicationOptions = {
			backgroundColor: 0x97C56E
		};
		super(options);
		_init();
	}

	function _init() {
		ticker.add(function(delta){
			_onUpdate(delta);
		});
		super.start();

		var texture = Texture.from("assets/tiling/p2.jpeg");
		_tilingSprite = new TilingSprite(texture, screen.width, screen.height);

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