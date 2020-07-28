package basics;

import pixi.core.Application;
import pixi.core.graphics.Graphics;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import js.Browser;

class Main extends Application {

	var _bunny:Sprite;
	var _graphic:Graphics;

	public function new() {
		
		var options:ApplicationOptions = {
			width: Browser.window.innerWidth,
			height: Browser.window.innerHeight,
			backgroundColor: 0x006666,
			transparent: true,
			antialias: false,
		};
		
		super(options);
		ticker.add(function(delta){
			_animate(delta);
		});

		_bunny = new Sprite(Texture.from("assets/basics/bunny.png"));
		_bunny.anchor.set(0.5);
		_bunny.position.set(400, 300);

		_graphic = new Graphics();
		_graphic.beginFill(0xFF0000, 0.4);
		_graphic.drawRect(200, 150, 400, 300);
		_graphic.endFill();

		stage.addChild(_graphic);
		stage.addChild(_bunny);
		Browser.document.body.appendChild(view);
	}

	function _animate(e:Float) {
		_bunny.rotation += 0.1;
	}

	static function main() {
		new Main();
	}
}