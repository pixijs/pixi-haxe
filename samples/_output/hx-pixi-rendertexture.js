(function () { "use strict";
var samples = {};
samples.rendertexture = {};
samples.rendertexture.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._renderer = PIXI.autoDetectRenderer(800,600);
	this._renderer.view.style.width = window.innerWidth + "px";
	this._renderer.view.style.height = window.innerHeight + "px";
	this._renderer.view.style.display = "block";
	window.document.body.appendChild(this._renderer.view);
	this._renderTexture1 = new PIXI.RenderTexture(800,600);
	this._renderTexture2 = new PIXI.RenderTexture(800,600);
	this._currentTexture = this._renderTexture1;
	this._outputSprite = new PIXI.Sprite(this._currentTexture);
	this._outputSprite.position.x = 400.;
	this._outputSprite.position.y = 300.;
	this._outputSprite.anchor.x = 0.5;
	this._outputSprite.anchor.y = 0.5;
	this._stage.addChild(this._outputSprite);
	this._bunnyContainer = new PIXI.DisplayObjectContainer();
	this._bunnyContainer.position.x = 400.;
	this._bunnyContainer.position.y = 300.;
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
		bunny.anchor.x = 0.5;
		bunny.anchor.y = 0.5;
		this._bunnyContainer.addChild(bunny);
		this._bunnys.push(bunny);
	}
	this._count1 = 0;
	this._score = 0;
	this._count2 = 0;
	window.requestAnimationFrame($bind(this,this.animate));
};
samples.rendertexture.Main.main = function() {
	new samples.rendertexture.Main();
};
samples.rendertexture.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
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
		this._renderer.render(this._stage);
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
samples.rendertexture.Main.main();
})();
