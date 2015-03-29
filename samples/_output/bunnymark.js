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
		this.resize = true;
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
		renderingOptions.autoResize = true;
		if(renderer == "auto") this._renderer = PIXI.autoDetectRenderer(this.width,this.height,renderingOptions); else if(renderer == "canvas") this._renderer = new PIXI.CanvasRenderer(this.width,this.height,renderingOptions); else this._renderer = new PIXI.WebGLRenderer(this.width,this.height,renderingOptions);
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
samples.bunnymark = {};
samples.bunnymark.Bunny = function(texture) {
	PIXI.Sprite.call(this,texture);
};
samples.bunnymark.Bunny.__super__ = PIXI.Sprite;
samples.bunnymark.Bunny.prototype = $extend(PIXI.Sprite.prototype,{
});
samples.bunnymark.Main = function() {
	this.amount = 100;
	this.count = 0;
	this.isAdding = false;
	this.startBunnyCount = 2;
	this.minY = 0;
	this.minX = 0;
	this.gravity = 0.5;
	this.bunnyTextures = [];
	this.bunnys = [];
	pixi.plugins.app.Application.call(this);
	this._init();
};
samples.bunnymark.Main.main = function() {
	new samples.bunnymark.Main();
};
samples.bunnymark.Main.__super__ = pixi.plugins.app.Application;
samples.bunnymark.Main.prototype = $extend(pixi.plugins.app.Application.prototype,{
	_init: function() {
		this.backgroundColor = 14739192;
		this.onUpdate = $bind(this,this._onUpdate);
		this.onResize = $bind(this,this._onResize);
		pixi.plugins.app.Application.prototype.start.call(this,null,true);
		this._setup();
	}
	,_setup: function() {
		this.maxX = window.innerWidth;
		this.maxY = window.innerHeight;
		var _this = window.document;
		this.counter = _this.createElement("div");
		this.counter.style.position = "absolute";
		this.counter.style.top = "1px";
		this.counter.style.left = "1px";
		this.counter.style.width = "90px";
		this.counter.style.background = "#CCCCC";
		this.counter.style.backgroundColor = "#105CB6";
		this.counter.style.fontFamily = "Helvetica,Arial";
		this.counter.style.padding = "3px";
		this.counter.style.color = "#0FF";
		this.counter.style.fontSize = "10px";
		this.counter.style.fontWeight = "bold";
		this.counter.style.textAlign = "center";
		this.counter.className = "counter";
		window.document.body.appendChild(this.counter);
		this.count = this.startBunnyCount;
		this.counter.innerHTML = this.count + " BUNNIES";
		this.container = new PIXI.Container();
		this._stage.addChild(this.container);
		var bunny1 = PIXI.Texture.fromImage("assets/bunnymark/bunny1.png");
		var bunny2 = PIXI.Texture.fromImage("assets/bunnymark/bunny2.png");
		var bunny3 = PIXI.Texture.fromImage("assets/bunnymark/bunny3.png");
		var bunny4 = PIXI.Texture.fromImage("assets/bunnymark/bunny4.png");
		var bunny5 = PIXI.Texture.fromImage("assets/bunnymark/bunny5.png");
		this.bunnyTextures = [bunny1,bunny2,bunny3,bunny4,bunny5];
		this.bunnyType = 1;
		this.currentTexture = this.bunnyTextures[this.bunnyType];
		var _g1 = 0;
		var _g = this.startBunnyCount;
		while(_g1 < _g) {
			var i = _g1++;
			var bunny = new samples.bunnymark.Bunny(this.currentTexture);
			bunny.speedX = Math.random() * 5;
			bunny.speedY = Math.random() * 5 - 3;
			bunny.anchor.x = 0.5;
			bunny.anchor.y = 1;
			this.bunnys.push(bunny);
			this.container.addChild(bunny);
		}
		this._renderer.view.onmousedown = $bind(this,this.onTouchStart);
		this._renderer.view.onmouseup = $bind(this,this.onTouchEnd);
		window.document.addEventListener("touchstart",$bind(this,this.onTouchStart),true);
		window.document.addEventListener("touchend",$bind(this,this.onTouchEnd),true);
	}
	,onTouchStart: function(event) {
		this.isAdding = true;
	}
	,onTouchEnd: function(event) {
		this.bunnyType++;
		this.bunnyType %= 5;
		this.currentTexture = this.bunnyTextures[this.bunnyType];
		this.isAdding = false;
	}
	,_onUpdate: function(elapsedTime) {
		if(this.isAdding) {
			if(this.count < 200000) {
				var _g1 = 0;
				var _g = this.amount;
				while(_g1 < _g) {
					var i = _g1++;
					var bunny = new samples.bunnymark.Bunny(this.currentTexture);
					bunny.speedX = Math.random() * 5;
					bunny.speedY = Math.random() * 5 - 3;
					bunny.anchor.y = 1;
					this.bunnys.push(bunny);
					bunny.scale.set(0.5 + Math.random() * 0.5,0.5 + Math.random() * 0.5);
					bunny.rotation = Math.random() - 0.5;
					var random = Std.random(this.container.children.length - 2);
					this.container.addChild(bunny);
					this.count++;
				}
			}
			this.counter.innerHTML = this.count + " BUNNIES";
		}
		var _g11 = 0;
		var _g2 = this.bunnys.length;
		while(_g11 < _g2) {
			var i1 = _g11++;
			var bunny1 = this.bunnys[i1];
			bunny1.position.x += bunny1.speedX;
			bunny1.position.y += bunny1.speedY;
			bunny1.speedY += this.gravity;
			if(bunny1.position.x > this.maxX) {
				bunny1.speedX *= -1;
				bunny1.position.x = this.maxX;
			} else if(bunny1.position.x < this.minX) {
				bunny1.speedX *= -1;
				bunny1.position.x = this.minX;
			}
			if(bunny1.position.y > this.maxY) {
				bunny1.speedY *= -0.85;
				bunny1.position.y = this.maxY;
				if(Math.random() > 0.5) bunny1.speedY -= Math.random() * 6;
			} else if(bunny1.position.y < this.minY) {
				bunny1.speedY = 0;
				bunny1.position.y = this.minY;
			}
		}
	}
	,_onResize: function() {
		this.maxX = window.innerWidth;
		this.maxY = window.innerHeight;
		this.counter.style.top = "1px";
		this.counter.style.left = "1px";
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

//# sourceMappingURL=bunnymark.js.map