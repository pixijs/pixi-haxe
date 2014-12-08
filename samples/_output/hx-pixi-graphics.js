(function () { "use strict";
var Std = function() { };
Std["int"] = function(x) {
	return x | 0;
};
var demos = {};
demos.graphics = {};
demos.graphics.Main = function() {
	this._stage = new PIXI.Stage(65280);
	this._stage.interactive = true;
	this._renderer = PIXI.autoDetectRenderer(620,380);
	this._renderer.view.style.display = "block";
	window.document.body.appendChild(this._renderer.view);
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
	this._thing.position.x = 310.;
	this._thing.position.y = 190.;
	this._count = 0;
	this._stage.click = this._stage.tap = $bind(this,this._onStageClick);
	window.requestAnimationFrame($bind(this,this.animate));
};
demos.graphics.Main.main = function() {
	new demos.graphics.Main();
};
demos.graphics.Main.prototype = {
	_onStageClick: function(data) {
		this._graphics.lineStyle(Math.random() * 30,Std["int"](Math.random() * 16777215),1);
		this._graphics.moveTo(Math.random() * 620,Math.random() * 380);
		this._graphics.lineTo(Math.random() * 620,Math.random() * 380);
	}
	,animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
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
demos.graphics.Main.main();
})();
