(function (console) { "use strict";
var HxOverrides = function() { };
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) return undefined;
	return x;
};
var StringTools = function() { };
StringTools.replace = function(s,sub,by) {
	return s.split(sub).join(by);
};
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
		this._videoElement.src = "http://93.93.85.123:1935/live/amlst:1/playlist.m3u8";
		window.document.body.appendChild(this._wrapper);
		this._wrapper.appendChild(this._videoElement);
		this._wrapper.appendChild(this._renderer.view);
		this._renderer.view.style.position = "absolute";
		window.requestAnimationFrame($bind(this,this._animate));
		this._playBtn = new PIXI.Sprite(PIXI.Texture.fromImage("assets/stream/play.png"));
		this._playBtn.width = 400;
		this._playBtn.height = 400;
		this._playBtn.interactive = true;
		this._stage.addChild(this._playBtn);
		this._playBtn.tap = $bind(this,this._onTap);
		this._playBtn.click = $bind(this,this._onTap);
		this._timer = new haxe_Timer(1000);
		var _this2 = window.document;
		this._canvas = _this2.createElement("canvas");
		this._canvas.id = "video_canvas";
		this._canvas.style.position = "absolute";
		this._canvas.style.backgroundColor = "#FFFFFF";
		this._canvas.style.left = "0px";
		this._canvas.style.top = "500px";
		this._canvas.width = 400;
		this._canvas.height = 16;
		this._wrapper.appendChild(this._canvas);
		this._context = this._canvas.getContext("2d",null);
		this.subtitlePlaylistUrl = null;
		this.movie = "1_400_400_750000";
	}
	,_onTap: function(data) {
		var _g = this;
		this._playBtn.visible = false;
		this._videoElement.play();
		this._timer.run = $bind(this,this._draw);
		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if(request.readyState == 4) {
				var playlist = request.responseText;
				var lines = playlist.split("\n");
				var subtitles = lines[2].split(",");
				var uri = subtitles[5].split("=");
				uri[1] = StringTools.replace(uri[1],"\"","");
				_g.subtitlePlaylistUrl = "http://93.93.85.123:1935/live/" + _g.movie + "/" + uri[1];
			}
		};
		var url = "http://93.93.85.123:1935/live/" + this.movie + "/playlist.m3u8";
		request.open("GET",url,true);
		request.send(null);
	}
	,_draw: function() {
		var _g = this;
		if(this._videoElement.paused || this._videoElement.ended) return;
		this._context.drawImage(this._videoElement,0,384,400,16,0,0,400,16);
		var textTrack = null;
		var _g1 = 0;
		var _g2 = this._videoElement.textTracks.length;
		while(_g1 < _g2) {
			var i = _g1++;
			if(this._videoElement.textTracks[i].kind == "captions") {
				textTrack = this._videoElement.textTracks[i];
				textTrack.mode = "hidden";
				textTrack.oncuechange = function() {
					if(textTrack.activeCues.length > 0) {
						var _g3 = 0;
						var _g21 = textTrack.activeCues.length;
						while(_g3 < _g21) {
							var j = _g3++;
							var cue = textTrack.activeCues[j].text;
						}
					}
				};
			}
		}
		var subtitleRequest = new XMLHttpRequest();
		var subtitlePlaylistRequest = new XMLHttpRequest();
		subtitleRequest.onreadystatechange = function() {
			if(subtitleRequest.readyState == 4) {
				var playlist = subtitleRequest.responseText;
				var lines = playlist.split("\n");
				if(lines != null && lines[4] != null && HxOverrides.cca(lines[4],0) != 160) console.log(JSON.parse(lines[4]).type);
			}
		};
		subtitlePlaylistRequest.onreadystatechange = function() {
			if(subtitlePlaylistRequest.readyState == 4) {
				var playlist1 = subtitlePlaylistRequest.responseText;
				var lines1 = playlist1.split("\n");
				var webVTT = lines1[5];
				var subtitleUrl = "http://93.93.85.123:1935/live/" + _g.movie + "/" + webVTT;
				subtitleRequest.open("GET",subtitleUrl,true);
				subtitleRequest.send(null);
			}
		};
		if(this.subtitlePlaylistUrl != null) {
			subtitlePlaylistRequest.open("GET",this.subtitlePlaylistUrl,true);
			subtitlePlaylistRequest.send(null);
		}
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