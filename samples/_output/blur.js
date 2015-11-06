(function (console) { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var pixi_plugins_app_Application = function() {
	this._lastTime = new Date();
	this.pixelRatio = 1;
	this.set_skipFrame(false);
	this.autoResize = true;
	this.transparent = false;
	this.antialias = false;
	this.forceFXAA = false;
	this.roundPixels = false;
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
		if(this._fpsMeter != null) this._fpsMeter.tick();
	}
	,_calculateElapsedTime: function() {
		this._currentTime = new Date();
		this._elapsedTime = this._currentTime.getTime() - this._lastTime.getTime();
		this._lastTime = this._currentTime;
	}
	,_addStats: function() {
		if(window.FPSMeter != null) {
			this._fpsMeter = new FPSMeter(null,{ theme : "colorful", top : "14px", right : "0px", left : "auto"});
			this._addRenderStats(null);
		} else console.log("Unable to find fpsmeter.js");
	}
	,_addRenderStats: function(top) {
		if(top == null) top = 0;
		var ren;
		var _this = window.document;
		ren = _this.createElement("div");
		ren.style.position = "absolute";
		ren.style.width = "76px";
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
};
var samples_filters_blur_Main = function() {
	pixi_plugins_app_Application.call(this);
	this._init();
	this._container = new PIXI.Container();
	this.stage.addChild(this._container);
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
samples_filters_blur_Main.main = function() {
	new samples_filters_blur_Main();
};
samples_filters_blur_Main.__super__ = pixi_plugins_app_Application;
samples_filters_blur_Main.prototype = $extend(pixi_plugins_app_Application.prototype,{
	_init: function() {
		this.backgroundColor = 16777215;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi_plugins_app_Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		this._count += 0.01;
		var blurAmount1 = Math.cos(this._count);
		var blurAmount2 = Math.sin(this._count);
		this._blurFilter1.blur = 20 * blurAmount1;
		this._blurFilter2.blur = 20 * blurAmount2;
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples_filters_blur_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});

//# sourceMappingURL=blur.js.map