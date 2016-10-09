package loader;

import js.html.URL;
import js.html.Blob;
import js.html.Uint8Array;
import pixi.core.utils.Utils;
import pixi.core.textures.BaseTexture;
import js.html.Image;
import haxe.Json;
import js.html.XMLHttpRequest;
import js.Browser;
import pixi.core.textures.Texture;
import pixi.core.text.TextStyleObject;
import pixi.core.text.Text;
import pixi.loaders.Loader;
import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;

class Main extends Application {

	var _loader:Loader;
	var _img:Sprite;
	var _baseURL:String;
	var _label:Text;
	var _startTime:Float;
	var _loadTime:Float;

	var _b64response:Dynamic;

	public function new() {
		super();
		super.start();

		var urlStr = Browser.window.location.href.split("?");

		var style:TextStyleObject = {};
		style.fill = 0x003366;
		style.fontSize = 24;
		style.fontFamily = "Courier";

		_label = new Text("", style);
		_label.position.set(0, 0);
		stage.addChild(_label);

		_startTime = Date.now().getTime();
		_loadTime = 0;

		if (urlStr.length > 1 && (urlStr[1] == "base64" || urlStr[1] == "64" || urlStr[1] == "b64")) _loadBase64Assets();
		else if (urlStr.length > 1 && (urlStr[1] == "bin" || urlStr[1] == "binary")) _loadBinaryssets();
		else _loadIndividialAssets();
	}

	function _loadBinaryssets() {
		var progress:Float = 0;
		var xobj = new XMLHttpRequest();
		xobj.open("GET", "assets/binaryassets.txt", true);

		xobj.onprogress = function(e:Dynamic) {
			progress = e.lengthComputable ? e.loaded / e.total : 0;
			if (progress > 1) progress = 1;
			_label.text = "Loaded: " + Math.round(progress * 100) + "%";
		};

		xobj.onload = function() {
			_label.text = "Loaded: " + "100%";
			_loadTime = Date.now().getTime() - _startTime;
			_label.text += "\nLoad Time: " + (_loadTime / 1000) + " secs";
		};
		xobj.send(null);
	}

	function _loadBase64Assets() {
		var progress:Float = 0;
		var totalSize = 0;
		var m:EReg = ~/"meta":.[0-9]*,[0-9]*./i;
		var xobj = new XMLHttpRequest();
		xobj.open("GET", "assets/base64assets.json", true);

		xobj.onprogress = function(e:Dynamic) {
			var meta = m.match(xobj.responseText);
			if (meta && totalSize == 0) {
				var metaInfo = Json.parse("{" + m.matched(0) + "}");
				totalSize = metaInfo.meta[1];
			}
			progress = e.lengthComputable ? e.loaded / e.total : e.loaded / totalSize;
			if (progress > 1) progress = 1;
			_label.text = "Loaded: " + Math.round(progress * 100) + "%";
		};

		xobj.onload = function() {
			_b64response = Json.parse(xobj.responseText);
			_loadTime = Date.now().getTime() - _startTime;
			_label.text += "\nLoad Time: " + (_loadTime / 1000) + " secs";

			var _container:Container = new Container();
			stage.addChild(_container);
			for (i in 0 ... 10) {

				var img = new Image();
				img.src = Reflect.field(_b64response, (i + 1) + ".png");

				var base = new BaseTexture(img);
				var texture = new Texture(base);
				Reflect.setField(Utils.BaseTextureCache, (i + 1) + ".png", base);
				Reflect.setField(Utils.TextureCache, (i + 1) + ".png", texture);

				_img = new Sprite(texture);
				_img.name = "img" + (i + 1);
				if (i < 6) _img.position.set(128 * i, 0);
				else _img.position.set(128 * (i - 5), 128);
				_container.addChild(_img);
			}
			_container.position.set((Browser.window.innerWidth - _container.width) / 2, (Browser.window.innerHeight - _container.height) / 2);
		};
		xobj.send(null);
	}

	function _loadIndividialAssets() {
		_baseURL = "assets/loader/";

		_loader = new Loader();
		_loader.baseUrl = _baseURL;

		for (i in 0 ... 50) _loader.add("img" + (i + 1), (i + 1) + ".png");
		_loader.on("progress", _onLoadProgress);
		_loader.load(_onLoaded);
	}

	function _onLoadProgress() {
		_label.text = "Loaded: " + Math.round(_loader.progress) + "%";
	}

	function _onLoaded() {
		_loadTime = Date.now().getTime() - _startTime;
		_label.text += "\nLoad Time: " + (_loadTime / 1000) + " secs";

		var _container:Container = new Container();
		stage.addChild(_container);
		for (i in 0 ... 10) {
			_img = new Sprite(Texture.fromImage(_baseURL + (i + 1) + ".png"));
			_img.name = "img" + (i + 1);
			if (i < 6) _img.position.set(128 * i, 0);
			else _img.position.set(128 * (i - 5), 128);
			_container.addChild(_img);
		}
		_container.position.set((Browser.window.innerWidth - _container.width) / 2, (Browser.window.innerHeight - _container.height) / 2);
	}

	static function main() {
		new Main();
	}
}

@:native("Bytes")
extern class Bytes {

	var position:Int;
	var remainingLength:Int;
	var length:Int;

	function new(s:String, pos:Int);

	function readByte():Bool;

	public function readUInt32BE():Bool;

	public function readUInt16BE():Bool;

	public function readString(size:Int):String;

	public function readBlob(size:Int, opts:Dynamic):Blob;

	public function readBytes(size:Int):Uint8Array;

	public function setPosition(value:Int):Void;
}