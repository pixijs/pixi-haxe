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
		this.backgroundColor = 16777215;
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.resize = true;
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
		this._stage = new PIXI.Stage(this.backgroundColor);
		var renderingOptions = { };
		renderingOptions.view = this._canvas;
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
	getChildByName: function(name) {
		var _g1 = 0;
		var _g = this.children.length;
		while(_g1 < _g) {
			var i = _g1++;
			if(this.children[i].name == name) return this.children[i];
		}
		return null;
	}
});
pixi.renderers = {};
pixi.renderers.IRenderer = function() { };
var samples = {};
samples.bunnymark = {};
samples.bunnymark.Bunny = function(texture) {
	PIXI.Sprite.call(this,texture);
};
samples.bunnymark.Bunny.__super__ = PIXI.Sprite;
samples.bunnymark.Bunny.prototype = $extend(PIXI.Sprite.prototype,{
});
samples.bunnymark.Main = function() {
	var _g = this;
	pixi.Application.call(this);
	this._init();
	this._sprites = [];
	this._add = false;
	this._minX = this._minY = 0;
	this._maxX = window.innerWidth;
	this._maxY = window.innerHeight;
	this._bunnyTexture = PIXI.Texture.fromImage("assets/basics/bunny.png");
	this._quantityLabel = new PIXI.Text("Press/Touch and hold to add bunnies continuously",{ font : "15px Tahoma", fill : "#FFFFFF"});
	this._stage.addChild(this._quantityLabel);
	this._stage.mousedown = this._stage.touchstart = function(data) {
		_g._add = true;
	};
	this._stage.mouseup = this._stage.touchend = function(data1) {
		_g._add = false;
	};
	this._container = new pixi.display.DisplayObjectContainer();
	this._stage.addChild(this._container);
};
samples.bunnymark.Main.main = function() {
	new samples.bunnymark.Main();
};
samples.bunnymark.Main.__super__ = pixi.Application;
samples.bunnymark.Main.prototype = $extend(pixi.Application.prototype,{
	_init: function() {
		this.backgroundColor = 13158;
		this.onUpdate = $bind(this,this._onUpdate);
		pixi.Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		if(this._add) this._addBunnys();
		var _g1 = 0;
		var _g = this._sprites.length;
		while(_g1 < _g) {
			var i = _g1++;
			var bunny = this._sprites[i];
			bunny.position.x += bunny.speedX;
			bunny.position.y += bunny.speedY;
			bunny.speedY += 2;
			if(bunny.position.x > this._maxX) {
				bunny.speedX *= -1;
				bunny.position.x = this._maxX;
			} else if(bunny.position.x < this._minX) {
				bunny.speedX *= -1;
				bunny.position.x = this._minX;
			}
			if(bunny.position.y > this._maxY) {
				bunny.speedY *= -0.9;
				bunny.position.y = this._maxY;
				if(Math.random() > 0.5) bunny.speedY -= Math.random() * 6;
			} else if(bunny.position.y < this._minY) {
				bunny.speedY = 0;
				bunny.position.y = this._minY;
			}
		}
	}
	,_addBunnys: function() {
		var _g = 0;
		while(_g < 10) {
			var i = _g++;
			this._bunny = new samples.bunnymark.Bunny(this._bunnyTexture);
			this._bunny.name = "bunny" + i;
			this._container.addChild(this._bunny);
			this._bunny.x = Std.random(this._maxX);
			this._bunny.y = Std.random(this._maxY);
			this._bunny.anchor.set(0.5,0.5);
			this._bunny.speedX = Math.random() * 16 + 2;
			this._bunny.speedY = Math.random() * 16 - 10;
			this._bunny.rotationSpeed = Math.random() / 50 + 0.01;
			this._bunny.scaleSpeed = Math.random() / 50 + 0.01;
			this._sprites.push(this._bunny);
		}
		this._updateQuanityLabel();
	}
	,_updateQuanityLabel: function() {
		this._quantityLabel.setText("Quantity: " + this._sprites.length);
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
samples.bunnymark.Main.main();
})();
