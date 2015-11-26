(function (console) { "use strict";
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
var jsfps_simplefps_Fps = function(callback,every,decay) {
	if(decay == null) decay = 1;
	if(every == null) every = 60;
	this._callback = callback;
	this.rate = 60;
	this._time = 0;
	this._decay = decay;
	this._every = every;
	this._ticks = 0;
	this._last = this._now();
};
jsfps_simplefps_Fps.prototype = {
	_now: function() {
		if(window.performance != null) return window.performance.now();
		return new Date().getTime();
	}
	,tick: function() {
		var time = this._now();
		var diff = time - this._last;
		this._ticks += 1;
		this._last = time;
		this._time += (diff - this._time) * this._decay;
		this.rate = Math.round(1000 / this._time);
		if(this.rate > 60) this.rate = 60;
		if(this._ticks % this._every == 0 && this._callback != null) this._callback(this.rate);
	}
};
var pixi_plugins_app_Application = function() {
	this._lastTime = new Date();
	this.pixelRatio = 1;
	this.set_skipFrame(false);
	this.autoResize = true;
	this.transparent = false;
	this.antialias = false;
	this.forceFXAA = false;
	this.roundPixels = false;
	this.clearBeforeRender = true;
	this.preserveDrawingBuffer = false;
	this.backgroundColor = 16777215;
	this.width = window.innerWidth;
	this.height = window.innerHeight;
	this.set_fps(60);
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
	,start: function(rendererType,parentDom) {
		if(rendererType == null) rendererType = "auto";
		var _this = window.document;
		this.canvas = _this.createElement("canvas");
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		this.canvas.style.position = "absolute";
		if(parentDom == null) window.document.body.appendChild(this.canvas); else parentDom.appendChild(this.canvas);
		this.stage = new PIXI.Container();
		var renderingOptions = { };
		renderingOptions.view = this.canvas;
		renderingOptions.backgroundColor = this.backgroundColor;
		renderingOptions.resolution = this.pixelRatio;
		renderingOptions.antialias = this.antialias;
		renderingOptions.forceFXAA = this.forceFXAA;
		renderingOptions.autoResize = this.autoResize;
		renderingOptions.transparent = this.transparent;
		renderingOptions.clearBeforeRender = this.clearBeforeRender;
		renderingOptions.preserveDrawingBuffer = this.preserveDrawingBuffer;
		if(rendererType == "auto") this.renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions); else if(rendererType == "canvas") this.renderer = new PIXI.CanvasRenderer(this.width,this.height,renderingOptions); else this.renderer = new PIXI.WebGLRenderer(this.width,this.height,renderingOptions);
		if(this.roundPixels) this.renderer.roundPixels = true;
		window.document.body.appendChild(this.renderer.view);
		if(this.autoResize) window.onresize = $bind(this,this._onWindowResize);
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		this._lastTime = new Date();
		this._addStats();
	}
	,_onWindowResize: function(event) {
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.renderer.resize(this.width,this.height);
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		if(this.onResize != null) this.onResize();
	}
	,_onRequestAnimationFrame: function() {
		this._frameCount++;
		if(this._frameCount == (60 / this.fps | 0)) {
			this._frameCount = 0;
			this._calculateElapsedTime();
			if(this.onUpdate != null) this.onUpdate(this._elapsedTime);
			this.renderer.render(this.stage);
		}
		window.requestAnimationFrame($bind(this,this._onRequestAnimationFrame));
		this._fps.tick();
	}
	,_calculateElapsedTime: function() {
		this._currentTime = new Date();
		this._elapsedTime = this._currentTime.getTime() - this._lastTime.getTime();
		this._lastTime = this._currentTime;
	}
	,_addStats: function() {
		this._fps = new jsfps_simplefps_Fps($bind(this,this._updateFps));
		var _this = window.document;
		this._fpsDiv = _this.createElement("div");
		this._fpsDiv.id = "fps";
		this._fpsDiv.className = "fps";
		this._fpsDiv.style.position = "absolute";
		this._fpsDiv.style.right = "0px";
		this._fpsDiv.style.top = "14px";
		this._fpsDiv.style.width = "76px";
		this._fpsDiv.style.background = "#CCCCC";
		this._fpsDiv.style.backgroundColor = "#00FF00";
		this._fpsDiv.style.fontFamily = "Helvetica,Arial";
		this._fpsDiv.style.padding = "2px";
		this._fpsDiv.style.color = "#000000";
		this._fpsDiv.style.fontSize = "9px";
		this._fpsDiv.style.fontWeight = "bold";
		this._fpsDiv.style.textAlign = "center";
		this._fpsDiv.innerHTML = "FPS: 60";
		window.document.body.appendChild(this._fpsDiv);
		this._addRenderStats(null);
	}
	,_addRenderStats: function(top) {
		if(top == null) top = 0;
		var ren;
		var _this = window.document;
		ren = _this.createElement("div");
		ren.style.position = "absolute";
		ren.style.width = "76px";
		ren.style.top = top + "px";
		ren.style.right = "0px";
		ren.style.background = "#CCCCC";
		ren.style.backgroundColor = "#105CB6";
		ren.style.fontFamily = "Helvetica,Arial";
		ren.style.padding = "2px";
		ren.style.color = "#0FF";
		ren.style.fontSize = "9px";
		ren.style.fontWeight = "bold";
		ren.style.textAlign = "center";
		window.document.body.appendChild(ren);
		ren.innerHTML = ["UNKNOWN","WEBGL","CANVAS"][this.renderer.type] + " - " + this.pixelRatio;
	}
	,_updateFps: function(val) {
		this._fpsDiv.innerHTML = "FPS: " + val;
	}
};
var samples_graphics_Main = function() {
	pixi_plugins_app_Application.call(this);
	this._init();
};
samples_graphics_Main.main = function() {
	new samples_graphics_Main();
};
samples_graphics_Main.__super__ = pixi_plugins_app_Application;
samples_graphics_Main.prototype = $extend(pixi_plugins_app_Application.prototype,{
	_init: function() {
		this.backgroundColor = 13158;
		this.antialias = true;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi_plugins_app_Application.prototype.start.call(this);
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
		this.stage.addChild(this._graphics);
		this._thing = new PIXI.Graphics();
		this.stage.addChild(this._thing);
		this._thing.position.x = window.innerWidth / 2;
		this._thing.position.y = window.innerHeight / 2;
		this._count = 0;
		this.stage.interactive = true;
		this.stage.on("click",$bind(this,this._onStageClick));
		this.stage.on("tap",$bind(this,this._onStageClick));
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
samples_graphics_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});

//# sourceMappingURL=graphics.js.map