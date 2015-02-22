(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
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
samples.colourmatrix = {};
samples.colourmatrix.Main = function() {
	pixi.Application.call(this);
	this._init();
	this._stage.interactive = true;
	this._bg = PIXI.Sprite.fromImage("assets/filters/BGrotate.jpg");
	this._bg.anchor.set(0.5,0.5);
	this._bg.x = window.innerWidth / 2;
	this._bg.y = window.innerHeight / 2;
	this._colorMatrix = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
	this._filter = new PIXI.ColorMatrixFilter();
	this._container = new pixi.display.DisplayObjectContainer();
	this._container.x = window.innerWidth / 2;
	this._container.y = window.innerHeight / 2;
	this._bgFront = PIXI.Sprite.fromImage("assets/filters/SceneRotate.jpg");
	this._bgFront.anchor.set(0.5,0.5);
	this._container.addChild(this._bgFront);
	this._light2 = PIXI.Sprite.fromImage("assets/filters/LightRotate2.png");
	this._light2.anchor.set(0.5,0.5);
	this._container.addChild(this._light2);
	this._light1 = PIXI.Sprite.fromImage("assets/filters/LightRotate1.png");
	this._light1.anchor.set(0.5,0.5);
	this._container.addChild(this._light1);
	this._panda = PIXI.Sprite.fromImage("assets/filters/panda.png");
	this._panda.anchor.set(0.5,0.5);
	this._container.addChild(this._panda);
	this._stage.addChild(this._container);
	this._count = 0;
	this._switchy = false;
	this._stage.filters = [this._filter];
	this._stage.click = this._stage.tap = $bind(this,this._onClick);
	var style = { font : "bold 12pt Arial", fill : "#FFFFFF"};
	var help = new PIXI.Text("Click to turn filters on / off.",style);
	this._stage.addChild(help);
};
samples.colourmatrix.Main.main = function() {
	new samples.colourmatrix.Main();
};
samples.colourmatrix.Main.__super__ = pixi.Application;
samples.colourmatrix.Main.prototype = $extend(pixi.Application.prototype,{
	_init: function() {
		this.backgroundColor = 65382;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi.Application.prototype.start.call(this);
		this.set_stats(true);
	}
	,_onUpdate: function(elapsedTime) {
		this._count += 0.01;
		this._bg.rotation += 0.01;
		this._bgFront.rotation -= 0.01;
		this._light1.rotation += 0.02;
		this._light2.rotation += 0.01;
		this._panda.scale.x = 1 + Math.sin(this._count) * 0.04;
		this._panda.scale.y = 1 + Math.cos(this._count) * 0.04;
		this._count += 0.1;
		this._colorMatrix[1] = Math.sin(this._count) * 3;
		this._colorMatrix[2] = Math.cos(this._count);
		this._colorMatrix[3] = Math.cos(this._count) * 1.5;
		this._colorMatrix[4] = Math.sin(this._count / 3) * 2;
		this._colorMatrix[5] = Math.sin(this._count / 2);
		this._colorMatrix[6] = Math.sin(this._count / 4);
		this._filter.matrix = this._colorMatrix;
	}
	,_onClick: function(data) {
		this._switchy = !this._switchy;
		if(!this._switchy) this._stage.filters = [this._filter]; else this._stage.filters = null;
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
samples.colourmatrix.Main.main();
})();
