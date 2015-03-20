(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var pixi = {};
pixi.plugins = {};
pixi.plugins.app = {};
pixi.plugins.app.Application = function() {
	this._lastTime = new Date();
	this._setDefaultValues();
};
pixi.plugins.app.Application.prototype = {
	_setDefaultValues: function() {
		this.pixelRatio = 1;
		this.skipFrame = false;
		this.resize = true;
		this.backgroundColor = 0;
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this._skipFrame = false;
	}
	,start: function(renderer,stats) {
		if(stats == null) stats = true;
		if(renderer == null) renderer = "auto";
		var _this = window.document;
		this._canvas = _this.createElement("canvas");
		this._canvas.style.width = this.width + "px";
		this._canvas.style.height = this.height + "px";
		this._canvas.style.position = "absolute";
		window.document.body.appendChild(this._canvas);
		this._stage = new PIXI.Container();
		var renderingOptions = { };
		renderingOptions.view = this._canvas;
		renderingOptions.backgroundColor = this.backgroundColor;
		renderingOptions.resolution = this.pixelRatio;
		if(renderer == "auto") this._renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions); else if(renderer == "recommended") this._renderer = PIXI.autoDetectRecommendedRenderer(this.width,this.height,renderingOptions); else if(renderer == "canvas") this._renderer = new PIXI.CanvasRenderer(this.width,this.height,renderingOptions); else this._renderer = new PIXI.WebGLRenderer(this.width,this.height,renderingOptions);
		window.document.body.appendChild(this._renderer.view);
		if(this.resize) window.onresize = $bind(this,this._onWindowResize);
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		this._lastTime = new Date();
		if(stats) this._addStats();
	}
	,_onWindowResize: function(event) {
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this._renderer.resize(this.width,this.height);
		this._canvas.style.width = this.width + "px";
		this._canvas.style.height = this.height + "px";
		if(this._stats != null) {
			this._stats.domElement.style.top = "2px";
			this._stats.domElement.style.right = "2px";
		}
		if(this.onResize != null) this.onResize();
	}
	,_onRequestAnimationFrame: function() {
		if(this.skipFrame && this._skipFrame) this._skipFrame = false; else {
			this._skipFrame = true;
			this._calculateElapsedTime();
			if(this.onUpdate != null) this.onUpdate(this._elapsedTime);
			this._renderer.render(this._stage);
		}
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		if(this._stats != null) this._stats.update();
	}
	,_calculateElapsedTime: function() {
		this._currentTime = new Date();
		this._elapsedTime = this._currentTime.getTime() - this._lastTime.getTime();
		this._lastTime = this._currentTime;
	}
	,_addStats: function() {
		if(window.Stats != null) {
			var _container = window.document.createElement("div");
			window.document.body.appendChild(_container);
			this._stats = new Stats();
			this._stats.domElement.style.position = "absolute";
			this._stats.domElement.style.top = "2px";
			this._stats.domElement.style.right = "2px";
			_container.appendChild(this._stats.domElement);
			this._stats.begin();
		}
	}
};
var samples = {};
samples.retina = {};
samples.retina.Main = function() {
	pixi.plugins.app.Application.call(this);
	this._init();
};
samples.retina.Main.main = function() {
	new samples.retina.Main();
};
samples.retina.Main.__super__ = pixi.plugins.app.Application;
samples.retina.Main.prototype = $extend(pixi.plugins.app.Application.prototype,{
	_init: function() {
		this.backgroundColor = 16777215;
		this.pixelRatio = this._getPixelRatio();
		pixi.plugins.app.Application.prototype.start.call(this);
		var imgPath = "assets/retina/img" + this._getResolutionStr() + ".jpg";
		this._img = new PIXI.Sprite(PIXI.Texture.fromImage(imgPath));
		this._img.anchor.set(0.5,0.5);
		this._img.name = "img";
		this._img.position.set(window.innerWidth / 2,window.innerHeight / 2);
		this._stage.addChild(this._img);
		var style = { };
		style.fill = "#F78181";
		style.font = "12px Courier";
		this._label = new PIXI.Text(imgPath,style);
		this._label.position.set(0,0);
		this._stage.addChild(this._label);
	}
	,_getPixelRatio: function() {
		if(window.devicePixelRatio <= 1 || window.devicePixelRatio > 1 && window.devicePixelRatio < 1.5) return 1; else if(window.devicePixelRatio >= 1.5 && window.devicePixelRatio < 2) return 1.5; else if(window.devicePixelRatio >= 2 && window.devicePixelRatio < 3) return 2; else return 3;
	}
	,_getResolutionStr: function() {
		return "@" + this._getPixelRatio() + "x";
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples.retina.Main.main();
})();

//# sourceMappingURL=retina.js.map