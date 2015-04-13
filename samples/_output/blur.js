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
		this.autoResize = true;
		this.transparent = false;
		this.backgroundColor = 16777215;
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this._skipFrame = false;
	}
	,start: function(renderer,stats,parentDom) {
		if(stats == null) stats = true;
		if(renderer == null) renderer = "auto";
		var _this = window.document;
		this._canvas = _this.createElement("canvas");
		this._canvas.style.width = this.width + "px";
		this._canvas.style.height = this.height + "px";
		this._canvas.style.position = "absolute";
		if(parentDom == null) window.document.body.appendChild(this._canvas); else parentDom.appendChild(this._canvas);
		this._stage = new PIXI.Container();
		var renderingOptions = { };
		renderingOptions.view = this._canvas;
		renderingOptions.backgroundColor = this.backgroundColor;
		renderingOptions.resolution = this.pixelRatio;
		renderingOptions.antialias = this.antialias;
		renderingOptions.autoResize = this.autoResize;
		renderingOptions.transparent = this.transparent;
		if(renderer == "auto") this._renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions); else if(renderer == "canvas") this._renderer = new PIXI.CanvasRenderer(this.width,this.height,renderingOptions); else this._renderer = new PIXI.WebGLRenderer(this.width,this.height,renderingOptions);
		window.document.body.appendChild(this._renderer.view);
		if(this.autoResize) window.onresize = $bind(this,this._onWindowResize);
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
samples.filters = {};
samples.filters.blur = {};
samples.filters.blur.Main = function() {
	pixi.plugins.app.Application.call(this);
	this._init();
	this._container = new PIXI.Container();
	this._stage.addChild(this._container);
	this._container.position.set(window.innerWidth / 2,window.innerHeight / 2);
	this._bg = PIXI.Sprite.fromImage("assets/filters/depth_blur_BG.jpg");
	this._bg.anchor.set(0.5);
	this._container.addChild(this._bg);
	this._littleDudes = PIXI.Sprite.fromImage("assets/filters/depth_blur_dudes.jpg");
	this._littleDudes.anchor.set(0.5);
	this._littleDudes.y = 100;
	this._container.addChild(this._littleDudes);
	this._littleRobot = PIXI.Sprite.fromImage("assets/filters/depth_blur_moby.jpg");
	this._littleRobot.anchor.set(0.5);
	this._littleRobot.x = 120;
	this._container.addChild(this._littleRobot);
	this._blurFilter1 = new PIXI.filters.BlurFilter();
	this._blurFilter2 = new PIXI.filters.BlurFilter();
	this._littleDudes.filters = [this._blurFilter1];
	this._littleRobot.filters = [this._blurFilter2];
	this._count = 0;
};
samples.filters.blur.Main.main = function() {
	new samples.filters.blur.Main();
};
samples.filters.blur.Main.__super__ = pixi.plugins.app.Application;
samples.filters.blur.Main.prototype = $extend(pixi.plugins.app.Application.prototype,{
	_init: function() {
		this.backgroundColor = 16777215;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi.plugins.app.Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		this._count += 0.01;
		var blurAmount1 = Math.cos(this._count);
		var blurAmount2 = Math.sin(this._count);
		this._blurFilter1.blur = 20 * blurAmount1;
		this._blurFilter2.blur = 20 * blurAmount2;
		this._renderer.render(this._stage);
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
samples.filters.blur.Main.main();
})();

//# sourceMappingURL=blur.js.map