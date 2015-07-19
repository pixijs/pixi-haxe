(function (console) { "use strict";
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
haxe_Timer.prototype = {
	run: function() {
	}
};
var samples_stream_Main = function() {
	this._init();
};
samples_stream_Main.main = function() {
	new samples_stream_Main();
};
samples_stream_Main.prototype = {
	_init: function() {
		var options = { };
		options.backgroundColor = 13158;
		options.resolution = 1;
		options.transparent = true;
		this._stage = new PIXI.Container();
		this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight,options);
		var _this = window.document;
		this._wrapper = _this.createElement("div");
		var _this1 = window.document;
		this._videoElement = _this1.createElement("video");
		this._videoElement.id = "videoWheel";
		this._videoElement.style.position = "absolute";
		this._videoElement.style.top = "0px";
		this._videoElement.autoplay = false;
		this._videoElement.width = 480;
		this._videoElement.height = 270;
		this._videoElement.src = "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";
		window.document.body.appendChild(this._wrapper);
		this._wrapper.appendChild(this._videoElement);
		this._wrapper.appendChild(this._renderer.view);
		this._renderer.view.style.position = "absolute";
		window.requestAnimationFrame($bind(this,this._animate));
		this._playBtn = new PIXI.Sprite(PIXI.Texture.fromImage("assets/stream/play.png"));
		this._playBtn.interactive = true;
		this._stage.addChild(this._playBtn);
		this._playBtn.tap = $bind(this,this._onTap);
		this._playBtn.click = $bind(this,this._onTap);
		this._timer = new haxe_Timer(500);
		var _this2 = window.document;
		this._canvas = _this2.createElement("canvas");
		this._canvas.id = "video_canvas";
		this._canvas.style.position = "absolute";
		this._canvas.style.backgroundColor = "#000000";
		this._canvas.style.left = "0px";
		this._canvas.style.top = "280px";
		this._canvas.width = 480;
		this._canvas.height = 50;
		this._wrapper.appendChild(this._canvas);
		this._context = this._canvas.getContext("2d",null);
	}
	,_onTap: function(data) {
		this._playBtn.visible = false;
		this._videoElement.play();
		this._timer.run = $bind(this,this._draw);
	}
	,_draw: function() {
		if(this._videoElement.paused || this._videoElement.ended) return;
		this._context.drawImage(this._videoElement,0,200,480,50,0,0,480,50);
	}
	,_animate: function() {
		window.requestAnimationFrame($bind(this,this._animate));
		this._renderer.render(this._stage);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples_stream_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});

//# sourceMappingURL=stream.js.map