package samples.retina;

import pixi.text.Text;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _img:Sprite;
	var _label:Text;

	public function new() {
		super();
		_init();
	}

	function _init() {
		super.start();

		var imgPath:String = "assets/retina/img" + _getResolutionStr() + ".jpg";
		_img = new Sprite(Texture.fromImage(imgPath));
		_img.anchor.set(0.5, 0.5);
		_img.name = "img";
		_img.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		_stage.addChild(_img);

		var style:TextStyle = {};
		style.fill = "#FFFFFF";
		style.font = "12px Courier";

		_label = new Text(imgPath, style);
		_label.position.set(_img.x - 478, _img.y - 300);
		_stage.addChild(_label);
	}

	function _getResolutionStr():String {
		if (Browser.window.devicePixelRatio <= 1 || (Browser.window.devicePixelRatio > 1 && Browser.window.devicePixelRatio < 1.5)) return "";
		else if (Browser.window.devicePixelRatio >= 1.5 && Browser.window.devicePixelRatio < 2) return "@1.5x";
		else if (Browser.window.devicePixelRatio >= 2 && Browser.window.devicePixelRatio < 3) return "@2x";
		else return return "@3x";
	}

	static function main() {
		new Main();
	}
}