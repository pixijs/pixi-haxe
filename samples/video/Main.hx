package samples.video;

import pixi.display.DisplayObjectContainer;
import pixi.textures.VideoTexture;
import pixi.display.Sprite;
import pixi.textures.Texture;
import pixi.Application;
import js.html.VideoElement;
import js.Browser;

class Main extends Application {

	var _vidTexture:Texture;
	var _vidSprite:Sprite;
	var _vidElement:VideoElement;
	var _vidContainer:DisplayObjectContainer;

	var _bg:Sprite;

	public function new() {
		super();
		_init();
	}

	function _init() {
		backgroundColor = 0xFFFFFF;
		onUpdate = _onUpdate;
		onResize = _onResize;
		resize = true;
		width = Browser.window.innerWidth;
		height = Browser.window.innerHeight;
		super.start(Application.CANVAS);

		_bg = new Sprite(Texture.fromImage("assets/video/bg.jpg"));
		_stage.addChild(_bg);

		_bg.interactive = true;
		_bg.mousedown = _bg.touchstart = _addVideo;

		_vidContainer = new DisplayObjectContainer();
		_stage.addChild(_vidContainer);

		/*var _vidElement = Browser.document.createVideoElement();
		_vidElement.autoplay = true;
		_vidElement.loop = true;
		_vidElement.src =  _vidURL;
		//Browser.document.body.appendChild(_vidElement);*/
	}

	function _addVideo(data) {
		var _vidURL:String = "assets/video/test.mp4";
		_vidTexture = VideoTexture.fromUrl(_vidURL);
		_vidSprite = new Sprite(_vidTexture);
		_vidContainer.addChild(_vidSprite);
	}

	function _onUpdate(elapsedTime:Float) {

	}

	function _onResize() {

	}

	static function main() {
		new Main();
	}

	function _isAndroid():Bool {
		return ~/Android/i.match(Browser.navigator.userAgent);
	}

	function _isiOS():Bool {
		return ~/(iPad|iPhone|iPod)/i.match(Browser.navigator.userAgent);
	}
}