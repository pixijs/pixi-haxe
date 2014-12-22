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
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight);
	window.document.body.appendChild(this._renderer.view);
	this._sprites = [];
	this._add = false;
	this._minX = this._minY = 0;
	this._maxX = window.innerWidth;
	this._maxY = window.innerHeight;
	this._bunnyTexture = PIXI.Texture.fromImage("assets/basics/bunny.png");
	this._quantityLabel = new PIXI.Text("Press/Touch and hold to add bunnies continuously",{ font : "15px Tahoma", fill : "#000000"});
	this._stage.addChild(this._quantityLabel);
	this._stage.mousedown = this._stage.touchstart = function(data) {
		_g._add = true;
	};
	this._stage.mouseup = this._stage.touchend = function(data1) {
		_g._add = false;
	};
	this._addStats();
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.bunnymark.Main.main = function() {
	new samples.bunnymark.Main();
};
samples.bunnymark.Main.prototype = {
	_addBunnys: function() {
		var _g = 0;
		while(_g < 10) {
			var i = _g++;
			this._bunny = new samples.bunnymark.Bunny(this._bunnyTexture);
			this._stage.addChild(this._bunny);
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
	,animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
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
		this._stats.update();
		this._renderer.render(this._stage);
	}
	,_addStats: function() {
		var _container = window.document.createElement("div");
		window.document.body.appendChild(_container);
		this._stats = new Stats();
		this._stats.domElement.style.position = "absolute";
		this._stats.domElement.style.top = "2px";
		this._stats.domElement.style.right = "2px";
		_container.appendChild(this._stats.domElement);
		this._stats.begin();
	}
};
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
