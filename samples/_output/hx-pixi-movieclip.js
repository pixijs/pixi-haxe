(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Std = function() { };
Std.random = function(x) {
	if(x <= 0) return 0; else return Math.floor(Math.random() * x);
};
var pixi = {};
pixi.Application = function() {
	this._lastTime = new Date();
	this._setDefaultValues();
};
pixi.Application.prototype = {
	_setDefaultValues: function() {
		this.pixelRatio = 1;
		this.skipFrame = false;
		this.set_stats(false);
		this.backgroundColor = 16777215;
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.resize = true;
		this._skipFrame = false;
	}
	,start: function(renderer) {
		if(renderer == null) renderer = "auto";
		var _this = window.document;
		this._canvas = _this.createElement("canvas");
		this._canvas.style.width = this.width + "px";
		this._canvas.style.height = this.height + "px";
		this._canvas.style.position = "absolute";
		window.document.body.appendChild(this._canvas);
		this._stage = new PIXI.Stage(this.backgroundColor);
		var renderingOptions = { };
		renderingOptions.view = this._canvas;
		renderingOptions.resolution = this.pixelRatio;
		if(renderer == "auto") this._renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions); else if(renderer == "recommended") this._renderer = PIXI.autoDetectRecommendedRenderer(this.width,this.height,renderingOptions); else if(renderer == "canvas") this._renderer = new PIXI.CanvasRenderer(this.width,this.height,renderingOptions); else this._renderer = new PIXI.WebGLRenderer(this.width,this.height,renderingOptions);
		window.document.body.appendChild(this._renderer.view);
		if(this.resize) window.onresize = $bind(this,this._onWindowResize);
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		this._lastTime = new Date();
	}
	,_onWindowResize: function(event) {
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this._renderer.resize(this.width,this.height);
		this._canvas.style.width = this.width + "px";
		this._canvas.style.height = this.height + "px";
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
	,set_stats: function(val) {
		if(val) {
			var _container = window.document.createElement("div");
			window.document.body.appendChild(_container);
			this._stats = new Stats();
			this._stats.domElement.style.position = "absolute";
			this._stats.domElement.style.top = "2px";
			this._stats.domElement.style.right = "2px";
			_container.appendChild(this._stats.domElement);
			this._stats.begin();
		}
		return this.stats = val;
	}
};
pixi.display = {};
pixi.display.DisplayObject = function() {
	PIXI.DisplayObject.call(this);
	this.name = "";
};
pixi.display.DisplayObject.__super__ = PIXI.DisplayObject;
pixi.display.DisplayObject.prototype = $extend(PIXI.DisplayObject.prototype,{
});
pixi.display.DisplayObjectContainer = function() {
	PIXI.DisplayObjectContainer.call(this);
};
pixi.display.DisplayObjectContainer.__super__ = PIXI.DisplayObjectContainer;
pixi.display.DisplayObjectContainer.prototype = $extend(PIXI.DisplayObjectContainer.prototype,{
});
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.movieclip = {};
samples.movieclip.Main = function() {
	pixi.Application.call(this);
	this._init();
	var assetsToLoader = ["assets/movieclip/SpriteSheet.json"];
	this._loader = new PIXI.AssetLoader(assetsToLoader);
	this._loader.onComplete = $bind(this,this.onAssetsLoaded);
	this._loader.load();
};
samples.movieclip.Main.main = function() {
	new samples.movieclip.Main();
};
samples.movieclip.Main.__super__ = pixi.Application;
samples.movieclip.Main.prototype = $extend(pixi.Application.prototype,{
	_init: function() {
		this.set_stats(true);
		this.backgroundColor = 65382;
		this.onUpdate = $bind(this,this._onUpdate);
		this.resize = false;
		this.width = 800;
		this.height = 600;
		pixi.Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		this._renderer.render(this._stage);
	}
	,onAssetsLoaded: function() {
		var explosionTextures = [];
		var texture;
		var _g = 0;
		while(_g < 26) {
			var i = _g++;
			texture = PIXI.Texture.fromFrame("Explosion_Sequence_A " + (i + 1) + ".png");
			explosionTextures.push(texture);
		}
		var explosion;
		var _g1 = 0;
		while(_g1 < 50) {
			var i1 = _g1++;
			explosion = new PIXI.MovieClip(explosionTextures);
			explosion.position.x = Math.random() * 800;
			explosion.position.y = Math.random() * 600;
			explosion.anchor.x = 0.5;
			explosion.anchor.y = 0.5;
			explosion.rotation = Math.random() * Math.PI;
			explosion.scale.x = explosion.scale.y = 0.75 + Math.random() * 0.5;
			explosion.gotoAndPlay(Std.random(27));
			explosion.animationSpeed = 0.8;
			this._stage.addChild(explosion);
		}
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
samples.movieclip.Main.main();
})();
