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
		window.onresize = $bind(this,this._onWindowResize);
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
samples.rendertexture = {};
samples.rendertexture.Main = function() {
	pixi.Application.call(this);
	this._init();
	this._renderTexture1 = new PIXI.RenderTexture(this.width,this.height);
	this._renderTexture2 = new PIXI.RenderTexture(this.width,this.height);
	this._currentTexture = this._renderTexture1;
	this._outputSprite = new PIXI.Sprite(this._currentTexture);
	this._outputSprite.position.x = this.width / 2;
	this._outputSprite.position.y = this.height / 2;
	this._outputSprite.anchor.set(0.5,0.5);
	this._stage.addChild(this._outputSprite);
	this._bunnyContainer = new pixi.display.DisplayObjectContainer();
	this._bunnyContainer.position.x = this.width / 2;
	this._bunnyContainer.position.y = this.height / 2;
	this._stage.addChild(this._bunnyContainer);
	var fruits = ["assets/rendertexture/spinObj_01.png","assets/rendertexture/spinObj_02.png","assets/rendertexture/spinObj_03.png","assets/rendertexture/spinObj_04.png","assets/rendertexture/spinObj_05.png","assets/rendertexture/spinObj_06.png","assets/rendertexture/spinObj_07.png","assets/rendertexture/spinObj_08.png"];
	this._bunnys = [];
	var bunny;
	var _g = 0;
	while(_g < 20) {
		var i = _g++;
		bunny = PIXI.Sprite.fromImage(fruits[i % fruits.length]);
		bunny.position.x = Math.random() * 400 - 200;
		bunny.position.y = Math.random() * 400 - 200;
		bunny.anchor.set(0.5,0.5);
		this._bunnyContainer.addChild(bunny);
		this._bunnys.push(bunny);
	}
	this._count1 = 0;
	this._score = 0;
	this._count2 = 0;
};
samples.rendertexture.Main.main = function() {
	new samples.rendertexture.Main();
};
samples.rendertexture.Main.__super__ = pixi.Application;
samples.rendertexture.Main.prototype = $extend(pixi.Application.prototype,{
	_init: function() {
		this.set_stats(true);
		this.backgroundColor = 65280;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi.Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		var _g1 = 0;
		var _g = this._bunnys.length;
		while(_g1 < _g) {
			var i = _g1++;
			var bunny = this._bunnys[i];
			bunny.rotation += 0.1;
		}
		this._count1 += 0.01;
		this._count2++;
		var temp = this._renderTexture1;
		this._renderTexture1 = this._renderTexture2;
		this._renderTexture2 = temp;
		this._bunnyContainer.rotation -= 0.01;
		this._renderTexture1.render(this._stage,null,true);
		this._outputSprite.setTexture(this._renderTexture1);
		this._outputSprite.scale.x = this._outputSprite.scale.y = 1 + Math.sin(this._count1) * 0.2;
		this._renderTexture2.render(this._stage,null,false);
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
samples.rendertexture.Main.main();
})();
