package audio;

import core.AudioAsset;
import core.AssetLoader;
import pixi.loaders.Loader;
import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;
import js.Browser;

class Main extends Application {

	var _loader:AssetLoader;
	var _img:Sprite;
	var _baseURL:String;

	var _btnContainer:Container;

	var _bgSound:AudioAsset;
	var _sound1:AudioAsset;
	var _sound2:AudioAsset;

	public function new() {
		super();
		pixelRatio = Math.floor(Browser.window.devicePixelRatio);
		backgroundColor = 0x5F04B4;
		super.start();

		_baseURL = "assets/audio/";

		_loader = new AssetLoader();
		_loader.baseUrl = _baseURL;

		_loader.addAudioAsset("loop", "loop.mp3");
		_loader.addAudioAsset("sound1", "sound1.wav");
		_loader.addAudioAsset("sound2", "sound2.wav");
		_loader.start(_onLoaded, _onLoadProgress);

		_btnContainer = new Container();
		stage.addChild(_btnContainer);
	}

	function _onLoadProgress() {
		trace("Loaded: " + Math.round(_loader.progress));
	}

	function _onLoaded() {
		_bgSound = _loader.getAudio("loop");
		_bgSound.loop = true;
		_bgSound.play();

		_sound1 = _loader.getAudio("sound1");
		_sound2 = _loader.getAudio("sound2");

		_addButton("SOUND 1", 0, 0, 100, 30, _playSound1);
		_addButton("SOUND 2", 100, 0, 100, 30, _playSound2);
		_addButton("STOP ALL", 220, 0, 100, 30, _stopAll);
		_btnContainer.position.set((Browser.window.innerWidth - 320) / 2, (Browser.window.innerHeight - 30) / 2);
	}

	inline function _playSound1() {
		_sound1.play();
	}

	inline function _playSound2() {
		_sound2.play();
	}

	function _stopAll() {
		_bgSound.stop();
		_sound1.stop();
		_sound2.stop();
	}

	function _addButton(label:String, x:Float, y:Float, width:Float, height:Float, callback:Dynamic) {
		var button = new Button(label, width, height);
		button.position.set(x, y);
		button.action.add(callback);
		button.enable();
		_btnContainer.addChild(button);
	}

	static function main() {
		new Main();
	}
}