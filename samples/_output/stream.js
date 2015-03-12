(function () { "use strict";
var samples = {};
samples.stream = {};
samples.stream.Main = function() {
	this._init();
};
samples.stream.Main.main = function() {
	new samples.stream.Main();
};
samples.stream.Main.prototype = {
	_init: function() {
		var options = { };
		options.backgroundColor = 13158;
		options.resolution = 1;
		this._stage = new PIXI.Container();
		this._renderer = PIXI.autoDetectRenderer(1024,648,options);
		this._wrapper = window.document.getElementById("game");
		var _this = window.document;
		this._videoElement = _this.createElement("video");
		this._videoElement.id = "videoWheel";
		this._videoElement.style.position = "absolute";
		this._videoElement.style.top = "0px";
		this._videoElement.autoplay = true;
		this._videoElement.src = "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8";
		window.document.body.appendChild(this._wrapper);
		this._wrapper.appendChild(this._renderer.view);
		this._renderer.view.style.position = "absolute";
		this._wrapper.appendChild(this._videoElement);
		window.requestAnimationFrame($bind(this,this._animate));
		this._bunny = new PIXI.Sprite(PIXI.Texture.fromImage("assets/basics/bunny.png"));
		this._bunny.anchor.set(0.5,0.5);
		this._bunny.scale.set(4,4);
		this._bunny.position.set(550,450);
		this._bunny.interactive = true;
		this._stage.addChild(this._bunny);
		this._bunny.on("tap",$bind(this,this._onTap));
	}
	,_onTap: function(data) {
		this._videoElement.play();
	}
	,_animate: function() {
		window.requestAnimationFrame($bind(this,this._animate));
		this._renderer.render(this._stage);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples.stream.Main.main();
})();

//# sourceMappingURL=stream.js.map