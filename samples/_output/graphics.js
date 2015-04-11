(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Std = function() { };
Std["int"] = function(x) {
	return x | 0;
};
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
samples.graphics = {};
samples.graphics.Main = function() {
	pixi.plugins.app.Application.call(this);
	this._init();
};
samples.graphics.Main.main = function() {
	new samples.graphics.Main();
};
samples.graphics.Main.__super__ = pixi.plugins.app.Application;
samples.graphics.Main.prototype = $extend(pixi.plugins.app.Application.prototype,{
	_init: function() {
		this.backgroundColor = 0;
		this.antialias = true;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi.plugins.app.Application.prototype.start.call(this);
		this._graphics = new PIXI.Graphics();
		this._graphics.beginFill(16724736);
		this._graphics.lineStyle(10,16767232,1);
		this._graphics.moveTo(50,50);
		this._graphics.lineTo(250,50);
		this._graphics.lineTo(100,100);
		this._graphics.lineTo(250,220);
		this._graphics.lineTo(50,220);
		this._graphics.lineTo(50,50);
		this._graphics.endFill();
		this._graphics.lineStyle(10,16711680,0.8);
		this._graphics.beginFill(16740363,1);
		this._graphics.moveTo(210,300);
		this._graphics.lineTo(450,320);
		this._graphics.lineTo(570,350);
		this._graphics.lineTo(580,20);
		this._graphics.lineTo(330,120);
		this._graphics.lineTo(410,200);
		this._graphics.lineTo(210,300);
		this._graphics.endFill();
		this._graphics.lineStyle(2,255,1);
		this._graphics.drawRect(50,250,100,100);
		this._graphics.lineStyle(0);
		this._graphics.beginFill(16776971,0.5);
		this._graphics.drawCircle(470,200,100);
		this._graphics.lineStyle(20,3407616);
		this._graphics.moveTo(30,30);
		this._graphics.lineTo(600,300);
		this._stage.addChild(this._graphics);
		this._thing = new PIXI.Graphics();
		this._stage.addChild(this._thing);
		this._thing.position.x = window.innerWidth / 2;
		this._thing.position.y = window.innerHeight / 2;
		this._count = 0;
		this._stage.interactive = true;
		this._stage.on("click",$bind(this,this._onStageClick));
		this._stage.on("tap",$bind(this,this._onStageClick));
	}
	,_onUpdate: function(elapsedTime) {
		this._count += 0.1;
		this._thing.clear();
		this._thing.lineStyle(30,16711680,1);
		this._thing.beginFill(16711680,0.5);
		this._thing.moveTo(-120 + Math.sin(this._count) * 20,-100 + Math.cos(this._count) * 20);
		this._thing.lineTo(120 + Math.cos(this._count) * 20,-100 + Math.sin(this._count) * 20);
		this._thing.lineTo(120 + Math.sin(this._count) * 20,100 + Math.cos(this._count) * 20);
		this._thing.lineTo(-120 + Math.cos(this._count) * 20,100 + Math.sin(this._count) * 20);
		this._thing.lineTo(-120 + Math.sin(this._count) * 20,-100 + Math.cos(this._count) * 20);
		this._thing.rotation = this._count * 0.1;
	}
	,_onStageClick: function(target) {
		this._graphics.lineStyle(Math.random() * 30,Std["int"](Math.random() * 16777215),1);
		this._graphics.moveTo(Math.random() * 620,Math.random() * 380);
		this._graphics.lineTo(Math.random() * 620,Math.random() * 380);
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
samples.graphics.Main.main();
})();

//# sourceMappingURL=graphics.js.map