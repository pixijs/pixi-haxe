package scaletest;

import js.Browser;
import pixi.core.sprites.Sprite;
import pixi.core.text.DefaultStyle;
import pixi.core.text.Text;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;

class Main extends Application {

	var _bg:Sprite;
	var _reels:Sprite;
	var _label:Text;
	var _pr = Math.min(Math.floor(Browser.window.devicePixelRatio), 2);

	public function new() {
		super();
		_init();
	}

	function _init() {
		var scale:Int = _getScale(480);

		position = "fixed";
		backgroundColor = 0xFFFFFF;
		pixelRatio = _pr;
		onResize = _onResize;
		super.start();

		var bgPath:String = "assets/scaletest/scale-" + scale + "/background/images/background.png";
		var reelspath:String = "assets/scaletest/scale-" + scale + "/symbols/images/symbols.png";
		_bg = new Sprite(Texture.fromImage(bgPath));
		_bg.anchor.set(0.5);
		_bg.name = "bg";
		_bg.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		_bg.scale.set(1 / _pr);
		stage.addChild(_bg);

		_reels = new Sprite(Texture.fromImage(reelspath));
		_reels.anchor.set(0.5);
		_reels.name = "reels";
		_reels.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		_reels.scale.set(1 / _pr);
		stage.addChild(_reels);

		var style:DefaultStyle = {};
		style.fill = 0xF78181;
		style.fontSize = 12;
		style.fontFamily = "Courier";

		_label = new Text(bgPath, style);
		_label.position.set(0, 0);
		stage.addChild(_label);
		_label.text = "Scale: " + scale + " DPR: " + _pr;
	}

	function _getScale(base:Int):Int {
		var px = Math.max(Browser.window.screen.width, Browser.window.screen.height);
		var pr = Math.min(Math.floor(Browser.window.devicePixelRatio), 2);
		return Math.round((px / base) * pr);
	}

	function _onResize() {
		_bg.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
		_reels.position.set(Browser.window.innerWidth / 2, Browser.window.innerHeight / 2);
	}

	static function main() {
		new Main();
	}
}