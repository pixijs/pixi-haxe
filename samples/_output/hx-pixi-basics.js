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
	,start: function() {
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
		this._renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions);
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
samples.basics = {};
samples.basics.Main = function() {
	pixi.Application.call(this);
	this._init();
	this._bunny = new PIXI.Sprite(PIXI.Texture.fromImage("assets/basics/bunny.png"));
	this._bunny.anchor.set(0.5,0.5);
	this._bunny.scale.set(2,2);
	this._bunny.position.set(400,300);
	this._stage.addChild(this._bunny);
};
samples.basics.Main.main = function() {
	new samples.basics.Main();
};
samples.basics.Main.__super__ = pixi.Application;
samples.basics.Main.prototype = $extend(pixi.Application.prototype,{
	_init: function() {
		this.set_stats(true);
		this.backgroundColor = 13158;
		this.onUpdate = $bind(this,this._onUpdate);
		this.resize = false;
		this.width = 800;
		this.height = 600;
		pixi.Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		this._bunny.rotation += 0.1;
	}
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
samples.basics.Main.main();
})();
