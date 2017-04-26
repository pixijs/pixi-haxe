package scaletest;

import pixi.loaders.Loader;
import js.Browser;
import pixi.core.sprites.Sprite;
import pixi.core.text.DefaultStyle;
import pixi.core.text.Text;
import pixi.core.textures.Texture;
import pixi.plugins.app.Application;

class Main extends Application {

	var _loader:Loader;
	var _bg:Sprite;
	var _reels:Sprite;
	var _label:Text;
	var _pr = Math.min(Math.floor(Browser.window.devicePixelRatio), 2);
	var _baseSize:Int = 480;
	var _ex:Int = 1;
	var _scale:Int;

	public function new() {
		super();
		_init();
	}

	function _init() {
		_scale = _getScale(_baseSize);

		position = "fixed";
		backgroundColor = 0xFFFFFF;
		pixelRatio = _pr;
		onResize = _onResize;
		super.start();

		_preload();
	}

	function _preload() {
		var baseURL = "assets/scaletest/";
		_loader = new Loader();
		_loader.baseUrl = baseURL;

		_loader.add("ex1/scale-" + _scale + "/background/images/background.png");
		_loader.add("ex1/scale-" + _scale + "/symbols/images/symbols.png");
		_loader.add("ex2/scale-" + _scale + "/background/images/background.png");
		_loader.add("ex2/scale-" + _scale + "/symbols/images/symbols.png");
		_loader.add("ex3/scale-" + _scale + "/background/images/background.png");
		_loader.add("ex3/scale-" + _scale + "/symbols/images/symbols.png");
		_loader.on("progress", _onLoadProgress);
		_loader.load(_onLoaded);
	}

	function _onLoadProgress() {

	}

	function _onLoaded() {
		var bgPath:String = "ex" + _ex + "/scale-" + _scale + "/background/images/background.png";
		var reelspath:String = "ex" + _ex + "/scale-" + _scale + "/symbols/images/symbols.png";
		_bg = new Sprite(_loader.resources[bgPath].texture);
		_bg.anchor.set(0.5);
		_bg.name = "bg";
		_bg.scale.set(1 / _pr);
		stage.addChild(_bg);

		_reels = new Sprite(_loader.resources[reelspath].texture);
		_reels.anchor.set(0.5);
		_reels.name = "reels";
		_reels.scale.set(1 / _pr);
		stage.addChild(_reels);

		var style:DefaultStyle = {};
		style.fill = 0xF78181;
		style.fontSize = 12;
		style.fontFamily = "Courier";

		_label = new Text(bgPath, style);
		_label.position.set(0, 0);
		stage.addChild(_label);
		_label.text = "Scale: " + _scale + " DPR: " + _pr;

		stage.interactive = true;
		stage.click = stage.tap = _changeTextures;

		_onResize();

		var posX = Browser.window.innerWidth - _reels.width - 40;
		var posY = Browser.window.innerHeight - _reels.height - 48;

		while (posX > 100 && posY > 100) {
			_reels.scale.set(_reels.scale.x + 0.1);
			_bg.scale.set(_bg.scale.x + 0.1);
			posX = Browser.window.innerWidth - _reels.width - 30;
			posY = Browser.window.innerHeight - _reels.height - 48;
		}
	}

	function _changeTextures(e) {
		if (_ex < 3) _ex++;
		else _ex = 1;

		var bgPath:String = "ex" + _ex + "/scale-" + _scale + "/background/images/background.png";
		var reelspath:String = "ex" + _ex + "/scale-" + _scale + "/symbols/images/symbols.png";
		_bg.texture = _loader.resources[bgPath].texture;
		_reels.texture = _loader.resources[reelspath].texture;
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