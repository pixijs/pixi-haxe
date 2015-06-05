(function (console) { "use strict";
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
var pixi_plugins_app_Application = function() {
	this._lastTime = new Date();
	this._setDefaultValues();
};
pixi_plugins_app_Application.prototype = {
	set_fps: function(val) {
		this._frameCount = 0;
		return val >= 1 && val < 60?this.fps = val | 0:this.fps = 60;
	}
	,set_skipFrame: function(val) {
		if(val) {
			console.log("pixi.plugins.app.Application > Deprecated: skipFrame - use fps property and set it to 30 instead");
			this.set_fps(30);
		}
		return this.skipFrame = val;
	}
	,_setDefaultValues: function() {
		this.pixelRatio = 1;
		this.set_skipFrame(false);
		this.autoResize = true;
		this.transparent = false;
		this.antialias = false;
		this.forceFXAA = false;
		this.backgroundColor = 16777215;
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.set_fps(60);
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
		renderingOptions.forceFXAA = this.forceFXAA;
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
		this._frameCount++;
		if(this._frameCount == (60 / this.fps | 0)) {
			this._frameCount = 0;
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
var samples_spritesheet_Main = function() {
	pixi_plugins_app_Application.call(this);
	this._init();
};
samples_spritesheet_Main.main = function() {
	new samples_spritesheet_Main();
};
samples_spritesheet_Main.__super__ = pixi_plugins_app_Application;
samples_spritesheet_Main.prototype = $extend(pixi_plugins_app_Application.prototype,{
	_init: function() {
		this.onUpdate = $bind(this,this._onUpdate);
		pixi_plugins_app_Application.prototype.start.call(this,"auto");
		this._loader = new PIXI.loaders.Loader();
		this._loader.baseUrl = "assets/spritesheet/";
		this._loader.add("fighter","fighter.json");
		this._loader.load($bind(this,this._onLoaded));
	}
	,_onLoaded: function() {
		this._count = 0;
		this._isAdding = false;
		this._fighterTextures = [];
		var _g = 0;
		while(_g < 29) {
			var i = _g++;
			var frame = "" + i;
			if(i < 10) frame = "0" + frame;
			this._fighterTextures.push(PIXI.Texture.fromFrame("rollSequence00" + frame + ".png"));
		}
		this._renderer.view.onmouseup = $bind(this,this._onTouchEnd);
		window.document.addEventListener("touchend",$bind(this,this._onTouchEnd),true);
		this._renderer.view.onmousedown = $bind(this,this._onTouchStart);
		window.document.addEventListener("touchstart",$bind(this,this._onTouchStart),true);
		this._addCounter();
		this._addFighter(window.innerWidth / 2,window.innerHeight / 2);
	}
	,_onTouchStart: function(event) {
		this._isAdding = true;
	}
	,_onTouchEnd: function(event) {
		this._isAdding = false;
	}
	,_onUpdate: function(elapsedTime) {
		if(this._isAdding) this._addFighter(Std.random(window.innerWidth),Std.random(window.innerHeight));
	}
	,_addFighter: function(x,y) {
		var fighter = new PIXI.extras.MovieClip(this._fighterTextures);
		fighter.anchor.set(0.5);
		fighter.position.set(x,y);
		fighter.play();
		this._stage.addChild(fighter);
		this._count++;
		this._counter.innerHTML = this._count + " SPRITES";
	}
	,_addCounter: function() {
		var _this = window.document;
		this._counter = _this.createElement("div");
		this._counter.style.position = "absolute";
		this._counter.style.top = "1px";
		this._counter.style.left = "1px";
		this._counter.style.width = "90px";
		this._counter.style.background = "#CCCCC";
		this._counter.style.backgroundColor = "#105CB6";
		this._counter.style.fontFamily = "Helvetica,Arial";
		this._counter.style.padding = "3px";
		this._counter.style.color = "#0FF";
		this._counter.style.fontSize = "10px";
		this._counter.style.fontWeight = "bold";
		this._counter.style.textAlign = "center";
		this._counter.className = "counter";
		window.document.body.appendChild(this._counter);
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples_spritesheet_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});

//# sourceMappingURL=spritesheet.js.map