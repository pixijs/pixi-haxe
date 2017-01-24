(function (console, $hx_exports, $global) { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
Math.__name__ = true;
var Perf = $hx_exports.Perf = function(pos,offset) {
	if(offset == null) offset = 0;
	if(pos == null) pos = "TR";
	this._perfObj = window.performance;
	if(Reflect.field(this._perfObj,"memory") != null) this._memoryObj = Reflect.field(this._perfObj,"memory");
	this._memCheck = this._perfObj != null && this._memoryObj != null && this._memoryObj.totalJSHeapSize > 0;
	this._pos = pos;
	this._offset = offset;
	this.currentFps = 60;
	this.currentMs = 0;
	this.currentMem = "0";
	this.lowFps = 60;
	this.avgFps = 60;
	this._measureCount = 0;
	this._totalFps = 0;
	this._time = 0;
	this._ticks = 0;
	this._fpsMin = 60;
	this._fpsMax = 60;
	if(this._perfObj != null && ($_=this._perfObj,$bind($_,$_.now)) != null) this._startTime = this._perfObj.now(); else this._startTime = new Date().getTime();
	this._prevTime = -Perf.MEASUREMENT_INTERVAL;
	this._createFpsDom();
	this._createMsDom();
	if(this._memCheck) this._createMemoryDom();
	if(($_=window,$bind($_,$_.requestAnimationFrame)) != null) this.RAF = ($_=window,$bind($_,$_.requestAnimationFrame)); else if(window.mozRequestAnimationFrame != null) this.RAF = window.mozRequestAnimationFrame; else if(window.webkitRequestAnimationFrame != null) this.RAF = window.webkitRequestAnimationFrame; else if(window.msRequestAnimationFrame != null) this.RAF = window.msRequestAnimationFrame;
	if(($_=window,$bind($_,$_.cancelAnimationFrame)) != null) this.CAF = ($_=window,$bind($_,$_.cancelAnimationFrame)); else if(window.mozCancelAnimationFrame != null) this.CAF = window.mozCancelAnimationFrame; else if(window.webkitCancelAnimationFrame != null) this.CAF = window.webkitCancelAnimationFrame; else if(window.msCancelAnimationFrame != null) this.CAF = window.msCancelAnimationFrame;
	if(this.RAF != null) this._raf = Reflect.callMethod(window,this.RAF,[$bind(this,this._tick)]);
};
Perf.__name__ = true;
Perf.prototype = {
	_tick: function(val) {
		var time;
		if(this._perfObj != null && ($_=this._perfObj,$bind($_,$_.now)) != null) time = this._perfObj.now(); else time = new Date().getTime();
		this._ticks++;
		if(this._raf != null && time > this._prevTime + Perf.MEASUREMENT_INTERVAL) {
			this.currentMs = Math.round(time - this._startTime);
			this.ms.innerHTML = "MS: " + this.currentMs;
			this.currentFps = Math.round(this._ticks * 1000 / (time - this._prevTime));
			if(this.currentFps > 0 && val > Perf.DELAY_TIME) {
				this._measureCount++;
				this._totalFps += this.currentFps;
				this.lowFps = this._fpsMin = Math.min(this._fpsMin,this.currentFps);
				this._fpsMax = Math.max(this._fpsMax,this.currentFps);
				this.avgFps = Math.round(this._totalFps / this._measureCount);
			}
			this.fps.innerHTML = "FPS: " + this.currentFps + " (" + this._fpsMin + "-" + this._fpsMax + ")";
			if(this.currentFps >= 30) this.fps.style.backgroundColor = Perf.FPS_BG_CLR; else if(this.currentFps >= 15) this.fps.style.backgroundColor = Perf.FPS_WARN_BG_CLR; else this.fps.style.backgroundColor = Perf.FPS_PROB_BG_CLR;
			this._prevTime = time;
			this._ticks = 0;
			if(this._memCheck) {
				this.currentMem = this._getFormattedSize(this._memoryObj.usedJSHeapSize,2);
				this.memory.innerHTML = "MEM: " + this.currentMem;
			}
		}
		this._startTime = time;
		if(this._raf != null) this._raf = Reflect.callMethod(window,this.RAF,[$bind(this,this._tick)]);
	}
	,_createDiv: function(id,top) {
		if(top == null) top = 0;
		var div;
		var _this = window.document;
		div = _this.createElement("div");
		div.id = id;
		div.className = id;
		div.style.position = "absolute";
		var _g = this._pos;
		switch(_g) {
		case "TL":
			div.style.left = this._offset + "px";
			div.style.top = top + "px";
			break;
		case "TR":
			div.style.right = this._offset + "px";
			div.style.top = top + "px";
			break;
		case "BL":
			div.style.left = this._offset + "px";
			div.style.bottom = (this._memCheck?48:32) - top + "px";
			break;
		case "BR":
			div.style.right = this._offset + "px";
			div.style.bottom = (this._memCheck?48:32) - top + "px";
			break;
		}
		div.style.width = "80px";
		div.style.height = "12px";
		div.style.lineHeight = "12px";
		div.style.padding = "2px";
		div.style.fontFamily = Perf.FONT_FAMILY;
		div.style.fontSize = "9px";
		div.style.fontWeight = "bold";
		div.style.textAlign = "center";
		window.document.body.appendChild(div);
		return div;
	}
	,_createFpsDom: function() {
		this.fps = this._createDiv("fps");
		this.fps.style.backgroundColor = Perf.FPS_BG_CLR;
		this.fps.style.zIndex = "995";
		this.fps.style.color = Perf.FPS_TXT_CLR;
		this.fps.innerHTML = "FPS: 0";
	}
	,_createMsDom: function() {
		this.ms = this._createDiv("ms",16);
		this.ms.style.backgroundColor = Perf.MS_BG_CLR;
		this.ms.style.zIndex = "996";
		this.ms.style.color = Perf.MS_TXT_CLR;
		this.ms.innerHTML = "MS: 0";
	}
	,_createMemoryDom: function() {
		this.memory = this._createDiv("memory",32);
		this.memory.style.backgroundColor = Perf.MEM_BG_CLR;
		this.memory.style.color = Perf.MEM_TXT_CLR;
		this.memory.style.zIndex = "997";
		this.memory.innerHTML = "MEM: 0";
	}
	,_getFormattedSize: function(bytes,frac) {
		if(frac == null) frac = 0;
		var sizes = ["Bytes","KB","MB","GB","TB"];
		if(bytes == 0) return "0";
		var precision = Math.pow(10,frac);
		var i = Math.floor(Math.log(bytes) / Math.log(1024));
		return Math.round(bytes * precision / Math.pow(1024,i)) / precision + " " + sizes[i];
	}
	,addInfo: function(val) {
		this.info = this._createDiv("info",this._memCheck?48:32);
		this.info.style.backgroundColor = Perf.INFO_BG_CLR;
		this.info.style.color = Perf.INFO_TXT_CLR;
		this.info.style.zIndex = "998";
		this.info.innerHTML = val;
	}
	,__class__: Perf
};
var Reflect = function() { };
Reflect.__name__ = true;
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( e ) {
		if (e instanceof js__$Boot_HaxeError) e = e.val;
		return null;
	}
};
Reflect.callMethod = function(o,func,args) {
	return func.apply(o,args);
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
Std.random = function(x) {
	if(x <= 0) return 0; else return Math.floor(Math.random() * x);
};
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
haxe_Timer.__name__ = true;
haxe_Timer.prototype = {
	run: function() {
	}
	,__class__: haxe_Timer
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	this.message = String(val);
	if(Error.captureStackTrace) Error.captureStackTrace(this,js__$Boot_HaxeError);
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
	__class__: js__$Boot_HaxeError
});
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) return Array; else {
		var cl = o.__class__;
		if(cl != null) return cl;
		var name = js_Boot.__nativeClassName(o);
		if(name != null) return js_Boot.__resolveNativeClass(name);
		return null;
	}
};
js_Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str2 = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i1 = _g1++;
					if(i1 != 2) str2 += "," + js_Boot.__string_rec(o[i1],s); else str2 += js_Boot.__string_rec(o[i1],s);
				}
				return str2 + ")";
			}
			var l = o.length;
			var i;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			if (e instanceof js__$Boot_HaxeError) e = e.val;
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
js_Boot.__interfLoop = function(cc,cl) {
	if(cc == null) return false;
	if(cc == cl) return true;
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g1 = 0;
		var _g = intf.length;
		while(_g1 < _g) {
			var i = _g1++;
			var i1 = intf[i];
			if(i1 == cl || js_Boot.__interfLoop(i1,cl)) return true;
		}
	}
	return js_Boot.__interfLoop(cc.__super__,cl);
};
js_Boot.__instanceof = function(o,cl) {
	if(cl == null) return false;
	switch(cl) {
	case Int:
		return (o|0) === o;
	case Float:
		return typeof(o) == "number";
	case Bool:
		return typeof(o) == "boolean";
	case String:
		return typeof(o) == "string";
	case Array:
		return (o instanceof Array) && o.__enum__ == null;
	case Dynamic:
		return true;
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(o instanceof cl) return true;
				if(js_Boot.__interfLoop(js_Boot.getClass(o),cl)) return true;
			} else if(typeof(cl) == "object" && js_Boot.__isNativeObj(cl)) {
				if(o instanceof cl) return true;
			}
		} else return false;
		if(cl == Class && o.__name__ != null) return true;
		if(cl == Enum && o.__ename__ != null) return true;
		return o.__enum__ == cl;
	}
};
js_Boot.__nativeClassName = function(o) {
	var name = js_Boot.__toStr.call(o).slice(8,-1);
	if(name == "Object" || name == "Function" || name == "Math" || name == "JSON") return null;
	return name;
};
js_Boot.__isNativeObj = function(o) {
	return js_Boot.__nativeClassName(o) != null;
};
js_Boot.__resolveNativeClass = function(name) {
	return $global[name];
};
var nape_Config = function() { };
nape_Config.__name__ = true;
var pixi_plugins_app_Application = function() {
	this._animationFrameId = null;
	this.pixelRatio = 1;
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
	this.position = "static";
};
pixi_plugins_app_Application.__name__ = true;
pixi_plugins_app_Application.prototype = {
	start: function(rendererType,parentDom,canvasElement) {
		if(rendererType == null) rendererType = "auto";
		if(canvasElement == null) {
			var _this = window.document;
			this.canvas = _this.createElement("canvas");
			this.canvas.style.width = this.width + "px";
			this.canvas.style.height = this.height + "px";
			this.canvas.style.position = this.position;
		} else this.canvas = canvasElement;
		if(this.autoResize) window.onresize = $bind(this,this._onWindowResize);
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
		renderingOptions.roundPixels = this.roundPixels;
		if(rendererType != null) switch(rendererType) {
		case "canvas":
			this.app = new PIXI.Application(this.width,this.height,renderingOptions,true);
			break;
		default:
			this.app = new PIXI.Application(this.width,this.height,renderingOptions);
		} else this.app = new PIXI.Application(this.width,this.height,renderingOptions);
		this.stage = this.app.stage;
		this.renderer = this.app.renderer;
		if(parentDom == null) window.document.body.appendChild(this.app.view); else parentDom.appendChild(this.app.view);
		this.app.ticker.add($bind(this,this._onRequestAnimationFrame));
		this.addStats();
	}
	,_onWindowResize: function(event) {
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.app.renderer.resize(this.width,this.height);
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		if(this.onResize != null) this.onResize();
	}
	,_onRequestAnimationFrame: function() {
		if(this.onUpdate != null) this.onUpdate(this.app.ticker.deltaTime);
	}
	,addStats: function() {
		if(window.Perf != null) new Perf().addInfo(["UNKNOWN","WEBGL","CANVAS"][this.app.renderer.type] + " - " + this.pixelRatio);
	}
	,__class__: pixi_plugins_app_Application
};
var nape_Main = function() {
	pixi_plugins_app_Application.call(this);
	this._init();
	this._balls = [];
	this._pballs = [];
	this._setUpPhysics();
	this.onUpdate = $bind(this,this._onUpdate);
	var timer = new haxe_Timer(1000);
	timer.run = $bind(this,this._addBall);
	this._addBall();
};
nape_Main.__name__ = true;
nape_Main.main = function() {
	new nape_Main();
};
nape_Main.__super__ = pixi_plugins_app_Application;
nape_Main.prototype = $extend(pixi_plugins_app_Application.prototype,{
	_init: function() {
		this.position = "fixed";
		this.backgroundColor = 6724095;
		this.autoResize = false;
		this.width = 800;
		this.height = 600;
		pixi_plugins_app_Application.prototype.start.call(this);
	}
	,_onUpdate: function(elapsedTime) {
		this._space.step(0.0166666666666666664);
		var _g1 = 0;
		var _g = this._pballs.length;
		while(_g1 < _g) {
			var i = _g1++;
			this._balls[i].position.x = this._pballs[i].get_position().get_x();
			this._balls[i].position.y = this._pballs[i].get_position().get_y();
			this._balls[i].rotation = this._pballs[i].zpp_inner.rot;
		}
	}
	,_setUpPhysics: function() {
		var gravity = nape_geom_Vec2.get(0,600,true);
		this._space = new nape_space_Space(gravity);
		this._floor = new nape_phys_Body((function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.BodyType_STATIC == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.BodyType_STATIC = new nape_phys_BodyType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.BodyType_STATIC;
			return $r;
		}(this)));
		this._floor.setShapeMaterials(nape_phys_Material.wood());
		this._floor.zpp_inner.wrap_shapes.add(new nape_shape_Polygon(nape_shape_Polygon.rect(0,595,800,1)));
		this._floor.set_space(this._space);
	}
	,_addBall: function() {
		var ball = new PIXI.Sprite(PIXI.Texture.fromImage("assets/nape/ball.png"));
		ball.anchor.set(0.5,0.5);
		this._balls.push(ball);
		this.stage.addChild(ball);
		var pball = new nape_phys_Body((function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC = new nape_phys_BodyType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC;
			return $r;
		}(this)));
		pball.zpp_inner.wrap_shapes.add(new nape_shape_Circle(10));
		((function($this) {
			var $r;
			if(pball.zpp_inner.wrap_pos == null) pball.zpp_inner.setupPosition();
			$r = pball.zpp_inner.wrap_pos;
			return $r;
		}(this))).setxy(Std.random(800),0);
		if(pball.zpp_inner.world) throw new js__$Boot_HaxeError("Error: Space::world is immutable");
		if(pball.zpp_inner.angvel != 0) {
			if(pball.zpp_inner.type == 1) throw new js__$Boot_HaxeError("Error: A static object cannot be given a velocity");
			pball.zpp_inner.angvel = 0;
			pball.zpp_inner.wake();
		}
		pball.zpp_inner.angvel;
		pball.zpp_inner.immutable_midstep("Body::" + "true");
		if(!pball.zpp_inner.norotate != true) {
			pball.zpp_inner.norotate = false;
			pball.zpp_inner.invalidate_inertia();
		}
		!pball.zpp_inner.norotate;
		pball.setShapeMaterials(nape_phys_Material.rubber());
		pball.set_space(this._space);
		this._pballs.push(pball);
	}
	,__class__: nape_Main
});
var nape_callbacks_Callback = function() {
	this.zpp_inner = null;
	if(!zpp_$nape_callbacks_ZPP_$Callback.internal) throw new js__$Boot_HaxeError("Error: Callback cannot be instantiated derp!");
};
nape_callbacks_Callback.__name__ = true;
nape_callbacks_Callback.prototype = {
	toString: function() {
		return "";
	}
	,__class__: nape_callbacks_Callback
};
var nape_callbacks_BodyCallback = function() {
	nape_callbacks_Callback.call(this);
};
nape_callbacks_BodyCallback.__name__ = true;
nape_callbacks_BodyCallback.__super__ = nape_callbacks_Callback;
nape_callbacks_BodyCallback.prototype = $extend(nape_callbacks_Callback.prototype,{
	toString: function() {
		var ret = "Cb:";
		ret += ["WAKE","SLEEP"][this.zpp_inner.event - 2];
		ret += ":" + this.zpp_inner.body.outer.toString();
		ret += " : listener: " + Std.string(this.zpp_inner.listener.outer);
		return ret;
	}
	,__class__: nape_callbacks_BodyCallback
});
var nape_callbacks_Listener = function() {
	this.zpp_inner = null;
};
nape_callbacks_Listener.__name__ = true;
nape_callbacks_Listener.prototype = {
	toString: function() {
		var event = ["BEGIN","END","WAKE","SLEEP","BREAK","PRE","ONGOING"][this.zpp_inner.event];
		if(this.zpp_inner.type == 0) {
			var body = this.zpp_inner.body;
			return "BodyListener{" + event + "::" + Std.string(body.outer_zn.zpp_inner_zn.options.outer) + "}";
		} else if(this.zpp_inner.type == 1) {
			var con = this.zpp_inner.constraint;
			return "ConstraintListener{" + event + "::" + Std.string(con.outer_zn.zpp_inner_zn.options.outer) + "}";
		} else {
			var con1 = this.zpp_inner.interaction;
			var itype;
			var _g = con1.itype;
			switch(_g) {
			case 1:
				itype = "COLLISION";
				break;
			case 2:
				itype = "SENSOR";
				break;
			case 4:
				itype = "FLUID";
				break;
			default:
				itype = "ALL";
			}
			return (this.zpp_inner.type == 2?"InteractionListener{" + event + "#" + itype + "::" + Std.string(con1.outer_zni.zpp_inner_zn.options1.outer) + ":" + Std.string(con1.outer_zni.zpp_inner_zn.options2.outer) + "}":"PreListener{" + itype + "::" + Std.string(con1.outer_znp.zpp_inner_zn.options1.outer) + ":" + Std.string(con1.outer_znp.zpp_inner_zn.options2.outer) + "}") + " precedence=" + this.zpp_inner.precedence;
		}
	}
	,__class__: nape_callbacks_Listener
};
var nape_callbacks_BodyListener = function() {
	this.zpp_inner_zn = null;
};
nape_callbacks_BodyListener.__name__ = true;
nape_callbacks_BodyListener.__super__ = nape_callbacks_Listener;
nape_callbacks_BodyListener.prototype = $extend(nape_callbacks_Listener.prototype,{
	__class__: nape_callbacks_BodyListener
});
var nape_callbacks_CbEvent = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "CbEvent" + " derp!");
};
nape_callbacks_CbEvent.__name__ = true;
nape_callbacks_CbEvent.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_PRE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_PRE = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_PRE;
			return $r;
		}(this))) return "PRE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_BEGIN == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_BEGIN = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_BEGIN;
			return $r;
		}(this))) return "BEGIN"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_ONGOING == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_ONGOING = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_ONGOING;
			return $r;
		}(this))) return "ONGOING"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_END == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_END = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_END;
			return $r;
		}(this))) return "END"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_WAKE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_WAKE = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_WAKE;
			return $r;
		}(this))) return "WAKE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_SLEEP == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_SLEEP = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_SLEEP;
			return $r;
		}(this))) return "SLEEP"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.CbEvent_BREAK == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.CbEvent_BREAK = new nape_callbacks_CbEvent();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.CbEvent_BREAK;
			return $r;
		}(this))) return "BREAK"; else return "";
	}
	,__class__: nape_callbacks_CbEvent
};
var nape_callbacks_CbType = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_callbacks_ZPP_$CbType();
	this.zpp_inner.outer = this;
};
nape_callbacks_CbType.__name__ = true;
nape_callbacks_CbType.prototype = {
	toString: function() {
		if(this == zpp_$nape_callbacks_ZPP_$CbType.ANY_BODY) return "ANY_BODY"; else if(this == zpp_$nape_callbacks_ZPP_$CbType.ANY_SHAPE) return "ANY_SHAPE"; else if(this == zpp_$nape_callbacks_ZPP_$CbType.ANY_COMPOUND) return "ANY_COMPOUND"; else if(this == zpp_$nape_callbacks_ZPP_$CbType.ANY_CONSTRAINT) return "ANY_CONSTRAINT"; else return "CbType#" + this.zpp_inner.id;
	}
	,__class__: nape_callbacks_CbType
};
var nape_callbacks_CbTypeIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$CbTypeList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "CbType" + "Iterator derp!");
};
nape_callbacks_CbTypeIterator.__name__ = true;
nape_callbacks_CbTypeIterator.get = function(list) {
	var ret;
	if(nape_callbacks_CbTypeIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$CbTypeList.internal = true;
		var ret1 = new nape_callbacks_CbTypeIterator();
		zpp_$nape_util_ZPP_$CbTypeList.internal = false;
		ret = ret1;
	} else {
		var r = nape_callbacks_CbTypeIterator.zpp_pool;
		nape_callbacks_CbTypeIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_callbacks_CbTypeIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_callbacks_CbTypeIterator.zpp_pool;
			nape_callbacks_CbTypeIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_callbacks_CbTypeIterator
};
var nape_callbacks_CbTypeList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$CbTypeList();
	this.zpp_inner.outer = this;
};
nape_callbacks_CbTypeList.__name__ = true;
nape_callbacks_CbTypeList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_callbacks_CbTypeIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_callbacks_CbTypeList
};
var nape_callbacks_ConstraintCallback = function() {
	nape_callbacks_Callback.call(this);
};
nape_callbacks_ConstraintCallback.__name__ = true;
nape_callbacks_ConstraintCallback.__super__ = nape_callbacks_Callback;
nape_callbacks_ConstraintCallback.prototype = $extend(nape_callbacks_Callback.prototype,{
	toString: function() {
		var ret = "Cb:";
		ret += ["WAKE","SLEEP","BREAK"][this.zpp_inner.event - 2];
		ret += ":" + this.zpp_inner.constraint.outer.toString();
		ret += " : listener: " + Std.string(this.zpp_inner.listener.outer);
		return ret;
	}
	,__class__: nape_callbacks_ConstraintCallback
});
var nape_callbacks_ConstraintListener = function() {
	this.zpp_inner_zn = null;
};
nape_callbacks_ConstraintListener.__name__ = true;
nape_callbacks_ConstraintListener.__super__ = nape_callbacks_Listener;
nape_callbacks_ConstraintListener.prototype = $extend(nape_callbacks_Listener.prototype,{
	__class__: nape_callbacks_ConstraintListener
});
var nape_callbacks_InteractionCallback = function() {
	nape_callbacks_Callback.call(this);
};
nape_callbacks_InteractionCallback.__name__ = true;
nape_callbacks_InteractionCallback.__super__ = nape_callbacks_Callback;
nape_callbacks_InteractionCallback.prototype = $extend(nape_callbacks_Callback.prototype,{
	toString: function() {
		var ret = "Cb:";
		ret += ["BEGIN","END","","","","","ONGOING"][this.zpp_inner.event];
		ret += ":" + this.zpp_inner.int1.outer_i.toString() + "/" + this.zpp_inner.int2.outer_i.toString();
		ret += " : " + this.zpp_inner.wrap_arbiters.toString();
		ret += " : listener: " + Std.string(this.zpp_inner.listener.outer);
		return ret;
	}
	,__class__: nape_callbacks_InteractionCallback
});
var nape_callbacks_InteractionListener = function() {
	this.zpp_inner_zn = null;
};
nape_callbacks_InteractionListener.__name__ = true;
nape_callbacks_InteractionListener.__super__ = nape_callbacks_Listener;
nape_callbacks_InteractionListener.prototype = $extend(nape_callbacks_Listener.prototype,{
	__class__: nape_callbacks_InteractionListener
});
var nape_callbacks_InteractionType = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "InteractionType" + " derp!");
};
nape_callbacks_InteractionType.__name__ = true;
nape_callbacks_InteractionType.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.InteractionType_COLLISION == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.InteractionType_COLLISION = new nape_callbacks_InteractionType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.InteractionType_COLLISION;
			return $r;
		}(this))) return "COLLISION"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.InteractionType_SENSOR == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.InteractionType_SENSOR = new nape_callbacks_InteractionType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.InteractionType_SENSOR;
			return $r;
		}(this))) return "SENSOR"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.InteractionType_FLUID == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.InteractionType_FLUID = new nape_callbacks_InteractionType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.InteractionType_FLUID;
			return $r;
		}(this))) return "FLUID"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.InteractionType_ANY == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.InteractionType_ANY = new nape_callbacks_InteractionType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.InteractionType_ANY;
			return $r;
		}(this))) return "ANY"; else return "";
	}
	,__class__: nape_callbacks_InteractionType
};
var nape_callbacks_ListenerIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$ListenerList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Listener" + "Iterator derp!");
};
nape_callbacks_ListenerIterator.__name__ = true;
nape_callbacks_ListenerIterator.get = function(list) {
	var ret;
	if(nape_callbacks_ListenerIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$ListenerList.internal = true;
		var ret1 = new nape_callbacks_ListenerIterator();
		zpp_$nape_util_ZPP_$ListenerList.internal = false;
		ret = ret1;
	} else {
		var r = nape_callbacks_ListenerIterator.zpp_pool;
		nape_callbacks_ListenerIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_callbacks_ListenerIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_callbacks_ListenerIterator.zpp_pool;
			nape_callbacks_ListenerIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_callbacks_ListenerIterator
};
var nape_callbacks_ListenerList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$ListenerList();
	this.zpp_inner.outer = this;
};
nape_callbacks_ListenerList.__name__ = true;
nape_callbacks_ListenerList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,remove: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Listener" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var ret;
		ret = false;
		var cx_ite = this.zpp_inner.inner.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x == obj.zpp_inner) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(ret) {
			if(this.zpp_inner.subber != null) this.zpp_inner.subber(obj);
			if(!this.zpp_inner.dontremove) this.zpp_inner.inner.remove(obj.zpp_inner);
			this.zpp_inner.invalidate();
		}
		return ret;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_callbacks_ListenerIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_callbacks_ListenerList
};
var nape_callbacks_ListenerType = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "ListenerType" + " derp!");
};
nape_callbacks_ListenerType.__name__ = true;
nape_callbacks_ListenerType.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ListenerType_BODY == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ListenerType_BODY = new nape_callbacks_ListenerType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ListenerType_BODY;
			return $r;
		}(this))) return "BODY"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ListenerType_CONSTRAINT == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ListenerType_CONSTRAINT = new nape_callbacks_ListenerType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ListenerType_CONSTRAINT;
			return $r;
		}(this))) return "CONSTRAINT"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ListenerType_INTERACTION == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ListenerType_INTERACTION = new nape_callbacks_ListenerType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ListenerType_INTERACTION;
			return $r;
		}(this))) return "INTERACTION"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ListenerType_PRE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ListenerType_PRE = new nape_callbacks_ListenerType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ListenerType_PRE;
			return $r;
		}(this))) return "PRE"; else return "";
	}
	,__class__: nape_callbacks_ListenerType
};
var nape_callbacks_OptionType = function() {
	this.zpp_inner = null;
};
nape_callbacks_OptionType.__name__ = true;
nape_callbacks_OptionType.prototype = {
	toString: function() {
		var inc = ((function($this) {
			var $r;
			if($this.zpp_inner.wrap_includes == null) $this.zpp_inner.setup_includes();
			$r = $this.zpp_inner.wrap_includes;
			return $r;
		}(this))).toString();
		var exc = ((function($this) {
			var $r;
			if($this.zpp_inner.wrap_excludes == null) $this.zpp_inner.setup_excludes();
			$r = $this.zpp_inner.wrap_excludes;
			return $r;
		}(this))).toString();
		return "@{" + inc + " excluding " + exc + "}";
	}
	,__class__: nape_callbacks_OptionType
};
var nape_callbacks_PreCallback = function() {
	nape_callbacks_Callback.call(this);
};
nape_callbacks_PreCallback.__name__ = true;
nape_callbacks_PreCallback.__super__ = nape_callbacks_Callback;
nape_callbacks_PreCallback.prototype = $extend(nape_callbacks_Callback.prototype,{
	toString: function() {
		var ret = "Cb:PRE:";
		ret += ":" + this.zpp_inner.int1.outer_i.toString() + "/" + this.zpp_inner.int2.outer_i.toString();
		ret += " : " + this.zpp_inner.pre_arbiter.wrapper().toString();
		ret += " : listnener: " + Std.string(this.zpp_inner.listener.outer);
		return ret;
	}
	,__class__: nape_callbacks_PreCallback
});
var nape_callbacks_PreFlag = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "PreFlag" + " derp!");
};
nape_callbacks_PreFlag.__name__ = true;
nape_callbacks_PreFlag.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT = new nape_callbacks_PreFlag();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT;
			return $r;
		}(this))) return "ACCEPT"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE = new nape_callbacks_PreFlag();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE;
			return $r;
		}(this))) return "IGNORE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE = new nape_callbacks_PreFlag();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE;
			return $r;
		}(this))) return "ACCEPT_ONCE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE_ONCE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE_ONCE = new nape_callbacks_PreFlag();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE_ONCE;
			return $r;
		}(this))) return "IGNORE_ONCE"; else return "";
	}
	,__class__: nape_callbacks_PreFlag
};
var nape_callbacks_PreListener = function() {
	this.zpp_inner_zn = null;
};
nape_callbacks_PreListener.__name__ = true;
nape_callbacks_PreListener.__super__ = nape_callbacks_Listener;
nape_callbacks_PreListener.prototype = $extend(nape_callbacks_Listener.prototype,{
	__class__: nape_callbacks_PreListener
});
var nape_constraint_Constraint = function() { };
nape_constraint_Constraint.__name__ = true;
nape_constraint_Constraint.prototype = {
	toString: function() {
		return "{Constraint}";
	}
	,__class__: nape_constraint_Constraint
};
var nape_constraint_ConstraintIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$ConstraintList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Constraint" + "Iterator derp!");
};
nape_constraint_ConstraintIterator.__name__ = true;
nape_constraint_ConstraintIterator.get = function(list) {
	var ret;
	if(nape_constraint_ConstraintIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$ConstraintList.internal = true;
		var ret1 = new nape_constraint_ConstraintIterator();
		zpp_$nape_util_ZPP_$ConstraintList.internal = false;
		ret = ret1;
	} else {
		var r = nape_constraint_ConstraintIterator.zpp_pool;
		nape_constraint_ConstraintIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_constraint_ConstraintIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_constraint_ConstraintIterator.zpp_pool;
			nape_constraint_ConstraintIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_constraint_ConstraintIterator
};
var nape_constraint_ConstraintList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$ConstraintList();
	this.zpp_inner.outer = this;
};
nape_constraint_ConstraintList.__name__ = true;
nape_constraint_ConstraintList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,remove: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Constraint" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var ret;
		ret = false;
		var cx_ite = this.zpp_inner.inner.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x == obj.zpp_inner) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(ret) {
			if(this.zpp_inner.subber != null) this.zpp_inner.subber(obj);
			if(!this.zpp_inner.dontremove) this.zpp_inner.inner.remove(obj.zpp_inner);
			this.zpp_inner.invalidate();
		}
		return ret;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_constraint_ConstraintIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_constraint_ConstraintList
};
var nape_dynamics_Arbiter = function() {
	this.zpp_inner = null;
	if(!zpp_$nape_dynamics_ZPP_$Arbiter.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate Arbiter derp!");
};
nape_dynamics_Arbiter.__name__ = true;
nape_dynamics_Arbiter.prototype = {
	get_state: function() {
		if(!this.zpp_inner.active) throw new js__$Boot_HaxeError("Error: Arbiter not currently in use");
		var _g = this.zpp_inner.immState;
		var x = _g;
		if(x == 5) {
			if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT = new nape_callbacks_PreFlag();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			return zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT;
		} else {
			var x1 = _g;
			switch(_g) {
			case 1:
				if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE == null) {
					zpp_$nape_util_ZPP_$Flags.internal = true;
					zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE = new nape_callbacks_PreFlag();
					zpp_$nape_util_ZPP_$Flags.internal = false;
				}
				return zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE;
			default:
				if(x1 == 6) {
					if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE == null) {
						zpp_$nape_util_ZPP_$Flags.internal = true;
						zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE = new nape_callbacks_PreFlag();
						zpp_$nape_util_ZPP_$Flags.internal = false;
					}
					return zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE;
				} else {
					if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE_ONCE == null) {
						zpp_$nape_util_ZPP_$Flags.internal = true;
						zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE_ONCE = new nape_callbacks_PreFlag();
						zpp_$nape_util_ZPP_$Flags.internal = false;
					}
					return zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE_ONCE;
				}
			}
		}
	}
	,toString: function() {
		var ret;
		if(this.zpp_inner.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL) ret = "CollisionArbiter"; else if(this.zpp_inner.type == zpp_$nape_dynamics_ZPP_$Arbiter.FLUID) ret = "FluidArbiter"; else ret = "SensorArbiter";
		if(this.zpp_inner.cleared) return ret + "(object-pooled)"; else return ret + "(" + ((function($this) {
			var $r;
			if(!$this.zpp_inner.active) throw new js__$Boot_HaxeError("Error: Arbiter not currently in use");
			$r = $this.zpp_inner.ws1.id > $this.zpp_inner.ws2.id?$this.zpp_inner.ws2.outer:$this.zpp_inner.ws1.outer;
			return $r;
		}(this))).toString() + "|" + ((function($this) {
			var $r;
			if(!$this.zpp_inner.active) throw new js__$Boot_HaxeError("Error: Arbiter not currently in use");
			$r = $this.zpp_inner.ws1.id > $this.zpp_inner.ws2.id?$this.zpp_inner.ws1.outer:$this.zpp_inner.ws2.outer;
			return $r;
		}(this))).toString() + ")" + (this.zpp_inner.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL?"[" + ["SD","DD"][this.zpp_inner.colarb.stat?0:1] + "]":"") + "<-" + this.get_state().toString();
	}
	,__class__: nape_dynamics_Arbiter
};
var nape_dynamics_ArbiterIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$ArbiterList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Arbiter" + "Iterator derp!");
};
nape_dynamics_ArbiterIterator.__name__ = true;
nape_dynamics_ArbiterIterator.get = function(list) {
	var ret;
	if(nape_dynamics_ArbiterIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$ArbiterList.internal = true;
		var ret1 = new nape_dynamics_ArbiterIterator();
		zpp_$nape_util_ZPP_$ArbiterList.internal = false;
		ret = ret1;
	} else {
		var r = nape_dynamics_ArbiterIterator.zpp_pool;
		nape_dynamics_ArbiterIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_dynamics_ArbiterIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.zpp_gl();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_dynamics_ArbiterIterator.zpp_pool;
			nape_dynamics_ArbiterIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_dynamics_ArbiterIterator
};
var nape_dynamics_ArbiterList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$ArbiterList();
	this.zpp_inner.outer = this;
};
nape_dynamics_ArbiterList.__name__ = true;
nape_dynamics_ArbiterList.prototype = {
	zpp_gl: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = 0;
			var cx_ite = this.zpp_inner.inner.head;
			while(cx_ite != null) {
				var i = cx_ite.elt;
				if(i.active) this.zpp_inner.user_length++;
				cx_ite = cx_ite.next;
			}
		}
		return this.zpp_inner.user_length;
	}
	,zpp_vm: function() {
		this.zpp_inner.valmod();
	}
	,at: function(index) {
		this.zpp_vm();
		if(index < 0 || index >= this.zpp_gl()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.zpp_gl() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = 0;
			this.zpp_inner.at_ite = this.zpp_inner.inner.head;
			while(true) {
				var x = this.zpp_inner.at_ite.elt;
				if(x.active) break;
				this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
			}
		}
		while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
			while(true) {
				var x1 = this.zpp_inner.at_ite.elt;
				if(x1.active) break;
				this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
			}
		}
		return this.zpp_inner.at_ite.elt.wrapper();
	}
	,iterator: function() {
		this.zpp_vm();
		return nape_dynamics_ArbiterIterator.get(this);
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g = this.iterator();
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_dynamics_ArbiterList
};
var nape_dynamics_ArbiterType = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "ArbiterType" + " derp!");
};
nape_dynamics_ArbiterType.__name__ = true;
nape_dynamics_ArbiterType.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ArbiterType_COLLISION == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ArbiterType_COLLISION = new nape_dynamics_ArbiterType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ArbiterType_COLLISION;
			return $r;
		}(this))) return "COLLISION"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ArbiterType_SENSOR == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ArbiterType_SENSOR = new nape_dynamics_ArbiterType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ArbiterType_SENSOR;
			return $r;
		}(this))) return "SENSOR"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ArbiterType_FLUID == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ArbiterType_FLUID = new nape_dynamics_ArbiterType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ArbiterType_FLUID;
			return $r;
		}(this))) return "FLUID"; else return "";
	}
	,__class__: nape_dynamics_ArbiterType
};
var nape_dynamics_CollisionArbiter = function() {
	if(!zpp_$nape_dynamics_ZPP_$Arbiter.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate CollisionArbiter derp!");
	nape_dynamics_Arbiter.call(this);
};
nape_dynamics_CollisionArbiter.__name__ = true;
nape_dynamics_CollisionArbiter.__super__ = nape_dynamics_Arbiter;
nape_dynamics_CollisionArbiter.prototype = $extend(nape_dynamics_Arbiter.prototype,{
	__class__: nape_dynamics_CollisionArbiter
});
var nape_dynamics_Contact = function() {
	this.zpp_inner = null;
	if(!zpp_$nape_dynamics_ZPP_$Contact.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate Contact derp!");
};
nape_dynamics_Contact.__name__ = true;
nape_dynamics_Contact.prototype = {
	toString: function() {
		if(this.zpp_inner.arbiter == null || this.zpp_inner.arbiter.cleared) return "{object-pooled}"; else return "{Contact}";
	}
	,__class__: nape_dynamics_Contact
};
var nape_dynamics_ContactIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$ContactList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Contact" + "Iterator derp!");
};
nape_dynamics_ContactIterator.__name__ = true;
nape_dynamics_ContactIterator.get = function(list) {
	var ret;
	if(nape_dynamics_ContactIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$ContactList.internal = true;
		var ret1 = new nape_dynamics_ContactIterator();
		zpp_$nape_util_ZPP_$ContactList.internal = false;
		ret = ret1;
	} else {
		var r = nape_dynamics_ContactIterator.zpp_pool;
		nape_dynamics_ContactIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_dynamics_ContactIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_dynamics_ContactIterator.zpp_pool;
			nape_dynamics_ContactIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_dynamics_ContactIterator
};
var nape_dynamics_ContactList = function() {
	this.zpp_inner = null;
};
nape_dynamics_ContactList.__name__ = true;
nape_dynamics_ContactList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = 0;
			var cx_ite = this.zpp_inner.inner.next;
			while(cx_ite != null) {
				var i = cx_ite;
				if(i.active && i.arbiter.active) this.zpp_inner.user_length++;
				cx_ite = cx_ite.next;
			}
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = 0;
			this.zpp_inner.at_ite = this.zpp_inner.inner.next;
			while(true) {
				var x = this.zpp_inner.at_ite;
				if(x.active && x.arbiter.active) break;
				this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
			}
		}
		while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
			while(true) {
				var x1 = this.zpp_inner.at_ite;
				if(x1.active && x1.arbiter.active) break;
				this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
			}
		}
		return this.zpp_inner.at_ite.wrapper();
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_dynamics_ContactIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_dynamics_ContactList
};
var nape_dynamics_FluidArbiter = function() {
	if(!zpp_$nape_dynamics_ZPP_$Arbiter.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate FluidArbiter derp!");
	nape_dynamics_Arbiter.call(this);
};
nape_dynamics_FluidArbiter.__name__ = true;
nape_dynamics_FluidArbiter.__super__ = nape_dynamics_Arbiter;
nape_dynamics_FluidArbiter.prototype = $extend(nape_dynamics_Arbiter.prototype,{
	__class__: nape_dynamics_FluidArbiter
});
var nape_dynamics_InteractionFilter = function(collisionGroup,collisionMask,sensorGroup,sensorMask,fluidGroup,fluidMask) {
	if(fluidMask == null) fluidMask = -1;
	if(fluidGroup == null) fluidGroup = 1;
	if(sensorMask == null) sensorMask = -1;
	if(sensorGroup == null) sensorGroup = 1;
	if(collisionMask == null) collisionMask = -1;
	if(collisionGroup == null) collisionGroup = 1;
	this.zpp_inner = null;
	if(zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool == null) this.zpp_inner = new zpp_$nape_dynamics_ZPP_$InteractionFilter(); else {
		this.zpp_inner = zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool;
		zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool = this.zpp_inner.next;
		this.zpp_inner.next = null;
	}
	null;
	this.zpp_inner.outer = this;
	if(this.zpp_inner.collisionGroup != collisionGroup) {
		this.zpp_inner.collisionGroup = collisionGroup;
		this.zpp_inner.invalidate();
	}
	this.zpp_inner.collisionGroup;
	if(this.zpp_inner.collisionMask != collisionMask) {
		this.zpp_inner.collisionMask = collisionMask;
		this.zpp_inner.invalidate();
	}
	this.zpp_inner.collisionMask;
	if(this.zpp_inner.sensorGroup != sensorGroup) {
		this.zpp_inner.sensorGroup = sensorGroup;
		this.zpp_inner.invalidate();
	}
	this.zpp_inner.sensorGroup;
	if(this.zpp_inner.sensorMask != sensorMask) {
		this.zpp_inner.sensorMask = sensorMask;
		this.zpp_inner.invalidate();
	}
	this.zpp_inner.sensorMask;
	if(this.zpp_inner.fluidGroup != fluidGroup) {
		this.zpp_inner.fluidGroup = fluidGroup;
		this.zpp_inner.invalidate();
	}
	this.zpp_inner.fluidGroup;
	if(this.zpp_inner.fluidMask != fluidMask) {
		this.zpp_inner.fluidMask = fluidMask;
		this.zpp_inner.invalidate();
	}
	this.zpp_inner.fluidMask;
};
nape_dynamics_InteractionFilter.__name__ = true;
nape_dynamics_InteractionFilter.prototype = {
	__class__: nape_dynamics_InteractionFilter
};
var nape_dynamics_InteractionGroup = function() {
	this.zpp_inner = null;
};
nape_dynamics_InteractionGroup.__name__ = true;
nape_dynamics_InteractionGroup.prototype = {
	toString: function() {
		var ret = "InteractionGroup";
		if(this.zpp_inner.ignore) ret += ":ignore";
		return ret;
	}
	,__class__: nape_dynamics_InteractionGroup
};
var nape_dynamics_InteractionGroupIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$InteractionGroupList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "InteractionGroup" + "Iterator derp!");
};
nape_dynamics_InteractionGroupIterator.__name__ = true;
nape_dynamics_InteractionGroupIterator.get = function(list) {
	var ret;
	if(nape_dynamics_InteractionGroupIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$InteractionGroupList.internal = true;
		var ret1 = new nape_dynamics_InteractionGroupIterator();
		zpp_$nape_util_ZPP_$InteractionGroupList.internal = false;
		ret = ret1;
	} else {
		var r = nape_dynamics_InteractionGroupIterator.zpp_pool;
		nape_dynamics_InteractionGroupIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_dynamics_InteractionGroupIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_dynamics_InteractionGroupIterator.zpp_pool;
			nape_dynamics_InteractionGroupIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_dynamics_InteractionGroupIterator
};
var nape_dynamics_InteractionGroupList = function() {
	this.zpp_inner = null;
};
nape_dynamics_InteractionGroupList.__name__ = true;
nape_dynamics_InteractionGroupList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_dynamics_InteractionGroupIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_dynamics_InteractionGroupList
};
var nape_geom_AABB = function() {
	this.zpp_inner = null;
};
nape_geom_AABB.__name__ = true;
nape_geom_AABB.prototype = {
	toString: function() {
		this.zpp_inner.validate();
		return this.zpp_inner.toString();
	}
	,__class__: nape_geom_AABB
};
var nape_geom_ConvexResult = function() {
	this.zpp_inner = null;
};
nape_geom_ConvexResult.__name__ = true;
nape_geom_ConvexResult.prototype = {
	toString: function() {
		if(this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
		return "{ shape: " + Std.string((function($this) {
			var $r;
			if($this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
			$r = $this.zpp_inner.shape;
			return $r;
		}(this))) + " toi: " + (function($this) {
			var $r;
			if($this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
			$r = $this.zpp_inner.toiDistance;
			return $r;
		}(this)) + " }";
	}
	,__class__: nape_geom_ConvexResult
};
var nape_geom_ConvexResultIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$ConvexResultList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "ConvexResult" + "Iterator derp!");
};
nape_geom_ConvexResultIterator.__name__ = true;
nape_geom_ConvexResultIterator.get = function(list) {
	var ret;
	if(nape_geom_ConvexResultIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$ConvexResultList.internal = true;
		var ret1 = new nape_geom_ConvexResultIterator();
		zpp_$nape_util_ZPP_$ConvexResultList.internal = false;
		ret = ret1;
	} else {
		var r = nape_geom_ConvexResultIterator.zpp_pool;
		nape_geom_ConvexResultIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_geom_ConvexResultIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_geom_ConvexResultIterator.zpp_pool;
			nape_geom_ConvexResultIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_geom_ConvexResultIterator
};
var nape_geom_ConvexResultList = function() {
	this.zpp_inner = null;
};
nape_geom_ConvexResultList.__name__ = true;
nape_geom_ConvexResultList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_geom_ConvexResultIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_geom_ConvexResultList
};
var nape_geom_GeomPoly = function() {
	this.zpp_inner = null;
};
nape_geom_GeomPoly.__name__ = true;
nape_geom_GeomPoly.prototype = {
	toString: function() {
		var ret = "GeomPoly[";
		var F = this.zpp_inner.vertices;
		var L = this.zpp_inner.vertices;
		if(F != null) {
			var nite = F;
			do {
				var v = nite;
				if(v != this.zpp_inner.vertices) ret += ",";
				ret += "{" + v.x + "," + v.y + "}";
				nite = nite.next;
			} while(nite != L);
		}
		return ret + "]";
	}
	,__class__: nape_geom_GeomPoly
};
var nape_geom_GeomPolyIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$GeomPolyList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "GeomPoly" + "Iterator derp!");
};
nape_geom_GeomPolyIterator.__name__ = true;
nape_geom_GeomPolyIterator.get = function(list) {
	var ret;
	if(nape_geom_GeomPolyIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$GeomPolyList.internal = true;
		var ret1 = new nape_geom_GeomPolyIterator();
		zpp_$nape_util_ZPP_$GeomPolyList.internal = false;
		ret = ret1;
	} else {
		var r = nape_geom_GeomPolyIterator.zpp_pool;
		nape_geom_GeomPolyIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_geom_GeomPolyIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_geom_GeomPolyIterator.zpp_pool;
			nape_geom_GeomPolyIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_geom_GeomPolyIterator
};
var nape_geom_GeomPolyList = function() {
	this.zpp_inner = null;
};
nape_geom_GeomPolyList.__name__ = true;
nape_geom_GeomPolyList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_geom_GeomPolyIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_geom_GeomPolyList
};
var nape_geom_Mat23 = function() {
	this.zpp_inner = null;
};
nape_geom_Mat23.__name__ = true;
nape_geom_Mat23.prototype = {
	toString: function() {
		return "{ a: " + this.zpp_inner.a + " b: " + this.zpp_inner.b + " c: " + this.zpp_inner.c + " d: " + this.zpp_inner.d + " tx: " + this.zpp_inner.tx + " ty: " + this.zpp_inner.ty + " }";
	}
	,__class__: nape_geom_Mat23
};
var nape_geom_MatMN = function() {
	this.zpp_inner = null;
};
nape_geom_MatMN.__name__ = true;
nape_geom_MatMN.prototype = {
	toString: function() {
		var ret = "{ ";
		var fst = true;
		var _g1 = 0;
		var _g = this.zpp_inner.m;
		while(_g1 < _g) {
			var i = _g1++;
			if(!fst) ret += "; ";
			fst = false;
			var _g3 = 0;
			var _g2 = this.zpp_inner.n;
			while(_g3 < _g2) {
				var j = _g3++;
				ret += (function($this) {
					var $r;
					if(i < 0 || j < 0 || i >= $this.zpp_inner.m || j >= $this.zpp_inner.n) throw new js__$Boot_HaxeError("Error: MatMN indices out of range");
					$r = $this.zpp_inner.x[i * $this.zpp_inner.n + j];
					return $r;
				}(this)) + " ";
			}
		}
		ret += "}";
		return ret;
	}
	,__class__: nape_geom_MatMN
};
var nape_geom_RayResult = function() {
	this.zpp_inner = null;
};
nape_geom_RayResult.__name__ = true;
nape_geom_RayResult.prototype = {
	toString: function() {
		if(this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
		return "{ shape: " + Std.string((function($this) {
			var $r;
			if($this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
			$r = $this.zpp_inner.shape;
			return $r;
		}(this))) + " distance: " + (function($this) {
			var $r;
			if($this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
			$r = $this.zpp_inner.toiDistance;
			return $r;
		}(this)) + " ?inner: " + Std.string((function($this) {
			var $r;
			if($this.zpp_inner.next != null) throw new js__$Boot_HaxeError("Error: This object has been disposed of and cannot be used");
			$r = $this.zpp_inner.inner;
			return $r;
		}(this))) + " }";
	}
	,__class__: nape_geom_RayResult
};
var nape_geom_RayResultIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$RayResultList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "RayResult" + "Iterator derp!");
};
nape_geom_RayResultIterator.__name__ = true;
nape_geom_RayResultIterator.get = function(list) {
	var ret;
	if(nape_geom_RayResultIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$RayResultList.internal = true;
		var ret1 = new nape_geom_RayResultIterator();
		zpp_$nape_util_ZPP_$RayResultList.internal = false;
		ret = ret1;
	} else {
		var r = nape_geom_RayResultIterator.zpp_pool;
		nape_geom_RayResultIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_geom_RayResultIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_geom_RayResultIterator.zpp_pool;
			nape_geom_RayResultIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_geom_RayResultIterator
};
var nape_geom_RayResultList = function() {
	this.zpp_inner = null;
};
nape_geom_RayResultList.__name__ = true;
nape_geom_RayResultList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_geom_RayResultIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_geom_RayResultList
};
var nape_geom_Vec2 = function(x,y) {
	if(y == null) y = 0;
	if(x == null) x = 0;
	this.zpp_pool = null;
	this.zpp_inner = null;
	if(x != x || y != y) throw new js__$Boot_HaxeError("Error: Vec2 components cannot be NaN");
	this.zpp_inner = zpp_$nape_geom_ZPP_$Vec2.get(x,y,null);
	this.zpp_inner.outer = this;
};
nape_geom_Vec2.__name__ = true;
nape_geom_Vec2.get = function(x,y,weak) {
	if(weak == null) weak = false;
	if(y == null) y = 0;
	if(x == null) x = 0;
	if(x != x || y != y) throw new js__$Boot_HaxeError("Error: Vec2 components cannot be NaN");
	var ret;
	if(zpp_$nape_util_ZPP_$PubPool.poolVec2 == null) ret = new nape_geom_Vec2(); else {
		ret = zpp_$nape_util_ZPP_$PubPool.poolVec2;
		zpp_$nape_util_ZPP_$PubPool.poolVec2 = ret.zpp_pool;
		ret.zpp_pool = null;
		ret.zpp_disp = false;
		if(ret == zpp_$nape_util_ZPP_$PubPool.nextVec2) zpp_$nape_util_ZPP_$PubPool.nextVec2 = null;
	}
	if(ret.zpp_inner == null) {
		ret.zpp_inner = zpp_$nape_geom_ZPP_$Vec2.get(x,y,null);
		ret.zpp_inner.outer = ret;
	} else {
		if(ret != null && ret.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		ret.zpp_inner.immutable();
		if(x != x || y != y) throw new js__$Boot_HaxeError("Error: Vec2 components cannot be NaN");
		if(!((function($this) {
			var $r;
			if(ret != null && ret.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
			ret.zpp_inner.validate();
			$r = ret.zpp_inner.x;
			return $r;
		}(this)) == x && (function($this) {
			var $r;
			if(ret != null && ret.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
			ret.zpp_inner.validate();
			$r = ret.zpp_inner.y;
			return $r;
		}(this)) == y)) {
			ret.zpp_inner.x = x;
			ret.zpp_inner.y = y;
			ret.zpp_inner.invalidate();
		}
		ret;
	}
	ret.zpp_inner.weak = weak;
	return ret;
};
nape_geom_Vec2.prototype = {
	dispose: function() {
		if(this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		this.zpp_inner.immutable();
		if(this.zpp_inner._inuse) throw new js__$Boot_HaxeError("Error: This Vec2 is not disposable");
		var inner = this.zpp_inner;
		this.zpp_inner.outer = null;
		this.zpp_inner = null;
		var o = this;
		o.zpp_pool = null;
		if(zpp_$nape_util_ZPP_$PubPool.nextVec2 != null) zpp_$nape_util_ZPP_$PubPool.nextVec2.zpp_pool = o; else zpp_$nape_util_ZPP_$PubPool.poolVec2 = o;
		zpp_$nape_util_ZPP_$PubPool.nextVec2 = o;
		o.zpp_disp = true;
		var o1 = inner;
		if(o1.outer != null) {
			o1.outer.zpp_inner = null;
			o1.outer = null;
		}
		o1._isimmutable = null;
		o1._validate = null;
		o1._invalidate = null;
		o1.next = zpp_$nape_geom_ZPP_$Vec2.zpp_pool;
		zpp_$nape_geom_ZPP_$Vec2.zpp_pool = o1;
	}
	,get_x: function() {
		if(this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		this.zpp_inner.validate();
		return this.zpp_inner.x;
	}
	,get_y: function() {
		if(this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		this.zpp_inner.validate();
		return this.zpp_inner.y;
	}
	,setxy: function(x,y) {
		if(this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		this.zpp_inner.immutable();
		if(x != x || y != y) throw new js__$Boot_HaxeError("Error: Vec2 components cannot be NaN");
		if(!((function($this) {
			var $r;
			if($this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
			$this.zpp_inner.validate();
			$r = $this.zpp_inner.x;
			return $r;
		}(this)) == x && (function($this) {
			var $r;
			if($this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
			$this.zpp_inner.validate();
			$r = $this.zpp_inner.y;
			return $r;
		}(this)) == y)) {
			this.zpp_inner.x = x;
			this.zpp_inner.y = y;
			this.zpp_inner.invalidate();
		}
		return this;
	}
	,toString: function() {
		if(this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		this.zpp_inner.validate();
		return this.zpp_inner.toString();
	}
	,__class__: nape_geom_Vec2
};
var nape_geom_Vec2Iterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$Vec2List.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Vec2" + "Iterator derp!");
};
nape_geom_Vec2Iterator.__name__ = true;
nape_geom_Vec2Iterator.get = function(list) {
	var ret;
	if(nape_geom_Vec2Iterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$Vec2List.internal = true;
		var ret1 = new nape_geom_Vec2Iterator();
		zpp_$nape_util_ZPP_$Vec2List.internal = false;
		ret = ret1;
	} else {
		var r = nape_geom_Vec2Iterator.zpp_pool;
		nape_geom_Vec2Iterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_geom_Vec2Iterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.zpp_gl();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_geom_Vec2Iterator.zpp_pool;
			nape_geom_Vec2Iterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_geom_Vec2Iterator
};
var nape_geom_Vec2List = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$Vec2List();
	this.zpp_inner.outer = this;
};
nape_geom_Vec2List.__name__ = true;
nape_geom_Vec2List.prototype = {
	zpp_gl: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,zpp_vm: function() {
		this.zpp_inner.valmod();
	}
	,at: function(index) {
		this.zpp_vm();
		if(index < 0 || index >= this.zpp_gl()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.zpp_gl() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.wrapper();
	}
	,push: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Vec2" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_vm();
		var cont;
		if(this.zpp_inner.adder != null) cont = this.zpp_inner.adder(obj); else cont = true;
		if(cont) {
			if(this.zpp_inner.reverse_flag) this.zpp_inner.inner.add(obj.zpp_inner); else {
				if(this.zpp_inner.push_ite == null) if(this.empty()) this.zpp_inner.push_ite = null; else this.zpp_inner.push_ite = this.zpp_inner.inner.iterator_at(this.zpp_gl() - 1);
				this.zpp_inner.push_ite = this.zpp_inner.inner.insert(this.zpp_inner.push_ite,obj.zpp_inner);
			}
			this.zpp_inner.invalidate();
			if(this.zpp_inner.post_adder != null) this.zpp_inner.post_adder(obj);
		}
		return cont;
	}
	,empty: function() {
		return this.zpp_gl() == 0;
	}
	,iterator: function() {
		this.zpp_vm();
		return nape_geom_Vec2Iterator.get(this);
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g = this.iterator();
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_geom_Vec2List
};
var nape_geom_Vec3 = function() {
	this.zpp_inner = null;
};
nape_geom_Vec3.__name__ = true;
nape_geom_Vec3.prototype = {
	toString: function() {
		if(this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec3" + " has been disposed and cannot be used!");
		return "{ x: " + (function($this) {
			var $r;
			if($this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec3" + " has been disposed and cannot be used!");
			$this.zpp_inner.validate();
			$r = $this.zpp_inner.x;
			return $r;
		}(this)) + " y: " + (function($this) {
			var $r;
			if($this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec3" + " has been disposed and cannot be used!");
			$this.zpp_inner.validate();
			$r = $this.zpp_inner.y;
			return $r;
		}(this)) + " z: " + (function($this) {
			var $r;
			if($this.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec3" + " has been disposed and cannot be used!");
			$this.zpp_inner.validate();
			$r = $this.zpp_inner.z;
			return $r;
		}(this)) + " }";
	}
	,__class__: nape_geom_Vec3
};
var nape_geom_Winding = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Winding" + " derp!");
};
nape_geom_Winding.__name__ = true;
nape_geom_Winding.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.Winding_UNDEFINED == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.Winding_UNDEFINED = new nape_geom_Winding();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.Winding_UNDEFINED;
			return $r;
		}(this))) return "UNDEFINED"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.Winding_CLOCKWISE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.Winding_CLOCKWISE = new nape_geom_Winding();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.Winding_CLOCKWISE;
			return $r;
		}(this))) return "CLOCKWISE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.Winding_ANTICLOCKWISE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.Winding_ANTICLOCKWISE = new nape_geom_Winding();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.Winding_ANTICLOCKWISE;
			return $r;
		}(this))) return "ANTICLOCKWISE"; else return "";
	}
	,__class__: nape_geom_Winding
};
var nape_phys_Interactor = function() {
	this.zpp_inner_i = null;
	if(!nape_phys_Interactor.zpp_internalAlloc) throw new js__$Boot_HaxeError("Error: Cannot instantiate an Interactor, only Shape/Body/Compound");
};
nape_phys_Interactor.__name__ = true;
nape_phys_Interactor.prototype = {
	toString: function() {
		return "";
	}
	,__class__: nape_phys_Interactor
};
var nape_phys_Body = function(type,position) {
	this.zpp_inner = null;
	nape_phys_Interactor.zpp_internalAlloc = true;
	nape_phys_Interactor.call(this);
	nape_phys_Interactor.zpp_internalAlloc = false;
	this.zpp_inner = new zpp_$nape_phys_ZPP_$Body();
	this.zpp_inner.outer = this;
	this.zpp_inner.outer_i = this;
	this.zpp_inner_i = this.zpp_inner;
	if(position != null) {
		if(position != null && position.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		if(position != null && position.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		position.zpp_inner.validate();
		this.zpp_inner.posx = position.zpp_inner.x;
		if(position != null && position.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		position.zpp_inner.validate();
		this.zpp_inner.posy = position.zpp_inner.y;
	} else {
		this.zpp_inner.posx = 0;
		this.zpp_inner.posy = 0;
	}
	this.set_type(type == null?(function($this) {
		var $r;
		if(zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC == null) {
			zpp_$nape_util_ZPP_$Flags.internal = true;
			zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC = new nape_phys_BodyType();
			zpp_$nape_util_ZPP_$Flags.internal = false;
		}
		$r = zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC;
		return $r;
	}(this)):type);
	if(position != null) {
		if(position.zpp_inner.weak) {
			position.dispose();
			true;
		} else false;
	}
	this.zpp_inner_i.insert_cbtype(zpp_$nape_callbacks_ZPP_$CbType.ANY_BODY.zpp_inner);
};
nape_phys_Body.__name__ = true;
nape_phys_Body.__super__ = nape_phys_Interactor;
nape_phys_Body.prototype = $extend(nape_phys_Interactor.prototype,{
	set_type: function(type) {
		this.zpp_inner.immutable_midstep("Body::type");
		if(this.zpp_inner.world) throw new js__$Boot_HaxeError("Error: Space::world is immutable");
		if(zpp_$nape_phys_ZPP_$Body.types[this.zpp_inner.type] != type) {
			if(type == null) throw new js__$Boot_HaxeError("Error: Cannot use null BodyType");
			var ntype;
			if(type == (function($this) {
				var $r;
				if(zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC == null) {
					zpp_$nape_util_ZPP_$Flags.internal = true;
					zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC = new nape_phys_BodyType();
					zpp_$nape_util_ZPP_$Flags.internal = false;
				}
				$r = zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC;
				return $r;
			}(this))) ntype = 2; else if(type == (function($this) {
				var $r;
				if(zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC == null) {
					zpp_$nape_util_ZPP_$Flags.internal = true;
					zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC = new nape_phys_BodyType();
					zpp_$nape_util_ZPP_$Flags.internal = false;
				}
				$r = zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC;
				return $r;
			}(this))) ntype = 3; else ntype = 1;
			if(ntype == 1 && this.zpp_inner.space != null) {
				this.zpp_inner.velx = 0;
				this.zpp_inner.vely = 0;
				this.zpp_inner.angvel = 0;
			}
			this.zpp_inner.invalidate_type();
			if(this.zpp_inner.space != null) this.zpp_inner.space.transmitType(this.zpp_inner,ntype); else this.zpp_inner.type = ntype;
		}
		return zpp_$nape_phys_ZPP_$Body.types[this.zpp_inner.type];
	}
	,set_space: function(space) {
		if(this.zpp_inner.compound != null) throw new js__$Boot_HaxeError("Error: Cannot set the space of a Body belonging to a Compound, only the root Compound space can be set");
		this.zpp_inner.immutable_midstep("Body::space");
		if(this.zpp_inner.world) throw new js__$Boot_HaxeError("Error: Space::world is immutable");
		if((this.zpp_inner.space == null?null:this.zpp_inner.space.outer) != space) {
			if((this.zpp_inner.space == null?null:this.zpp_inner.space.outer) != null) this.zpp_inner.component.woken = false;
			if((this.zpp_inner.space == null?null:this.zpp_inner.space.outer) != null) (this.zpp_inner.space == null?null:this.zpp_inner.space.outer).zpp_inner.wrap_bodies.remove(this);
			if(space != null) space.zpp_inner.wrap_bodies.add(this);
		}
		if(this.zpp_inner.space == null) return null; else return this.zpp_inner.space.outer;
	}
	,get_position: function() {
		if(this.zpp_inner.wrap_pos == null) this.zpp_inner.setupPosition();
		return this.zpp_inner.wrap_pos;
	}
	,setShapeMaterials: function(material) {
		this.zpp_inner.immutable_midstep("Body::setShapeMaterials()");
		if(this.zpp_inner.world) throw new js__$Boot_HaxeError("Error: Space::world is immutable");
		var cx_ite = this.zpp_inner.shapes.head;
		while(cx_ite != null) {
			var s = cx_ite.elt;
			s.outer.set_material(material);
			cx_ite = cx_ite.next;
		}
		return this;
	}
	,toString: function() {
		return (this.zpp_inner.world?"(space::world":"(" + (this.zpp_inner.type == 2?"dynamic":this.zpp_inner.type == 1?"static":"kinematic")) + ")#" + this.zpp_inner_i.id;
	}
	,__class__: nape_phys_Body
});
var nape_phys_BodyIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$BodyList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Body" + "Iterator derp!");
};
nape_phys_BodyIterator.__name__ = true;
nape_phys_BodyIterator.get = function(list) {
	var ret;
	if(nape_phys_BodyIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$BodyList.internal = true;
		var ret1 = new nape_phys_BodyIterator();
		zpp_$nape_util_ZPP_$BodyList.internal = false;
		ret = ret1;
	} else {
		var r = nape_phys_BodyIterator.zpp_pool;
		nape_phys_BodyIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_phys_BodyIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_phys_BodyIterator.zpp_pool;
			nape_phys_BodyIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_phys_BodyIterator
};
var nape_phys_BodyList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$BodyList();
	this.zpp_inner.outer = this;
};
nape_phys_BodyList.__name__ = true;
nape_phys_BodyList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,push: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Body" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var cont;
		if(this.zpp_inner.adder != null) cont = this.zpp_inner.adder(obj); else cont = true;
		if(cont) {
			if(this.zpp_inner.reverse_flag) this.zpp_inner.inner.add(obj.zpp_inner); else {
				if(this.zpp_inner.push_ite == null) if(this.zpp_inner.inner.head == null) this.zpp_inner.push_ite = null; else this.zpp_inner.push_ite = this.zpp_inner.inner.iterator_at(this.get_length() - 1);
				this.zpp_inner.push_ite = this.zpp_inner.inner.insert(this.zpp_inner.push_ite,obj.zpp_inner);
			}
			this.zpp_inner.invalidate();
			if(this.zpp_inner.post_adder != null) this.zpp_inner.post_adder(obj);
		}
		return cont;
	}
	,unshift: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Body" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var cont;
		if(this.zpp_inner.adder != null) cont = this.zpp_inner.adder(obj); else cont = true;
		if(cont) {
			if(this.zpp_inner.reverse_flag) {
				if(this.zpp_inner.push_ite == null) if(this.zpp_inner.inner.head == null) this.zpp_inner.push_ite = null; else this.zpp_inner.push_ite = this.zpp_inner.inner.iterator_at(this.get_length() - 1);
				this.zpp_inner.push_ite = this.zpp_inner.inner.insert(this.zpp_inner.push_ite,obj.zpp_inner);
			} else this.zpp_inner.inner.add(obj.zpp_inner);
			this.zpp_inner.invalidate();
			if(this.zpp_inner.post_adder != null) this.zpp_inner.post_adder(obj);
		}
		return cont;
	}
	,add: function(obj) {
		if(this.zpp_inner.reverse_flag) return this.push(obj); else return this.unshift(obj);
	}
	,remove: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Body" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var ret;
		ret = false;
		var cx_ite = this.zpp_inner.inner.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x == obj.zpp_inner) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(ret) {
			if(this.zpp_inner.subber != null) this.zpp_inner.subber(obj);
			if(!this.zpp_inner.dontremove) this.zpp_inner.inner.remove(obj.zpp_inner);
			this.zpp_inner.invalidate();
		}
		return ret;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_phys_BodyIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_phys_BodyList
};
var nape_phys_BodyType = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "BodyType" + " derp!");
};
nape_phys_BodyType.__name__ = true;
nape_phys_BodyType.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.BodyType_STATIC == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.BodyType_STATIC = new nape_phys_BodyType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.BodyType_STATIC;
			return $r;
		}(this))) return "STATIC"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC = new nape_phys_BodyType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC;
			return $r;
		}(this))) return "DYNAMIC"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC = new nape_phys_BodyType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC;
			return $r;
		}(this))) return "KINEMATIC"; else return "";
	}
	,__class__: nape_phys_BodyType
};
var nape_phys_Compound = function() {
	this.zpp_inner = null;
};
nape_phys_Compound.__name__ = true;
nape_phys_Compound.__super__ = nape_phys_Interactor;
nape_phys_Compound.prototype = $extend(nape_phys_Interactor.prototype,{
	toString: function() {
		return "Compound" + this.zpp_inner_i.id;
	}
	,__class__: nape_phys_Compound
});
var nape_phys_CompoundIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$CompoundList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Compound" + "Iterator derp!");
};
nape_phys_CompoundIterator.__name__ = true;
nape_phys_CompoundIterator.get = function(list) {
	var ret;
	if(nape_phys_CompoundIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$CompoundList.internal = true;
		var ret1 = new nape_phys_CompoundIterator();
		zpp_$nape_util_ZPP_$CompoundList.internal = false;
		ret = ret1;
	} else {
		var r = nape_phys_CompoundIterator.zpp_pool;
		nape_phys_CompoundIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_phys_CompoundIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_phys_CompoundIterator.zpp_pool;
			nape_phys_CompoundIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_phys_CompoundIterator
};
var nape_phys_CompoundList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$CompoundList();
	this.zpp_inner.outer = this;
};
nape_phys_CompoundList.__name__ = true;
nape_phys_CompoundList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,remove: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Compound" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var ret;
		ret = false;
		var cx_ite = this.zpp_inner.inner.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x == obj.zpp_inner) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(ret) {
			if(this.zpp_inner.subber != null) this.zpp_inner.subber(obj);
			if(!this.zpp_inner.dontremove) this.zpp_inner.inner.remove(obj.zpp_inner);
			this.zpp_inner.invalidate();
		}
		return ret;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_phys_CompoundIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_phys_CompoundList
};
var nape_phys_FluidProperties = function() {
	this.zpp_inner = null;
};
nape_phys_FluidProperties.__name__ = true;
nape_phys_FluidProperties.prototype = {
	toString: function() {
		return "{ density: " + this.zpp_inner.density * 1000 + " viscosity: " + this.zpp_inner.viscosity + " gravity: " + Std.string(this.zpp_inner.wrap_gravity) + " }";
	}
	,__class__: nape_phys_FluidProperties
};
var nape_phys_GravMassMode = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "GravMassMode" + " derp!");
};
nape_phys_GravMassMode.__name__ = true;
nape_phys_GravMassMode.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.GravMassMode_DEFAULT == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.GravMassMode_DEFAULT = new nape_phys_GravMassMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.GravMassMode_DEFAULT;
			return $r;
		}(this))) return "DEFAULT"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.GravMassMode_FIXED == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.GravMassMode_FIXED = new nape_phys_GravMassMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.GravMassMode_FIXED;
			return $r;
		}(this))) return "FIXED"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.GravMassMode_SCALED == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.GravMassMode_SCALED = new nape_phys_GravMassMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.GravMassMode_SCALED;
			return $r;
		}(this))) return "SCALED"; else return "";
	}
	,__class__: nape_phys_GravMassMode
};
var nape_phys_InertiaMode = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "InertiaMode" + " derp!");
};
nape_phys_InertiaMode.__name__ = true;
nape_phys_InertiaMode.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.InertiaMode_DEFAULT == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.InertiaMode_DEFAULT = new nape_phys_InertiaMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.InertiaMode_DEFAULT;
			return $r;
		}(this))) return "DEFAULT"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.InertiaMode_FIXED == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.InertiaMode_FIXED = new nape_phys_InertiaMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.InertiaMode_FIXED;
			return $r;
		}(this))) return "FIXED"; else return "";
	}
	,__class__: nape_phys_InertiaMode
};
var nape_phys_InteractorIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$InteractorList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Interactor" + "Iterator derp!");
};
nape_phys_InteractorIterator.__name__ = true;
nape_phys_InteractorIterator.get = function(list) {
	var ret;
	if(nape_phys_InteractorIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$InteractorList.internal = true;
		var ret1 = new nape_phys_InteractorIterator();
		zpp_$nape_util_ZPP_$InteractorList.internal = false;
		ret = ret1;
	} else {
		var r = nape_phys_InteractorIterator.zpp_pool;
		nape_phys_InteractorIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_phys_InteractorIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_phys_InteractorIterator.zpp_pool;
			nape_phys_InteractorIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_phys_InteractorIterator
};
var nape_phys_InteractorList = function() {
	this.zpp_inner = null;
};
nape_phys_InteractorList.__name__ = true;
nape_phys_InteractorList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer_i;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_phys_InteractorIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_phys_InteractorList
};
var nape_phys_MassMode = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "MassMode" + " derp!");
};
nape_phys_MassMode.__name__ = true;
nape_phys_MassMode.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.MassMode_DEFAULT == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.MassMode_DEFAULT = new nape_phys_MassMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.MassMode_DEFAULT;
			return $r;
		}(this))) return "DEFAULT"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.MassMode_FIXED == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.MassMode_FIXED = new nape_phys_MassMode();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.MassMode_FIXED;
			return $r;
		}(this))) return "FIXED"; else return "";
	}
	,__class__: nape_phys_MassMode
};
var nape_phys_Material = function(elasticity,dynamicFriction,staticFriction,density,rollingFriction) {
	if(rollingFriction == null) rollingFriction = 0.001;
	if(density == null) density = 1;
	if(staticFriction == null) staticFriction = 2.0;
	if(dynamicFriction == null) dynamicFriction = 1.0;
	if(elasticity == null) elasticity = 0.0;
	this.zpp_inner = null;
	if(zpp_$nape_phys_ZPP_$Material.zpp_pool == null) this.zpp_inner = new zpp_$nape_phys_ZPP_$Material(); else {
		this.zpp_inner = zpp_$nape_phys_ZPP_$Material.zpp_pool;
		zpp_$nape_phys_ZPP_$Material.zpp_pool = this.zpp_inner.next;
		this.zpp_inner.next = null;
	}
	null;
	this.zpp_inner.outer = this;
	if(elasticity != this.zpp_inner.elasticity) {
		if(elasticity != elasticity) throw new js__$Boot_HaxeError("Error: Material::" + "elasticity" + " cannot be NaN");
		this.zpp_inner.elasticity = elasticity / 1;
		this.zpp_inner.invalidate(zpp_$nape_phys_ZPP_$Material.WAKE | zpp_$nape_phys_ZPP_$Material.ARBITERS);
	}
	this.zpp_inner.elasticity;
	if(dynamicFriction != this.zpp_inner.dynamicFriction) {
		if(dynamicFriction != dynamicFriction) throw new js__$Boot_HaxeError("Error: Material::" + "dynamicFriction" + " cannot be NaN");
		if(dynamicFriction < 0) throw new js__$Boot_HaxeError("Error: Material::" + "dynamicFriction" + " cannot be negative");
		this.zpp_inner.dynamicFriction = dynamicFriction / 1;
		this.zpp_inner.invalidate(zpp_$nape_phys_ZPP_$Material.WAKE | zpp_$nape_phys_ZPP_$Material.ANGDRAG | zpp_$nape_phys_ZPP_$Material.ARBITERS);
	}
	this.zpp_inner.dynamicFriction;
	if(staticFriction != this.zpp_inner.staticFriction) {
		if(staticFriction != staticFriction) throw new js__$Boot_HaxeError("Error: Material::" + "staticFriction" + " cannot be NaN");
		if(staticFriction < 0) throw new js__$Boot_HaxeError("Error: Material::" + "staticFriction" + " cannot be negative");
		this.zpp_inner.staticFriction = staticFriction / 1;
		this.zpp_inner.invalidate(zpp_$nape_phys_ZPP_$Material.WAKE | zpp_$nape_phys_ZPP_$Material.ARBITERS);
	}
	this.zpp_inner.staticFriction;
	if(density != this.zpp_inner.density * 1000) {
		if(density != density) throw new js__$Boot_HaxeError("Error: Material::" + "density" + " cannot be NaN");
		if(density < 0) throw new js__$Boot_HaxeError("Error: Material::density must be positive");
		if(density < 0) throw new js__$Boot_HaxeError("Error: Material::" + "density" + " cannot be negative");
		this.zpp_inner.density = density / 1000;
		this.zpp_inner.invalidate(zpp_$nape_phys_ZPP_$Material.WAKE | zpp_$nape_phys_ZPP_$Material.PROPS);
	}
	this.zpp_inner.density * 1000;
	if(rollingFriction != this.zpp_inner.rollingFriction) {
		if(rollingFriction != rollingFriction) throw new js__$Boot_HaxeError("Error: Material::" + "rollingFriction" + " cannot be NaN");
		if(rollingFriction < 0) throw new js__$Boot_HaxeError("Error: Material::" + "rollingFriction" + " cannot be negative");
		this.zpp_inner.rollingFriction = rollingFriction / 1;
		this.zpp_inner.invalidate(zpp_$nape_phys_ZPP_$Material.WAKE | zpp_$nape_phys_ZPP_$Material.ARBITERS);
	}
	this.zpp_inner.rollingFriction;
};
nape_phys_Material.__name__ = true;
nape_phys_Material.wood = function() {
	return new nape_phys_Material(0.4,0.2,0.38,0.7,0.005);
};
nape_phys_Material.rubber = function() {
	return new nape_phys_Material(0.8,1.0,1.4,1.5,0.01);
};
nape_phys_Material.prototype = {
	toString: function() {
		return "{ elasticity: " + this.zpp_inner.elasticity + " dynamicFriction: " + this.zpp_inner.dynamicFriction + " staticFriction: " + this.zpp_inner.staticFriction + " density: " + this.zpp_inner.density * 1000 + " rollingFriction: " + this.zpp_inner.rollingFriction + " }";
	}
	,__class__: nape_phys_Material
};
var nape_shape_Shape = function() {
	this.zpp_inner = null;
	nape_phys_Interactor.zpp_internalAlloc = true;
	nape_phys_Interactor.call(this);
	nape_phys_Interactor.zpp_internalAlloc = false;
	if(!nape_shape_Shape.zpp_internalAlloc) throw new js__$Boot_HaxeError("Error: Shape cannot be instantiated derp!");
};
nape_shape_Shape.__name__ = true;
nape_shape_Shape.__super__ = nape_phys_Interactor;
nape_shape_Shape.prototype = $extend(nape_phys_Interactor.prototype,{
	set_material: function(material) {
		this.zpp_inner.immutable_midstep("Shape::material");
		if(material == null) throw new js__$Boot_HaxeError("Error: Cannot assign null as Shape material");
		this.zpp_inner.setMaterial(material.zpp_inner);
		return this.zpp_inner.material.wrapper();
	}
	,toString: function() {
		var ret;
		if(this.zpp_inner.type == 0) ret = "Circle"; else ret = "Polygon";
		return ret + "#" + this.zpp_inner_i.id;
	}
	,__class__: nape_shape_Shape
});
var nape_shape_Circle = function(radius,localCOM,material,filter) {
	this.zpp_inner_zn = null;
	nape_shape_Shape.zpp_internalAlloc = true;
	nape_shape_Shape.call(this);
	nape_shape_Shape.zpp_internalAlloc = false;
	this.zpp_inner_zn = new zpp_$nape_shape_ZPP_$Circle();
	this.zpp_inner_zn.outer = this;
	this.zpp_inner_zn.outer_zn = this;
	this.zpp_inner = this.zpp_inner_zn;
	this.zpp_inner_i = this.zpp_inner;
	this.zpp_inner_i.outer_i = this;
	this.zpp_inner.immutable_midstep("Circle::radius");
	if(this.zpp_inner.body != null && this.zpp_inner.body.type == 1 && this.zpp_inner.body.space != null) throw new js__$Boot_HaxeError("Error: Cannot modifiy radius of Circle contained in static object once added to space");
	if(radius != this.zpp_inner_zn.radius) {
		if(radius != radius) throw new js__$Boot_HaxeError("Error: Circle::radius cannot be NaN");
		if(radius < nape_Config.epsilon) throw new js__$Boot_HaxeError("Error: Circle::radius (" + radius + ") must be > Config.epsilon");
		if(radius > 1e100) throw new js__$Boot_HaxeError("Error: Circle::radius (" + radius + ") must be < PR(Const).FMAX");
		this.zpp_inner_zn.radius = radius;
		this.zpp_inner_zn.invalidate_radius();
	}
	this.zpp_inner_zn.radius;
	if(localCOM == null) {
		this.zpp_inner.localCOMx = 0;
		this.zpp_inner.localCOMy = 0;
	} else {
		if(localCOM != null && localCOM.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		if(localCOM != null && localCOM.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		localCOM.zpp_inner.validate();
		this.zpp_inner.localCOMx = localCOM.zpp_inner.x;
		if(localCOM != null && localCOM.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
		localCOM.zpp_inner.validate();
		this.zpp_inner.localCOMy = localCOM.zpp_inner.y;
		if(localCOM.zpp_inner.weak) {
			localCOM.dispose();
			true;
		} else false;
	}
	if(material == null) {
		if(zpp_$nape_phys_ZPP_$Material.zpp_pool == null) this.zpp_inner.material = new zpp_$nape_phys_ZPP_$Material(); else {
			this.zpp_inner.material = zpp_$nape_phys_ZPP_$Material.zpp_pool;
			zpp_$nape_phys_ZPP_$Material.zpp_pool = this.zpp_inner.material.next;
			this.zpp_inner.material.next = null;
		}
		null;
	} else {
		this.zpp_inner.immutable_midstep("Shape::material");
		if(material == null) throw new js__$Boot_HaxeError("Error: Cannot assign null as Shape material");
		this.zpp_inner.setMaterial(material.zpp_inner);
		this.zpp_inner.material.wrapper();
	}
	if(filter == null) {
		if(zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool == null) this.zpp_inner.filter = new zpp_$nape_dynamics_ZPP_$InteractionFilter(); else {
			this.zpp_inner.filter = zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool;
			zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool = this.zpp_inner.filter.next;
			this.zpp_inner.filter.next = null;
		}
		null;
	} else {
		this.zpp_inner.immutable_midstep("Shape::filter");
		if(filter == null) throw new js__$Boot_HaxeError("Error: Cannot assign null as Shape filter");
		this.zpp_inner.setFilter(filter.zpp_inner);
		this.zpp_inner.filter.wrapper();
	}
	this.zpp_inner_i.insert_cbtype(zpp_$nape_callbacks_ZPP_$CbType.ANY_SHAPE.zpp_inner);
};
nape_shape_Circle.__name__ = true;
nape_shape_Circle.__super__ = nape_shape_Shape;
nape_shape_Circle.prototype = $extend(nape_shape_Shape.prototype,{
	__class__: nape_shape_Circle
});
var nape_shape_Edge = function() {
	this.zpp_inner = null;
	if(!zpp_$nape_shape_ZPP_$Edge.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate an Edge derp!");
};
nape_shape_Edge.__name__ = true;
nape_shape_Edge.prototype = {
	toString: function() {
		if(this.zpp_inner.polygon == null) return "Edge(object-pooled)"; else if(this.zpp_inner.polygon.body == null) {
			this.zpp_inner.polygon.validate_laxi();
			return "{ localNormal : " + ("{ x: " + this.zpp_inner.lnormx + " y: " + this.zpp_inner.lnormy + " }") + " }";
		} else {
			this.zpp_inner.polygon.validate_gaxi();
			return "{ localNormal : " + ("{ x: " + this.zpp_inner.lnormx + " y: " + this.zpp_inner.lnormy + " }") + " worldNormal : " + ("{ x: " + this.zpp_inner.gnormx + " y: " + this.zpp_inner.gnormy + " }") + " }";
		}
	}
	,__class__: nape_shape_Edge
};
var nape_shape_EdgeIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$EdgeList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Edge" + "Iterator derp!");
};
nape_shape_EdgeIterator.__name__ = true;
nape_shape_EdgeIterator.get = function(list) {
	var ret;
	if(nape_shape_EdgeIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$EdgeList.internal = true;
		var ret1 = new nape_shape_EdgeIterator();
		zpp_$nape_util_ZPP_$EdgeList.internal = false;
		ret = ret1;
	} else {
		var r = nape_shape_EdgeIterator.zpp_pool;
		nape_shape_EdgeIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_shape_EdgeIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_shape_EdgeIterator.zpp_pool;
			nape_shape_EdgeIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_shape_EdgeIterator
};
var nape_shape_EdgeList = function() {
	this.zpp_inner = null;
};
nape_shape_EdgeList.__name__ = true;
nape_shape_EdgeList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) if(index == this.get_length() - 1) index = index; else index = this.get_length() - 2 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.wrapper();
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_shape_EdgeIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_shape_EdgeList
};
var nape_shape_Polygon = function(localVerts,material,filter) {
	this.zpp_inner_zn = null;
	nape_shape_Shape.zpp_internalAlloc = true;
	nape_shape_Shape.call(this);
	nape_shape_Shape.zpp_internalAlloc = false;
	if(localVerts == null) throw new js__$Boot_HaxeError("Error: localVerts cannot be null");
	this.zpp_inner_zn = new zpp_$nape_shape_ZPP_$Polygon();
	this.zpp_inner_zn.outer = this;
	this.zpp_inner_zn.outer_zn = this;
	this.zpp_inner = this.zpp_inner_zn;
	this.zpp_inner_i = this.zpp_inner;
	this.zpp_inner_i.outer_i = this;
	if((localVerts instanceof Array) && localVerts.__enum__ == null) {
		var lv = localVerts;
		var _g = 0;
		while(_g < lv.length) {
			var vite = lv[_g];
			++_g;
			if(vite == null) throw new js__$Boot_HaxeError("Error: Array<Vec2> contains null objects");
			if(!js_Boot.__instanceof(vite,nape_geom_Vec2)) throw new js__$Boot_HaxeError("Error: Array<Vec2> contains non Vec2 objects");
			var x = vite;
			if(x != null && x.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
			((function($this) {
				var $r;
				if($this.zpp_inner_zn.wrap_lverts == null) $this.zpp_inner_zn.getlverts();
				$r = $this.zpp_inner_zn.wrap_lverts;
				return $r;
			}(this))).push((function($this) {
				var $r;
				if(x != null && x.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
				$r = nape_geom_Vec2.get((function($this) {
					var $r;
					if(x != null && x.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
					x.zpp_inner.validate();
					$r = x.zpp_inner.x;
					return $r;
				}($this)),(function($this) {
					var $r;
					if(x != null && x.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
					x.zpp_inner.validate();
					$r = x.zpp_inner.y;
					return $r;
				}($this)),false);
				return $r;
			}(this)));
		}
	} else if(js_Boot.__instanceof(localVerts,nape_geom_Vec2List)) {
		var lv1 = localVerts;
		var _g1 = lv1.iterator();
		while(_g1.hasNext()) {
			var x1;
			_g1.zpp_critical = false;
			x1 = _g1.zpp_inner.at(_g1.zpp_i++);
			if(x1 == null) throw new js__$Boot_HaxeError("Error: Vec2List contains null objects");
			if(x1 != null && x1.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
			((function($this) {
				var $r;
				if($this.zpp_inner_zn.wrap_lverts == null) $this.zpp_inner_zn.getlverts();
				$r = $this.zpp_inner_zn.wrap_lverts;
				return $r;
			}(this))).push((function($this) {
				var $r;
				if(x1 != null && x1.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
				$r = nape_geom_Vec2.get((function($this) {
					var $r;
					if(x1 != null && x1.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
					x1.zpp_inner.validate();
					$r = x1.zpp_inner.x;
					return $r;
				}($this)),(function($this) {
					var $r;
					if(x1 != null && x1.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
					x1.zpp_inner.validate();
					$r = x1.zpp_inner.y;
					return $r;
				}($this)),false);
				return $r;
			}(this)));
		}
	} else if(js_Boot.__instanceof(localVerts,nape_geom_GeomPoly)) {
		var lv2 = localVerts;
		if(lv2 != null && lv2.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "GeomPoly" + " has been disposed and cannot be used!");
		var verts = lv2.zpp_inner.vertices;
		if(verts != null) {
			var vite1 = verts;
			do {
				var x2 = nape_geom_Vec2.get(vite1.x,vite1.y,null);
				vite1 = vite1.next;
				((function($this) {
					var $r;
					if($this.zpp_inner_zn.wrap_lverts == null) $this.zpp_inner_zn.getlverts();
					$r = $this.zpp_inner_zn.wrap_lverts;
					return $r;
				}(this))).push((function($this) {
					var $r;
					if(x2 != null && x2.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
					$r = nape_geom_Vec2.get((function($this) {
						var $r;
						if(x2 != null && x2.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
						x2.zpp_inner.validate();
						$r = x2.zpp_inner.x;
						return $r;
					}($this)),(function($this) {
						var $r;
						if(x2 != null && x2.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
						x2.zpp_inner.validate();
						$r = x2.zpp_inner.y;
						return $r;
					}($this)),false);
					return $r;
				}(this)));
				x2.dispose();
			} while(vite1 != verts);
		}
	} else throw new js__$Boot_HaxeError("Error: Invalid type for polygon object, should be Array<Vec2>, Vec2List, GeomPoly or for flash10+ flash.Vector<Vec2>");
	if((localVerts instanceof Array) && localVerts.__enum__ == null) {
		var lv3 = localVerts;
		var i = 0;
		while(i < lv3.length) {
			var cur = lv3[i];
			if(cur.zpp_inner.weak?(function($this) {
				var $r;
				cur.dispose();
				$r = true;
				return $r;
			}(this)):false) {
				lv3.splice(i,1);
				continue;
			}
			i++;
		}
	} else if(js_Boot.__instanceof(localVerts,nape_geom_Vec2List)) {
		var lv4 = localVerts;
		if(lv4.zpp_inner._validate != null) lv4.zpp_inner._validate();
		var ins = lv4.zpp_inner.inner;
		var pre = null;
		var cur1 = ins.head;
		while(cur1 != null) {
			var x3 = cur1.elt;
			if(x3.outer.zpp_inner.weak) {
				cur1 = ins.erase(pre);
				if(x3.outer.zpp_inner.weak) {
					x3.outer.dispose();
					true;
				} else false;
			} else {
				pre = cur1;
				cur1 = cur1.next;
			}
		}
	}
	if(material == null) {
		if(zpp_$nape_phys_ZPP_$Material.zpp_pool == null) this.zpp_inner.material = new zpp_$nape_phys_ZPP_$Material(); else {
			this.zpp_inner.material = zpp_$nape_phys_ZPP_$Material.zpp_pool;
			zpp_$nape_phys_ZPP_$Material.zpp_pool = this.zpp_inner.material.next;
			this.zpp_inner.material.next = null;
		}
		null;
	} else {
		this.zpp_inner.immutable_midstep("Shape::material");
		if(material == null) throw new js__$Boot_HaxeError("Error: Cannot assign null as Shape material");
		this.zpp_inner.setMaterial(material.zpp_inner);
		this.zpp_inner.material.wrapper();
	}
	if(filter == null) {
		if(zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool == null) this.zpp_inner.filter = new zpp_$nape_dynamics_ZPP_$InteractionFilter(); else {
			this.zpp_inner.filter = zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool;
			zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool = this.zpp_inner.filter.next;
			this.zpp_inner.filter.next = null;
		}
		null;
	} else {
		this.zpp_inner.immutable_midstep("Shape::filter");
		if(filter == null) throw new js__$Boot_HaxeError("Error: Cannot assign null as Shape filter");
		this.zpp_inner.setFilter(filter.zpp_inner);
		this.zpp_inner.filter.wrapper();
	}
	this.zpp_inner_i.insert_cbtype(zpp_$nape_callbacks_ZPP_$CbType.ANY_SHAPE.zpp_inner);
};
nape_shape_Polygon.__name__ = true;
nape_shape_Polygon.rect = function(x,y,width,height,weak) {
	if(weak == null) weak = false;
	if(x != x || y != y || width != width || height != height) throw new js__$Boot_HaxeError("Error: Polygon.rect cannot accept NaN arguments");
	return [nape_geom_Vec2.get(x,y,weak),nape_geom_Vec2.get(x + width,y,weak),nape_geom_Vec2.get(x + width,y + height,weak),nape_geom_Vec2.get(x,y + height,weak)];
};
nape_shape_Polygon.__super__ = nape_shape_Shape;
nape_shape_Polygon.prototype = $extend(nape_shape_Shape.prototype,{
	__class__: nape_shape_Polygon
});
var nape_shape_ShapeIterator = function() {
	this.zpp_next = null;
	this.zpp_critical = false;
	this.zpp_i = 0;
	this.zpp_inner = null;
	if(!zpp_$nape_util_ZPP_$ShapeList.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Shape" + "Iterator derp!");
};
nape_shape_ShapeIterator.__name__ = true;
nape_shape_ShapeIterator.get = function(list) {
	var ret;
	if(nape_shape_ShapeIterator.zpp_pool == null) {
		zpp_$nape_util_ZPP_$ShapeList.internal = true;
		var ret1 = new nape_shape_ShapeIterator();
		zpp_$nape_util_ZPP_$ShapeList.internal = false;
		ret = ret1;
	} else {
		var r = nape_shape_ShapeIterator.zpp_pool;
		nape_shape_ShapeIterator.zpp_pool = r.zpp_next;
		ret = r;
	}
	ret.zpp_i = 0;
	ret.zpp_inner = list;
	ret.zpp_critical = false;
	return ret;
};
nape_shape_ShapeIterator.prototype = {
	hasNext: function() {
		this.zpp_inner.zpp_inner.valmod();
		var length = this.zpp_inner.get_length();
		this.zpp_critical = true;
		if(this.zpp_i < length) return true; else {
			this.zpp_next = nape_shape_ShapeIterator.zpp_pool;
			nape_shape_ShapeIterator.zpp_pool = this;
			this.zpp_inner = null;
			return false;
		}
	}
	,next: function() {
		this.zpp_critical = false;
		return this.zpp_inner.at(this.zpp_i++);
	}
	,__class__: nape_shape_ShapeIterator
};
var nape_shape_ShapeList = function() {
	this.zpp_inner = null;
	this.zpp_inner = new zpp_$nape_util_ZPP_$ShapeList();
	this.zpp_inner.outer = this;
};
nape_shape_ShapeList.__name__ = true;
nape_shape_ShapeList.prototype = {
	get_length: function() {
		this.zpp_inner.valmod();
		if(this.zpp_inner.zip_length) {
			this.zpp_inner.zip_length = false;
			this.zpp_inner.user_length = this.zpp_inner.inner.length;
		}
		return this.zpp_inner.user_length;
	}
	,at: function(index) {
		this.zpp_inner.valmod();
		if(index < 0 || index >= this.get_length()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.get_length() - 1 - index;
		if(index < this.zpp_inner.at_index || this.zpp_inner.at_ite == null) {
			this.zpp_inner.at_index = index;
			this.zpp_inner.at_ite = this.zpp_inner.inner.iterator_at(index);
		} else while(this.zpp_inner.at_index != index) {
			this.zpp_inner.at_index++;
			this.zpp_inner.at_ite = this.zpp_inner.at_ite.next;
		}
		return this.zpp_inner.at_ite.elt.outer;
	}
	,push: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Shape" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var cont;
		if(this.zpp_inner.adder != null) cont = this.zpp_inner.adder(obj); else cont = true;
		if(cont) {
			if(this.zpp_inner.reverse_flag) this.zpp_inner.inner.add(obj.zpp_inner); else {
				if(this.zpp_inner.push_ite == null) if(this.zpp_inner.inner.head == null) this.zpp_inner.push_ite = null; else this.zpp_inner.push_ite = this.zpp_inner.inner.iterator_at(this.get_length() - 1);
				this.zpp_inner.push_ite = this.zpp_inner.inner.insert(this.zpp_inner.push_ite,obj.zpp_inner);
			}
			this.zpp_inner.invalidate();
			if(this.zpp_inner.post_adder != null) this.zpp_inner.post_adder(obj);
		}
		return cont;
	}
	,unshift: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Shape" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var cont;
		if(this.zpp_inner.adder != null) cont = this.zpp_inner.adder(obj); else cont = true;
		if(cont) {
			if(this.zpp_inner.reverse_flag) {
				if(this.zpp_inner.push_ite == null) if(this.zpp_inner.inner.head == null) this.zpp_inner.push_ite = null; else this.zpp_inner.push_ite = this.zpp_inner.inner.iterator_at(this.get_length() - 1);
				this.zpp_inner.push_ite = this.zpp_inner.inner.insert(this.zpp_inner.push_ite,obj.zpp_inner);
			} else this.zpp_inner.inner.add(obj.zpp_inner);
			this.zpp_inner.invalidate();
			if(this.zpp_inner.post_adder != null) this.zpp_inner.post_adder(obj);
		}
		return cont;
	}
	,add: function(obj) {
		if(this.zpp_inner.reverse_flag) return this.push(obj); else return this.unshift(obj);
	}
	,remove: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Shape" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_inner.valmod();
		var ret;
		ret = false;
		var cx_ite = this.zpp_inner.inner.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x == obj.zpp_inner) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(ret) {
			if(this.zpp_inner.subber != null) this.zpp_inner.subber(obj);
			if(!this.zpp_inner.dontremove) this.zpp_inner.inner.remove(obj.zpp_inner);
			this.zpp_inner.invalidate();
		}
		return ret;
	}
	,toString: function() {
		var ret = "[";
		var fst = true;
		var _g;
		this.zpp_inner.valmod();
		_g = nape_shape_ShapeIterator.get(this);
		while(_g.hasNext()) {
			var i;
			_g.zpp_critical = false;
			i = _g.zpp_inner.at(_g.zpp_i++);
			if(!fst) ret += ",";
			if(i == null) ret += "NULL"; else ret += i.toString();
			fst = false;
		}
		return ret + "]";
	}
	,__class__: nape_shape_ShapeList
};
var nape_shape_ShapeType = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "ShapeType" + " derp!");
};
nape_shape_ShapeType.__name__ = true;
nape_shape_ShapeType.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ShapeType_CIRCLE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ShapeType_CIRCLE = new nape_shape_ShapeType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ShapeType_CIRCLE;
			return $r;
		}(this))) return "CIRCLE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ShapeType_POLYGON == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ShapeType_POLYGON = new nape_shape_ShapeType();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ShapeType_POLYGON;
			return $r;
		}(this))) return "POLYGON"; else return "";
	}
	,__class__: nape_shape_ShapeType
};
var nape_shape_ValidationResult = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "ValidationResult" + " derp!");
};
nape_shape_ValidationResult.__name__ = true;
nape_shape_ValidationResult.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID = new nape_shape_ValidationResult();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID;
			return $r;
		}(this))) return "VALID"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE = new nape_shape_ValidationResult();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE;
			return $r;
		}(this))) return "DEGENERATE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ValidationResult_CONCAVE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ValidationResult_CONCAVE = new nape_shape_ValidationResult();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_CONCAVE;
			return $r;
		}(this))) return "CONCAVE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.ValidationResult_SELF_INTERSECTING == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.ValidationResult_SELF_INTERSECTING = new nape_shape_ValidationResult();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_SELF_INTERSECTING;
			return $r;
		}(this))) return "SELF_INTERSECTING"; else return "";
	}
	,__class__: nape_shape_ValidationResult
};
var nape_space_Broadphase = function() {
	if(!zpp_$nape_util_ZPP_$Flags.internal) throw new js__$Boot_HaxeError("Error: Cannot instantiate " + "Broadphase" + " derp!");
};
nape_space_Broadphase.__name__ = true;
nape_space_Broadphase.prototype = {
	toString: function() {
		if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.Broadphase_DYNAMIC_AABB_TREE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.Broadphase_DYNAMIC_AABB_TREE = new nape_space_Broadphase();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.Broadphase_DYNAMIC_AABB_TREE;
			return $r;
		}(this))) return "DYNAMIC_AABB_TREE"; else if(this == (function($this) {
			var $r;
			if(zpp_$nape_util_ZPP_$Flags.Broadphase_SWEEP_AND_PRUNE == null) {
				zpp_$nape_util_ZPP_$Flags.internal = true;
				zpp_$nape_util_ZPP_$Flags.Broadphase_SWEEP_AND_PRUNE = new nape_space_Broadphase();
				zpp_$nape_util_ZPP_$Flags.internal = false;
			}
			$r = zpp_$nape_util_ZPP_$Flags.Broadphase_SWEEP_AND_PRUNE;
			return $r;
		}(this))) return "SWEEP_AND_PRUNE"; else return "";
	}
	,__class__: nape_space_Broadphase
};
var nape_space_Space = function(gravity,broadphase) {
	this.zpp_inner = null;
	if(gravity != null && gravity.zpp_disp) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " has been disposed and cannot be used!");
	this.zpp_inner = new zpp_$nape_space_ZPP_$Space(gravity == null?null:gravity.zpp_inner,broadphase);
	this.zpp_inner.outer = this;
	if(gravity != null) {
		if(gravity.zpp_inner.weak) {
			gravity.dispose();
			true;
		} else false;
	}
};
nape_space_Space.__name__ = true;
nape_space_Space.prototype = {
	step: function(deltaTime,velocityIterations,positionIterations) {
		if(positionIterations == null) positionIterations = 10;
		if(velocityIterations == null) velocityIterations = 10;
		if(deltaTime != deltaTime) throw new js__$Boot_HaxeError("Error: deltaTime cannot be NaN");
		if(deltaTime <= 0) throw new js__$Boot_HaxeError("Error: deltaTime must be strictly positive");
		if(velocityIterations <= 0) throw new js__$Boot_HaxeError("Error: must use atleast one velocity iteration");
		if(positionIterations <= 0) throw new js__$Boot_HaxeError("Error: must use atleast one position iteration");
		this.zpp_inner.step(deltaTime,velocityIterations,positionIterations);
	}
	,__class__: nape_space_Space
};
var zpp_$nape_ZPP_$ID = function() { };
zpp_$nape_ZPP_$ID.__name__ = true;
zpp_$nape_ZPP_$ID.Interactor = function() {
	return zpp_$nape_ZPP_$ID._Interactor++;
};
zpp_$nape_ZPP_$ID.CbType = function() {
	return zpp_$nape_ZPP_$ID._CbType++;
};
zpp_$nape_ZPP_$ID.CbSet = function() {
	return zpp_$nape_ZPP_$ID._CbSet++;
};
var zpp_$nape_callbacks_ZPP_$Callback = function() {
	this.constraint = null;
	this.body = null;
	this.pre_swapped = false;
	this.pre_arbiter = null;
	this.wrap_arbiters = null;
	this.set = null;
	this.int2 = null;
	this.int1 = null;
	this.length = 0;
	this.prev = null;
	this.next = null;
	this.listener = null;
	this.event = 0;
	this.outer_int = null;
	this.outer_con = null;
	this.outer_body = null;
	this.length = 0;
};
zpp_$nape_callbacks_ZPP_$Callback.__name__ = true;
zpp_$nape_callbacks_ZPP_$Callback.prototype = {
	wrapper_body: function() {
		if(this.outer_body == null) {
			zpp_$nape_callbacks_ZPP_$Callback.internal = true;
			this.outer_body = new nape_callbacks_BodyCallback();
			zpp_$nape_callbacks_ZPP_$Callback.internal = false;
			this.outer_body.zpp_inner = this;
		}
		return this.outer_body;
	}
	,wrapper_con: function() {
		if(this.outer_con == null) {
			zpp_$nape_callbacks_ZPP_$Callback.internal = true;
			this.outer_con = new nape_callbacks_ConstraintCallback();
			zpp_$nape_callbacks_ZPP_$Callback.internal = false;
			this.outer_con.zpp_inner = this;
		}
		return this.outer_con;
	}
	,wrapper_int: function() {
		if(this.outer_int == null) {
			zpp_$nape_callbacks_ZPP_$Callback.internal = true;
			this.outer_int = new nape_callbacks_InteractionCallback();
			zpp_$nape_callbacks_ZPP_$Callback.internal = false;
			this.outer_int.zpp_inner = this;
		}
		if(this.wrap_arbiters == null) this.wrap_arbiters = zpp_$nape_util_ZPP_$ArbiterList.get(this.set.arbiters,true); else this.wrap_arbiters.zpp_inner.inner = this.set.arbiters;
		this.wrap_arbiters.zpp_inner.zip_length = true;
		this.wrap_arbiters.zpp_inner.at_ite = null;
		return this.outer_int;
	}
	,push: function(obj) {
		if(this.prev != null) this.prev.next = obj; else this.next = obj;
		obj.prev = this.prev;
		obj.next = null;
		this.prev = obj;
		this.length++;
	}
	,pop: function() {
		var ret = this.next;
		this.next = ret.next;
		if(this.next == null) this.prev = null; else this.next.prev = null;
		this.length--;
		return ret;
	}
	,empty: function() {
		return this.next == null;
	}
	,__class__: zpp_$nape_callbacks_ZPP_$Callback
};
var zpp_$nape_callbacks_ZPP_$CbSet = function() {
	this.constraints = null;
	this.interactors = null;
	this.zip_conlisteners = false;
	this.conlisteners = null;
	this.zip_bodylisteners = false;
	this.bodylisteners = null;
	this.zip_listeners = false;
	this.listeners = null;
	this.cbpairs = null;
	this.manager = null;
	this.id = 0;
	this.next = null;
	this.count = 0;
	this.cbTypes = null;
	this.cbTypes = new zpp_$nape_util_ZNPList_$ZPP_$CbType();
	this.listeners = new zpp_$nape_util_ZNPList_$ZPP_$InteractionListener();
	this.zip_listeners = true;
	this.bodylisteners = new zpp_$nape_util_ZNPList_$ZPP_$BodyListener();
	this.zip_bodylisteners = true;
	this.conlisteners = new zpp_$nape_util_ZNPList_$ZPP_$ConstraintListener();
	this.zip_conlisteners = true;
	this.constraints = new zpp_$nape_util_ZNPList_$ZPP_$Constraint();
	this.interactors = new zpp_$nape_util_ZNPList_$ZPP_$Interactor();
	this.id = zpp_$nape_ZPP_$ID.CbSet();
	this.cbpairs = new zpp_$nape_util_ZNPList_$ZPP_$CbSetPair();
};
zpp_$nape_callbacks_ZPP_$CbSet.__name__ = true;
zpp_$nape_callbacks_ZPP_$CbSet.setlt = function(a,b) {
	var i = a.cbTypes.head;
	var j = b.cbTypes.head;
	while(i != null && j != null) {
		var ca = i.elt;
		var cb = j.elt;
		if(ca.id < cb.id) return true;
		if(cb.id < ca.id) return false; else {
			i = i.next;
			j = j.next;
		}
	}
	return j != null && i == null;
};
zpp_$nape_callbacks_ZPP_$CbSet.get = function(cbTypes) {
	var ret;
	if(zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool == null) ret = new zpp_$nape_callbacks_ZPP_$CbSet(); else {
		ret = zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool;
		zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool = ret.next;
		ret.next = null;
	}
	null;
	var ite = null;
	var cx_ite = cbTypes.head;
	while(cx_ite != null) {
		var cb = cx_ite.elt;
		ite = ret.cbTypes.insert(ite,cb);
		cb.cbsets.add(ret);
		cx_ite = cx_ite.next;
	}
	return ret;
};
zpp_$nape_callbacks_ZPP_$CbSet.single_intersection = function(a,b,i) {
	return a.manager.pair(a,b).single_intersection(i);
};
zpp_$nape_callbacks_ZPP_$CbSet.find_all = function(a,b,event,cb) {
	a.manager.pair(a,b).forall(event,cb);
};
zpp_$nape_callbacks_ZPP_$CbSet.prototype = {
	invalidate_pairs: function() {
		var cx_ite = this.cbpairs.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.zip_listeners = true;
			cx_ite = cx_ite.next;
		}
	}
	,realvalidate_listeners: function() {
		this.listeners.clear();
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			var npre = null;
			var nite = this.listeners.head;
			var cite = cb.listeners.head;
			while(cite != null) {
				var cx = cite.elt;
				if(nite != null && nite.elt == cx) {
					cite = cite.next;
					npre = nite;
					nite = nite.next;
				} else if(nite == null || zpp_$nape_callbacks_ZPP_$Listener.setlt(cx,nite.elt)) {
					if(cx.space == this.manager.space) npre = this.listeners.inlined_insert(npre,cx);
					cite = cite.next;
				} else {
					npre = nite;
					nite = nite.next;
				}
			}
			cx_ite = cx_ite.next;
		}
	}
	,realvalidate_bodylisteners: function() {
		this.bodylisteners.clear();
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			var npre = null;
			var nite = this.bodylisteners.head;
			var cite = cb.bodylisteners.head;
			while(cite != null) {
				var cx = cite.elt;
				if(nite != null && nite.elt == cx) {
					cite = cite.next;
					npre = nite;
					nite = nite.next;
				} else if(nite == null || zpp_$nape_callbacks_ZPP_$Listener.setlt(cx,nite.elt)) {
					if(!cx.options.excluded(this.cbTypes) && cx.space == this.manager.space) npre = this.bodylisteners.inlined_insert(npre,cx);
					cite = cite.next;
				} else {
					npre = nite;
					nite = nite.next;
				}
			}
			cx_ite = cx_ite.next;
		}
	}
	,realvalidate_conlisteners: function() {
		this.conlisteners.clear();
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			var npre = null;
			var nite = this.conlisteners.head;
			var cite = cb.conlisteners.head;
			while(cite != null) {
				var cx = cite.elt;
				if(nite != null && nite.elt == cx) {
					cite = cite.next;
					npre = nite;
					nite = nite.next;
				} else if(nite == null || zpp_$nape_callbacks_ZPP_$Listener.setlt(cx,nite.elt)) {
					if(!cx.options.excluded(this.cbTypes) && cx.space == this.manager.space) npre = this.conlisteners.inlined_insert(npre,cx);
					cite = cite.next;
				} else {
					npre = nite;
					nite = nite.next;
				}
			}
			cx_ite = cx_ite.next;
		}
	}
	,validate: function() {
		if(this.zip_listeners) {
			this.zip_listeners = false;
			this.realvalidate_listeners();
		}
		if(this.zip_bodylisteners) {
			this.zip_bodylisteners = false;
			this.realvalidate_bodylisteners();
		}
		if(this.zip_conlisteners) {
			this.zip_conlisteners = false;
			this.realvalidate_conlisteners();
		}
	}
	,free: function() {
		this.listeners.clear();
		this.zip_listeners = true;
		this.bodylisteners.clear();
		this.zip_bodylisteners = true;
		this.conlisteners.clear();
		this.zip_conlisteners = true;
		while(!(this.cbTypes.head == null)) {
			var cb = this.cbTypes.pop_unsafe();
			cb.cbsets.remove(this);
		}
	}
	,__class__: zpp_$nape_callbacks_ZPP_$CbSet
};
var zpp_$nape_callbacks_ZPP_$CbSetPair = function() {
	this.listeners = null;
	this.zip_listeners = false;
	this.next = null;
	this.b = null;
	this.a = null;
	this.listeners = new zpp_$nape_util_ZNPList_$ZPP_$InteractionListener();
};
zpp_$nape_callbacks_ZPP_$CbSetPair.__name__ = true;
zpp_$nape_callbacks_ZPP_$CbSetPair.get = function(a,b) {
	var ret;
	if(zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool == null) ret = new zpp_$nape_callbacks_ZPP_$CbSetPair(); else {
		ret = zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool;
		zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool = ret.next;
		ret.next = null;
	}
	ret.zip_listeners = true;
	if(zpp_$nape_callbacks_ZPP_$CbSet.setlt(a,b)) {
		ret.a = a;
		ret.b = b;
	} else {
		ret.a = b;
		ret.b = a;
	}
	return ret;
};
zpp_$nape_callbacks_ZPP_$CbSetPair.setlt = function(x,y) {
	return zpp_$nape_callbacks_ZPP_$CbSet.setlt(x.a,y.a) || x.a == y.a && zpp_$nape_callbacks_ZPP_$CbSet.setlt(x.b,y.b);
};
zpp_$nape_callbacks_ZPP_$CbSetPair.prototype = {
	__validate: function() {
		this.listeners.clear();
		var aite = this.a.listeners.head;
		var bite = this.b.listeners.head;
		while(aite != null && bite != null) {
			var ax = aite.elt;
			var bx = bite.elt;
			if(ax == bx) {
				if(ax.options1.compatible(this.a.cbTypes) && ax.options2.compatible(this.b.cbTypes) || ax.options2.compatible(this.a.cbTypes) && ax.options1.compatible(this.b.cbTypes)) this.listeners.add(ax);
				aite = aite.next;
				bite = bite.next;
			} else if(ax.precedence > bx.precedence || ax.precedence == bx.precedence && ax.id > bx.id) aite = aite.next; else bite = bite.next;
		}
	}
	,empty_intersection: function() {
		return this.listeners.head == null;
	}
	,single_intersection: function(i) {
		var ite = this.listeners.head;
		return ite != null && ite.elt == i && ite.next == null;
	}
	,forall: function(event,cb) {
		var cx_ite = this.listeners.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x.event == event) cb(x);
			cx_ite = cx_ite.next;
		}
	}
	,__class__: zpp_$nape_callbacks_ZPP_$CbSetPair
};
var zpp_$nape_util_ZNPList_$ZPP_$InteractionListener = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$InteractionListener.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$InteractionListener.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,inlined_clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$InteractionListener
};
var zpp_$nape_util_ZNPList_$ZPP_$BodyListener = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$BodyListener.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$BodyListener.prototype = {
	inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$BodyListener(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$BodyListener
};
var zpp_$nape_util_ZNPList_$ZPP_$ConstraintListener = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$ConstraintListener.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$ConstraintListener.prototype = {
	inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$ConstraintListener
};
var zpp_$nape_util_ZNPList_$ZPP_$Constraint = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Constraint.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Constraint.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Constraint(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,erase: function(pre) {
		return this.inlined_erase(pre);
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Constraint.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Constraint
};
var zpp_$nape_util_ZNPList_$ZPP_$Interactor = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Interactor.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Interactor.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Interactor(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Interactor.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,inlined_clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Interactor
};
var zpp_$nape_util_ZNPList_$ZPP_$CbSet = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$CbSet.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$CbSet.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$CbSet(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CbSet.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$CbSet
};
var zpp_$nape_callbacks_ZPP_$CbType = function() {
	this.conlisteners = null;
	this.bodylisteners = null;
	this.listeners = null;
	this.cbsets = null;
	this.id = 0;
	this.outer = null;
	this.id = zpp_$nape_ZPP_$ID.CbType();
	this.listeners = new zpp_$nape_util_ZNPList_$ZPP_$InteractionListener();
	this.bodylisteners = new zpp_$nape_util_ZNPList_$ZPP_$BodyListener();
	this.conlisteners = new zpp_$nape_util_ZNPList_$ZPP_$ConstraintListener();
	this.constraints = new zpp_$nape_util_ZNPList_$ZPP_$Constraint();
	this.interactors = new zpp_$nape_util_ZNPList_$ZPP_$Interactor();
	this.cbsets = new zpp_$nape_util_ZNPList_$ZPP_$CbSet();
};
zpp_$nape_callbacks_ZPP_$CbType.__name__ = true;
zpp_$nape_callbacks_ZPP_$CbType.prototype = {
	addint: function(x) {
		var pre = null;
		var cx_ite = this.listeners.head;
		while(cx_ite != null) {
			var j = cx_ite.elt;
			if(x.precedence > j.precedence || x.precedence == j.precedence && x.id > j.id) break;
			pre = cx_ite;
			cx_ite = cx_ite.next;
		}
		this.listeners.inlined_insert(pre,x);
		this.invalidateint();
	}
	,invalidateint: function() {
		var cx_ite = this.cbsets.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.zip_listeners = true;
			cb.invalidate_pairs();
			cx_ite = cx_ite.next;
		}
	}
	,addbody: function(x) {
		var pre = null;
		var cx_ite = this.bodylisteners.head;
		while(cx_ite != null) {
			var j = cx_ite.elt;
			if(x.precedence > j.precedence || x.precedence == j.precedence && x.id > j.id) break;
			pre = cx_ite;
			cx_ite = cx_ite.next;
		}
		this.bodylisteners.inlined_insert(pre,x);
		this.invalidatebody();
	}
	,invalidatebody: function() {
		var cx_ite = this.cbsets.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.zip_bodylisteners = true;
			cx_ite = cx_ite.next;
		}
	}
	,addconstraint: function(x) {
		var pre = null;
		var cx_ite = this.conlisteners.head;
		while(cx_ite != null) {
			var j = cx_ite.elt;
			if(x.precedence > j.precedence || x.precedence == j.precedence && x.id > j.id) break;
			pre = cx_ite;
			cx_ite = cx_ite.next;
		}
		this.conlisteners.inlined_insert(pre,x);
		this.invalidateconstraint();
	}
	,invalidateconstraint: function() {
		var cx_ite = this.cbsets.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.zip_conlisteners = true;
			cx_ite = cx_ite.next;
		}
	}
	,__class__: zpp_$nape_callbacks_ZPP_$CbType
};
var zpp_$nape_util_ZPP_$Flags = function() { };
zpp_$nape_util_ZPP_$Flags.__name__ = true;
var zpp_$nape_callbacks_ZPP_$Listener = function() {
	this.space = null;
	this.interaction = null;
	this.constraint = null;
	this.body = null;
	this.precedence = 0;
	this.event = 0;
	this.type = 0;
	this.id = 0;
	this.outer = null;
};
zpp_$nape_callbacks_ZPP_$Listener.__name__ = true;
zpp_$nape_callbacks_ZPP_$Listener.setlt = function(a,b) {
	return a.precedence > b.precedence || a.precedence == b.precedence && a.id > b.id;
};
zpp_$nape_callbacks_ZPP_$Listener.prototype = {
	addedToSpace: function() {
	}
	,removedFromSpace: function() {
	}
	,__class__: zpp_$nape_callbacks_ZPP_$Listener
};
var zpp_$nape_callbacks_ZPP_$BodyListener = function() {
	this.handler = null;
	this.options = null;
	this.outer_zn = null;
};
zpp_$nape_callbacks_ZPP_$BodyListener.__name__ = true;
zpp_$nape_callbacks_ZPP_$BodyListener.__super__ = zpp_$nape_callbacks_ZPP_$Listener;
zpp_$nape_callbacks_ZPP_$BodyListener.prototype = $extend(zpp_$nape_callbacks_ZPP_$Listener.prototype,{
	addedToSpace: function() {
		this.options.handler = $bind(this,this.cbtype_change);
		var cx_ite = this.options.includes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.addbody(this);
			cx_ite = cx_ite.next;
		}
	}
	,removedFromSpace: function() {
		var cx_ite = this.options.includes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.bodylisteners.remove(this);
			cb.invalidatebody();
			cx_ite = cx_ite.next;
		}
		this.options.handler = null;
	}
	,cbtype_change: function(cb,included,added) {
		this.removedFromSpace();
		this.options.effect_change(cb,included,added);
		this.addedToSpace();
	}
	,__class__: zpp_$nape_callbacks_ZPP_$BodyListener
});
var zpp_$nape_callbacks_ZPP_$ConstraintListener = function() {
	this.handler = null;
	this.options = null;
	this.outer_zn = null;
};
zpp_$nape_callbacks_ZPP_$ConstraintListener.__name__ = true;
zpp_$nape_callbacks_ZPP_$ConstraintListener.__super__ = zpp_$nape_callbacks_ZPP_$Listener;
zpp_$nape_callbacks_ZPP_$ConstraintListener.prototype = $extend(zpp_$nape_callbacks_ZPP_$Listener.prototype,{
	addedToSpace: function() {
		this.options.handler = $bind(this,this.cbtype_change);
		var cx_ite = this.options.includes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.addconstraint(this);
			cx_ite = cx_ite.next;
		}
	}
	,removedFromSpace: function() {
		var cx_ite = this.options.includes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.conlisteners.remove(this);
			cb.invalidateconstraint();
			cx_ite = cx_ite.next;
		}
		this.options.handler = null;
	}
	,cbtype_change: function(cb,included,added) {
		this.removedFromSpace();
		this.options.effect_change(cb,included,added);
		this.addedToSpace();
	}
	,__class__: zpp_$nape_callbacks_ZPP_$ConstraintListener
});
var zpp_$nape_util_ZNPList_$ZPP_$CbType = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$CbType.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$CbType.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$CbType(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,insert: function(cur,o) {
		return this.inlined_insert(cur,o);
	}
	,inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$CbType(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CbType.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,has: function(obj) {
		return this.inlined_has(obj);
	}
	,inlined_has: function(obj) {
		var ret;
		ret = false;
		var cx_ite = this.head;
		while(cx_ite != null) {
			var npite = cx_ite.elt;
			if(npite == obj) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		return ret;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$CbType
};
var zpp_$nape_callbacks_ZPP_$InteractionListener = function() {
	this.handlerp = null;
	this.pure = false;
	this.allowSleepingCallbacks = false;
	this.handleri = null;
	this.options2 = null;
	this.options1 = null;
	this.itype = 0;
	this.outer_znp = null;
	this.outer_zni = null;
};
zpp_$nape_callbacks_ZPP_$InteractionListener.__name__ = true;
zpp_$nape_callbacks_ZPP_$InteractionListener.__super__ = zpp_$nape_callbacks_ZPP_$Listener;
zpp_$nape_callbacks_ZPP_$InteractionListener.prototype = $extend(zpp_$nape_callbacks_ZPP_$Listener.prototype,{
	CbSetset: function(A,B,lambda) {
		var U = zpp_$nape_callbacks_ZPP_$InteractionListener.UCbSet;
		var V = zpp_$nape_callbacks_ZPP_$InteractionListener.VCbSet;
		var W = zpp_$nape_callbacks_ZPP_$InteractionListener.WCbSet;
		var aite = A.head;
		var bite = B.head;
		while(aite != null && bite != null) {
			var a = aite.elt;
			var b = bite.elt;
			if(a == b) {
				W.inlined_add(a);
				aite = aite.next;
				bite = bite.next;
			} else if(zpp_$nape_callbacks_ZPP_$CbSet.setlt(a,b)) {
				U.inlined_add(a);
				aite = aite.next;
			} else {
				V.inlined_add(b);
				bite = bite.next;
			}
		}
		while(aite != null) {
			U.inlined_add(aite.elt);
			aite = aite.next;
		}
		while(bite != null) {
			V.inlined_add(bite.elt);
			bite = bite.next;
		}
		while(!(U.head == null)) {
			var x = U.pop_unsafe();
			var cx_ite = B.head;
			while(cx_ite != null) {
				var y = cx_ite.elt;
				lambda(x,y);
				cx_ite = cx_ite.next;
			}
		}
		while(!(V.head == null)) {
			var x1 = V.pop_unsafe();
			var cx_ite1 = W.head;
			while(cx_ite1 != null) {
				var y1 = cx_ite1.elt;
				lambda(x1,y1);
				cx_ite1 = cx_ite1.next;
			}
		}
		while(!(W.head == null)) {
			var x2 = W.pop_unsafe();
			lambda(x2,x2);
			var cx_ite2 = W.head;
			while(cx_ite2 != null) {
				var y2 = cx_ite2.elt;
				lambda(x2,y2);
				cx_ite2 = cx_ite2.next;
			}
		}
	}
	,CbTypeset: function(A,B,lambda) {
		var U = zpp_$nape_callbacks_ZPP_$InteractionListener.UCbType;
		var V = zpp_$nape_callbacks_ZPP_$InteractionListener.VCbType;
		var W = zpp_$nape_callbacks_ZPP_$InteractionListener.WCbType;
		var aite = A.head;
		var bite = B.head;
		while(aite != null && bite != null) {
			var a = aite.elt;
			var b = bite.elt;
			if(a == b) {
				W.inlined_add(a);
				aite = aite.next;
				bite = bite.next;
			} else if(a.id < b.id) {
				U.inlined_add(a);
				aite = aite.next;
			} else {
				V.inlined_add(b);
				bite = bite.next;
			}
		}
		while(aite != null) {
			U.inlined_add(aite.elt);
			aite = aite.next;
		}
		while(bite != null) {
			V.inlined_add(bite.elt);
			bite = bite.next;
		}
		while(!(U.head == null)) {
			var x = U.pop_unsafe();
			var cx_ite = B.head;
			while(cx_ite != null) {
				var y = cx_ite.elt;
				lambda(x,y);
				cx_ite = cx_ite.next;
			}
		}
		while(!(V.head == null)) {
			var x1 = V.pop_unsafe();
			var cx_ite1 = W.head;
			while(cx_ite1 != null) {
				var y1 = cx_ite1.elt;
				lambda(x1,y1);
				cx_ite1 = cx_ite1.next;
			}
		}
		while(!(W.head == null)) {
			var x2 = W.pop_unsafe();
			lambda(x2,x2);
			var cx_ite2 = W.head;
			while(cx_ite2 != null) {
				var y2 = cx_ite2.elt;
				lambda(x2,y2);
				cx_ite2 = cx_ite2.next;
			}
		}
	}
	,with_uniquesets: function(fresh) {
		var _g = this;
		var set;
		if(zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool == null) set = new zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair(); else {
			set = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool;
			zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool = set.next;
			set.next = null;
		}
		null;
		set.lt = zpp_$nape_callbacks_ZPP_$CbSetPair.setlt;
		this.CbTypeset(this.options1.includes,this.options2.includes,function(a,b) {
			_g.CbSetset(a.cbsets,b.cbsets,function(a1,b1) {
				a1.validate();
				b1.validate();
				if(zpp_$nape_callbacks_ZPP_$CbSet.single_intersection(a1,b1,_g)) set.try_insert(zpp_$nape_callbacks_ZPP_$CbSetPair.get(a1,b1));
			});
		});
		set.clear_with(function(pair) {
			if(fresh) _g.space.freshListenerType(pair.a,pair.b); else _g.space.nullListenerType(pair.a,pair.b);
			var o = pair;
			o.a = o.b = null;
			o.listeners.clear();
			o.next = zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool;
			zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool = o;
		});
		var o1 = set;
		o1.data = null;
		o1.lt = null;
		o1.swapped = null;
		o1.next = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool;
		zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool = o1;
	}
	,with_union: function(lambda) {
		var ite1 = this.options1.includes.head;
		var ite2 = this.options2.includes.head;
		while(ite1 != null && ite2 != null) {
			var cb1 = ite1.elt;
			var cb2 = ite2.elt;
			if(cb1 == cb2) {
				lambda(cb1);
				ite1 = ite1.next;
				ite2 = ite2.next;
			} else if(cb1.id < cb2.id) {
				lambda(cb1);
				ite1 = ite1.next;
			} else {
				lambda(cb2);
				ite2 = ite2.next;
			}
		}
		while(ite1 != null) {
			lambda(ite1.elt);
			ite1 = ite1.next;
		}
		while(ite2 != null) {
			lambda(ite2.elt);
			ite2 = ite2.next;
		}
	}
	,addedToSpace: function() {
		var _g = this;
		var pre = this.type == 3;
		this.with_union(function(cb) {
			cb.addint(_g);
			if(pre) {
				var cx_ite = cb.interactors.head;
				while(cx_ite != null) {
					var i = cx_ite.elt;
					i.wake();
					cx_ite = cx_ite.next;
				}
			}
		});
		this.options1.handler = $bind(this,this.cbtype_change1);
		this.options2.handler = $bind(this,this.cbtype_change2);
		this.with_uniquesets(true);
	}
	,removedFromSpace: function() {
		var _g = this;
		this.with_uniquesets(false);
		var pre = this.type == 3;
		this.with_union(function(cb) {
			cb.listeners.remove(_g);
			cb.invalidateint();
			if(pre) {
				var cx_ite = cb.interactors.head;
				while(cx_ite != null) {
					var i = cx_ite.elt;
					i.wake();
					cx_ite = cx_ite.next;
				}
			}
		});
		this.options1.handler = null;
		this.options2.handler = null;
	}
	,cbtype_change1: function(cb,included,added) {
		this.cbtype_change(this.options1,cb,included,added);
	}
	,cbtype_change2: function(cb,included,added) {
		this.cbtype_change(this.options2,cb,included,added);
	}
	,cbtype_change: function(options,cb,included,added) {
		this.removedFromSpace();
		options.effect_change(cb,included,added);
		this.addedToSpace();
		null;
	}
	,__class__: zpp_$nape_callbacks_ZPP_$InteractionListener
});
var zpp_$nape_callbacks_ZPP_$OptionType = function() {
	this.wrap_excludes = null;
	this.wrap_includes = null;
	this.excludes = null;
	this.includes = null;
	this.handler = null;
	this.outer = null;
};
zpp_$nape_callbacks_ZPP_$OptionType.__name__ = true;
zpp_$nape_callbacks_ZPP_$OptionType.prototype = {
	setup_includes: function() {
		this.wrap_includes = zpp_$nape_util_ZPP_$CbTypeList.get(this.includes,true);
	}
	,setup_excludes: function() {
		this.wrap_excludes = zpp_$nape_util_ZPP_$CbTypeList.get(this.excludes,true);
	}
	,excluded: function(xs) {
		return this.nonemptyintersection(xs,this.excludes);
	}
	,compatible: function(xs) {
		return this.nonemptyintersection(xs,this.includes) && !this.nonemptyintersection(xs,this.excludes);
	}
	,nonemptyintersection: function(xs,ys) {
		var ret = false;
		var xite = xs.head;
		var eite = ys.head;
		while(eite != null && xite != null) {
			var ex = eite.elt;
			var xi = xite.elt;
			if(ex == xi) {
				ret = true;
				break;
			} else if(ex.id < xi.id) eite = eite.next; else xite = xite.next;
		}
		return ret;
	}
	,effect_change: function(val,included,added) {
		if(included) {
			if(added) {
				var pre = null;
				var cx_ite = this.includes.head;
				while(cx_ite != null) {
					var j = cx_ite.elt;
					if(val.id < j.id) break;
					pre = cx_ite;
					cx_ite = cx_ite.next;
				}
				this.includes.inlined_insert(pre,val);
			} else this.includes.remove(val);
		} else if(added) {
			var pre1 = null;
			var cx_ite1 = this.excludes.head;
			while(cx_ite1 != null) {
				var j1 = cx_ite1.elt;
				if(val.id < j1.id) break;
				pre1 = cx_ite1;
				cx_ite1 = cx_ite1.next;
			}
			this.excludes.inlined_insert(pre1,val);
		} else this.excludes.remove(val);
	}
	,__class__: zpp_$nape_callbacks_ZPP_$OptionType
};
var zpp_$nape_constraint_ZPP_$Constraint = function() {
	this.cbSet = null;
	this.cbTypes = null;
	this.__velocity = false;
	this.ignore = false;
	this.component = null;
	this.removeOnBreak = false;
	this.stiff = false;
	this.active = false;
	this.space = null;
	this.compound = null;
	this.outer = null;
};
zpp_$nape_constraint_ZPP_$Constraint.__name__ = true;
zpp_$nape_constraint_ZPP_$Constraint.prototype = {
	alloc_cbSet: function() {
		if((this.cbSet = this.space.cbsets.get(this.cbTypes)) != null) {
			this.cbSet.count++;
			this.cbSet.constraints.add(this);
		}
	}
	,dealloc_cbSet: function() {
		if(this.cbSet != null) {
			this.cbSet.constraints.remove(this);
			if(--this.cbSet.count == 0) {
				this.space.cbsets.remove(this.cbSet);
				var o = this.cbSet;
				o.free();
				o.next = zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool;
				zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool = o;
			}
			this.cbSet = null;
		}
	}
	,addedToSpace: function() {
		if(this.active) this.activeInSpace();
		this.activeBodies();
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.constraints.add(this);
			cx_ite = cx_ite.next;
		}
	}
	,removedFromSpace: function() {
		if(this.active) this.inactiveOrOutSpace();
		this.inactiveBodies();
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.constraints.remove(this);
			cx_ite = cx_ite.next;
		}
	}
	,activeInSpace: function() {
		this.alloc_cbSet();
		if(zpp_$nape_space_ZPP_$Component.zpp_pool == null) this.component = new zpp_$nape_space_ZPP_$Component(); else {
			this.component = zpp_$nape_space_ZPP_$Component.zpp_pool;
			zpp_$nape_space_ZPP_$Component.zpp_pool = this.component.next;
			this.component.next = null;
		}
		null;
		this.component.isBody = false;
		this.component.constraint = this;
	}
	,inactiveOrOutSpace: function() {
		this.dealloc_cbSet();
		var o = this.component;
		o.body = null;
		o.constraint = null;
		null;
		o.next = zpp_$nape_space_ZPP_$Component.zpp_pool;
		zpp_$nape_space_ZPP_$Component.zpp_pool = o;
		this.component = null;
	}
	,activeBodies: function() {
	}
	,inactiveBodies: function() {
	}
	,clearcache: function() {
	}
	,validate: function() {
	}
	,wake_connected: function() {
	}
	,forest: function() {
	}
	,pair_exists: function(id,di) {
		return false;
	}
	,broken: function() {
	}
	,warmStart: function() {
	}
	,preStep: function(dt) {
		return false;
	}
	,applyImpulseVel: function() {
		return false;
	}
	,applyImpulsePos: function() {
		return false;
	}
	,__class__: zpp_$nape_constraint_ZPP_$Constraint
};
var zpp_$nape_dynamics_ZPP_$Arbiter = function() {
	this.sensorarb = null;
	this.fluidarb = null;
	this.colarb = null;
	this.type = 0;
	this.pair = null;
	this.ws2 = null;
	this.ws1 = null;
	this.b2 = null;
	this.b1 = null;
	this.invalidated = false;
	this.immState = 0;
	this.fresh = false;
	this.continuous = false;
	this.presentable = false;
	this.intchange = false;
	this.present = 0;
	this.sleeping = false;
	this.cleared = false;
	this.active = false;
	this.endGenerated = 0;
	this.sleep_stamp = 0;
	this.up_stamp = 0;
	this.stamp = 0;
	this.di = 0;
	this.id = 0;
	this.outer = null;
};
zpp_$nape_dynamics_ZPP_$Arbiter.__name__ = true;
zpp_$nape_dynamics_ZPP_$Arbiter.prototype = {
	wrapper: function() {
		if(this.outer == null) {
			zpp_$nape_dynamics_ZPP_$Arbiter.internal = true;
			if(this.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL) {
				this.colarb.outer_zn = new nape_dynamics_CollisionArbiter();
				this.outer = this.colarb.outer_zn;
			} else if(this.type == zpp_$nape_dynamics_ZPP_$Arbiter.FLUID) {
				this.fluidarb.outer_zn = new nape_dynamics_FluidArbiter();
				this.outer = this.fluidarb.outer_zn;
			} else this.outer = new nape_dynamics_Arbiter();
			this.outer.zpp_inner = this;
			zpp_$nape_dynamics_ZPP_$Arbiter.internal = false;
		}
		return this.outer;
	}
	,__class__: zpp_$nape_dynamics_ZPP_$Arbiter
};
var zpp_$nape_dynamics_ZPP_$SensorArbiter = function() {
	this.next = null;
	zpp_$nape_dynamics_ZPP_$Arbiter.call(this);
	this.type = zpp_$nape_dynamics_ZPP_$Arbiter.SENSOR;
	this.sensorarb = this;
};
zpp_$nape_dynamics_ZPP_$SensorArbiter.__name__ = true;
zpp_$nape_dynamics_ZPP_$SensorArbiter.__super__ = zpp_$nape_dynamics_ZPP_$Arbiter;
zpp_$nape_dynamics_ZPP_$SensorArbiter.prototype = $extend(zpp_$nape_dynamics_ZPP_$Arbiter.prototype,{
	retire: function() {
		if(!this.cleared) {
			this.b1.arbiters.inlined_try_remove(this);
			this.b2.arbiters.inlined_try_remove(this);
			if(this.pair != null) {
				this.pair.arb = null;
				this.pair = null;
			}
		}
		this.b1 = this.b2 = null;
		this.active = false;
		this.intchange = false;
		var o = this;
		o.next = zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool;
		zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool = o;
	}
	,__class__: zpp_$nape_dynamics_ZPP_$SensorArbiter
});
var zpp_$nape_dynamics_ZPP_$FluidArbiter = function() {
	this.pre_dt = 0.0;
	this.mutable = false;
	this.wrap_position = null;
	this.buoyy = 0.0;
	this.buoyx = 0.0;
	this.ny = 0.0;
	this.nx = 0.0;
	this.lgamma = 0.0;
	this.dampy = 0.0;
	this.dampx = 0.0;
	this.vMassc = 0.0;
	this.vMassb = 0.0;
	this.vMassa = 0.0;
	this.agamma = 0.0;
	this.adamp = 0.0;
	this.wMass = 0.0;
	this.nodrag = false;
	this.r2y = 0.0;
	this.r2x = 0.0;
	this.r1y = 0.0;
	this.r1x = 0.0;
	this.overlap = 0.0;
	this.centroidy = 0.0;
	this.centroidx = 0.0;
	this.next = null;
	this.outer_zn = null;
	zpp_$nape_dynamics_ZPP_$Arbiter.call(this);
	this.type = zpp_$nape_dynamics_ZPP_$Arbiter.FLUID;
	this.fluidarb = this;
	this.buoyx = 0;
	this.buoyy = 0;
	this.pre_dt = -1.0;
};
zpp_$nape_dynamics_ZPP_$FluidArbiter.__name__ = true;
zpp_$nape_dynamics_ZPP_$FluidArbiter.__super__ = zpp_$nape_dynamics_ZPP_$Arbiter;
zpp_$nape_dynamics_ZPP_$FluidArbiter.prototype = $extend(zpp_$nape_dynamics_ZPP_$Arbiter.prototype,{
	retire: function() {
		if(!this.cleared) {
			this.b1.arbiters.inlined_try_remove(this);
			this.b2.arbiters.inlined_try_remove(this);
			if(this.pair != null) {
				this.pair.arb = null;
				this.pair = null;
			}
		}
		this.b1 = this.b2 = null;
		this.active = false;
		this.intchange = false;
		var o = this;
		o.next = zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool;
		zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool = o;
		this.pre_dt = -1.0;
	}
	,preStep: function(s,dt) {
		if(this.pre_dt == -1.0) this.pre_dt = dt;
		var dtratio = dt / this.pre_dt;
		this.pre_dt = dt;
		this.r1x = this.centroidx - this.b1.posx;
		this.r1y = this.centroidy - this.b1.posy;
		this.r2x = this.centroidx - this.b2.posx;
		this.r2y = this.centroidy - this.b2.posy;
		var g1x = 0.0;
		var g1y = 0.0;
		if(this.ws1.fluidEnabled && this.ws1.fluidProperties.wrap_gravity != null) {
			g1x = this.ws1.fluidProperties.gravityx;
			g1y = this.ws1.fluidProperties.gravityy;
		} else {
			g1x = s.gravityx;
			g1y = s.gravityy;
		}
		var g2x = 0.0;
		var g2y = 0.0;
		if(this.ws2.fluidEnabled && this.ws2.fluidProperties.wrap_gravity != null) {
			g2x = this.ws2.fluidProperties.gravityx;
			g2y = this.ws2.fluidProperties.gravityy;
		} else {
			g2x = s.gravityx;
			g2y = s.gravityy;
		}
		var buoyx = 0;
		var buoyy = 0;
		if(this.ws1.fluidEnabled && this.ws2.fluidEnabled) {
			var mass1 = this.overlap * this.ws1.fluidProperties.density;
			var mass2 = this.overlap * this.ws2.fluidProperties.density;
			if(mass1 > mass2) {
				var t = mass1 + mass2;
				buoyx -= g1x * t;
				buoyy -= g1y * t;
			} else if(mass1 < mass2) {
				var t1 = mass1 + mass2;
				buoyx += g2x * t1;
				buoyy += g2y * t1;
			} else {
				var gx = 0.0;
				var gy = 0.0;
				gx = g1x + g2x;
				gy = g1y + g2y;
				var t2 = 0.5;
				gx *= t2;
				gy *= t2;
				if(this.ws1.worldCOMx * gx + this.ws1.worldCOMy * gy > this.ws2.worldCOMx * gx + this.ws2.worldCOMy * gy) {
					var t3 = mass1 + mass2;
					buoyx -= gx * t3;
					buoyy -= gy * t3;
				} else {
					var t4 = mass1 + mass2;
					buoyx += gx * t4;
					buoyy += gy * t4;
				}
			}
		} else if(this.ws1.fluidEnabled) {
			var mass = this.overlap * this.ws1.fluidProperties.density;
			var t5 = mass;
			buoyx -= g1x * t5;
			buoyy -= g1y * t5;
		} else if(this.ws2.fluidEnabled) {
			var mass3 = this.overlap * this.ws2.fluidProperties.density;
			var t6 = mass3;
			buoyx += g2x * t6;
			buoyy += g2y * t6;
		}
		var t7 = dt;
		buoyx *= t7;
		buoyy *= t7;
		this.buoyx = buoyx;
		this.buoyy = buoyy;
		if(this.b1.type == 2) {
			var t8 = this.b1.imass;
			this.b1.velx -= buoyx * t8;
			this.b1.vely -= buoyy * t8;
			this.b1.angvel -= (buoyy * this.r1x - buoyx * this.r1y) * this.b1.iinertia;
		}
		if(this.b2.type == 2) {
			var t9 = this.b2.imass;
			this.b2.velx += buoyx * t9;
			this.b2.vely += buoyy * t9;
			this.b2.angvel += (buoyy * this.r2x - buoyx * this.r2y) * this.b2.iinertia;
		}
		if((!this.ws1.fluidEnabled || this.ws1.fluidProperties.viscosity == 0) && (!this.ws2.fluidEnabled || this.ws2.fluidProperties.viscosity == 0)) {
			this.nodrag = true;
			this.dampx = 0;
			this.dampy = 0;
			this.adamp = 0;
		} else {
			this.nodrag = false;
			var tViscosity = 0.0;
			if(this.ws1.fluidEnabled) {
				this.ws2.validate_angDrag();
				tViscosity += this.ws1.fluidProperties.viscosity * this.ws2.angDrag * this.overlap / this.ws2.area;
			}
			if(this.ws2.fluidEnabled) {
				this.ws1.validate_angDrag();
				tViscosity += this.ws2.fluidProperties.viscosity * this.ws1.angDrag * this.overlap / this.ws1.area;
			}
			if(tViscosity != 0) {
				var iSum = this.b1.sinertia + this.b2.sinertia;
				if(iSum != 0) this.wMass = 1 / iSum; else this.wMass = 0.0;
				var biasCoef;
				tViscosity *= 0.0004;
				var omega = 2 * Math.PI * tViscosity;
				this.agamma = 1 / (dt * omega * (2 + omega * dt));
				var ig = 1 / (1 + this.agamma);
				biasCoef = dt * omega * omega * this.agamma;
				this.agamma *= ig;
				this.wMass *= ig;
			} else {
				this.wMass = 0.0;
				this.agamma = 0.0;
			}
			var vrnx = this.b2.velx + this.b2.kinvelx - this.r2y * (this.b2.angvel + this.b2.kinangvel) - (this.b1.velx + this.b1.kinvelx - this.r1y * (this.b2.angvel + this.b2.kinangvel));
			var vrny = this.b2.vely + this.b2.kinvely + this.r2x * (this.b2.angvel + this.b2.kinangvel) - (this.b1.vely + this.b1.kinvely + this.r1x * (this.b1.angvel + this.b1.kinangvel));
			if(vrnx * vrnx + vrny * vrny < nape_Config.epsilon * nape_Config.epsilon) {
			} else {
				var d = vrnx * vrnx + vrny * vrny;
				var imag = 1.0 / Math.sqrt(d);
				var t10 = imag;
				vrnx *= t10;
				vrny *= t10;
				this.nx = vrnx;
				this.ny = vrny;
			}
			var tViscosity1 = 0.0;
			if(this.ws1.fluidEnabled) {
				var f = -this.ws1.fluidProperties.viscosity * this.overlap / this.ws2.area;
				if(this.ws2.type == 0) tViscosity1 -= f * this.ws2.circle.radius * nape_Config.fluidLinearDrag / (2 * this.ws2.circle.radius * Math.PI); else {
					var poly = this.ws2.polygon;
					var bord = 0.0;
					var acc = 0.0;
					var cx_ite = poly.edges.head;
					while(cx_ite != null) {
						var ex = cx_ite.elt;
						bord += ex.length;
						var fact = f * ex.length * (ex.gnormx * this.nx + ex.gnormy * this.ny);
						if(fact > 0) fact = fact *= -nape_Config.fluidVacuumDrag;
						acc -= fact * 0.5 * nape_Config.fluidLinearDrag;
						cx_ite = cx_ite.next;
					}
					tViscosity1 += acc / bord;
				}
			}
			if(this.ws2.fluidEnabled) {
				var f1 = -this.ws2.fluidProperties.viscosity * this.overlap / this.ws1.area;
				if(this.ws1.type == 0) tViscosity1 -= f1 * this.ws1.circle.radius * nape_Config.fluidLinearDrag / (2 * this.ws1.circle.radius * Math.PI); else {
					var poly1 = this.ws1.polygon;
					var bord1 = 0.0;
					var acc1 = 0.0;
					var cx_ite1 = poly1.edges.head;
					while(cx_ite1 != null) {
						var ex1 = cx_ite1.elt;
						bord1 += ex1.length;
						var fact1 = f1 * ex1.length * (ex1.gnormx * this.nx + ex1.gnormy * this.ny);
						if(fact1 > 0) fact1 = fact1 *= -nape_Config.fluidVacuumDrag;
						acc1 -= fact1 * 0.5 * nape_Config.fluidLinearDrag;
						cx_ite1 = cx_ite1.next;
					}
					tViscosity1 += acc1 / bord1;
				}
			}
			if(tViscosity1 != 0) {
				var m = this.b1.smass + this.b2.smass;
				var Ka = 0.0;
				var Kb = 0.0;
				var Kc = 0.0;
				Ka = m;
				Kb = 0;
				Kc = m;
				if(this.b1.sinertia != 0) {
					var X = this.r1x * this.b1.sinertia;
					var Y = this.r1y * this.b1.sinertia;
					Ka += Y * this.r1y;
					Kb += -Y * this.r1x;
					Kc += X * this.r1x;
				}
				if(this.b2.sinertia != 0) {
					var X1 = this.r2x * this.b2.sinertia;
					var Y1 = this.r2y * this.b2.sinertia;
					Ka += Y1 * this.r2y;
					Kb += -Y1 * this.r2x;
					Kc += X1 * this.r2x;
				}
				var det = Ka * Kc - Kb * Kb;
				if(det != det) {
					Ka = Kb = Kc = 0;
					3;
				} else if(det == 0) {
					var flag = 0;
					if(Ka != 0) Ka = 1 / Ka; else {
						Ka = 0;
						flag |= 1;
					}
					if(Kc != 0) Kc = 1 / Kc; else {
						Kc = 0;
						flag |= 2;
					}
					Kb = 0;
					flag;
				} else {
					det = 1 / det;
					var t11 = Kc * det;
					Kc = Ka * det;
					Ka = t11;
					Kb *= -det;
					0;
				}
				this.vMassa = Ka;
				this.vMassb = Kb;
				this.vMassc = Kc;
				var biasCoef1;
				var X2;
				var omega1 = 2 * Math.PI * tViscosity1;
				this.lgamma = 1 / (dt * omega1 * (2 + omega1 * dt));
				var ig1 = 1 / (1 + this.lgamma);
				biasCoef1 = dt * omega1 * omega1 * this.lgamma;
				this.lgamma *= ig1;
				X2 = ig1;
				this.vMassa *= X2;
				this.vMassb *= X2;
				this.vMassc *= X2;
			} else {
				this.vMassa = 0;
				this.vMassb = 0;
				this.vMassc = 0;
				this.lgamma = 0.0;
			}
		}
		var t12 = dtratio;
		this.dampx *= t12;
		this.dampy *= t12;
		this.adamp *= dtratio;
	}
	,warmStart: function() {
		var t = this.b1.imass;
		this.b1.velx -= this.dampx * t;
		this.b1.vely -= this.dampy * t;
		var t1 = this.b2.imass;
		this.b2.velx += this.dampx * t1;
		this.b2.vely += this.dampy * t1;
		this.b1.angvel -= this.b1.iinertia * (this.dampy * this.r1x - this.dampx * this.r1y);
		this.b2.angvel += this.b2.iinertia * (this.dampy * this.r2x - this.dampx * this.r2y);
		this.b1.angvel -= this.adamp * this.b1.iinertia;
		this.b2.angvel += this.adamp * this.b2.iinertia;
	}
	,applyImpulseVel: function() {
		if(!this.nodrag) {
			var w1 = this.b1.angvel + this.b1.kinangvel;
			var w2 = this.b2.angvel + this.b2.kinangvel;
			var jx = this.b1.velx + this.b1.kinvelx - this.r1y * w1 - (this.b2.velx + this.b2.kinvelx - this.r2y * w2);
			var jy = this.b1.vely + this.b1.kinvely + this.r1x * w1 - (this.b2.vely + this.b2.kinvely + this.r2x * w2);
			var t = this.vMassa * jx + this.vMassb * jy;
			jy = this.vMassb * jx + this.vMassc * jy;
			jx = t;
			var t1 = this.lgamma;
			jx -= this.dampx * t1;
			jy -= this.dampy * t1;
			var t2 = 1.0;
			this.dampx += jx * t2;
			this.dampy += jy * t2;
			var t3 = this.b1.imass;
			this.b1.velx -= jx * t3;
			this.b1.vely -= jy * t3;
			var t4 = this.b2.imass;
			this.b2.velx += jx * t4;
			this.b2.vely += jy * t4;
			this.b1.angvel -= this.b1.iinertia * (jy * this.r1x - jx * this.r1y);
			this.b2.angvel += this.b2.iinertia * (jy * this.r2x - jx * this.r2y);
			var j_damp = (w1 - w2) * this.wMass - this.adamp * this.agamma;
			this.adamp += j_damp;
			this.b1.angvel -= j_damp * this.b1.iinertia;
			this.b2.angvel += j_damp * this.b2.iinertia;
		}
	}
	,__class__: zpp_$nape_dynamics_ZPP_$FluidArbiter
});
var zpp_$nape_dynamics_ZPP_$ColArbiter = function() {
	this.pre_dt = 0.0;
	this.mutable = false;
	this.stat = false;
	this.next = null;
	this.hpc2 = false;
	this.hc2 = false;
	this.oc2 = null;
	this.c2 = null;
	this.oc1 = null;
	this.c1 = null;
	this.__ref_vertex = 0;
	this.__ref_edge2 = null;
	this.__ref_edge1 = null;
	this.biasCoef = 0.0;
	this.rev = false;
	this.radius = 0.0;
	this.lproj = 0.0;
	this.lnormy = 0.0;
	this.lnormx = 0.0;
	this.surfacey = 0.0;
	this.surfacex = 0.0;
	this.k2y = 0.0;
	this.k2x = 0.0;
	this.k1y = 0.0;
	this.k1x = 0.0;
	this.rt2b = 0.0;
	this.rn2b = 0.0;
	this.rt2a = 0.0;
	this.rn2a = 0.0;
	this.rt1b = 0.0;
	this.rn1b = 0.0;
	this.rt1a = 0.0;
	this.rn1a = 0.0;
	this.jrAcc = 0.0;
	this.rMass = 0.0;
	this.Kc = 0.0;
	this.Kb = 0.0;
	this.Ka = 0.0;
	this.kMassc = 0.0;
	this.kMassb = 0.0;
	this.kMassa = 0.0;
	this.wrap_normal = null;
	this.ny = 0.0;
	this.nx = 0.0;
	this.innards = null;
	this.wrap_contacts = null;
	this.contacts = null;
	this.s2 = null;
	this.s1 = null;
	this.userdef_rfric = false;
	this.userdef_restitution = false;
	this.userdef_stat_fric = false;
	this.userdef_dyn_fric = false;
	this.rfric = 0.0;
	this.restitution = 0.0;
	this.stat_fric = 0.0;
	this.dyn_fric = 0.0;
	this.outer_zn = null;
	zpp_$nape_dynamics_ZPP_$Arbiter.call(this);
	this.pre_dt = -1.0;
	this.contacts = new zpp_$nape_dynamics_ZPP_$Contact();
	this.innards = new zpp_$nape_dynamics_ZPP_$IContact();
	this.type = zpp_$nape_dynamics_ZPP_$Arbiter.COL;
	this.colarb = this;
};
zpp_$nape_dynamics_ZPP_$ColArbiter.__name__ = true;
zpp_$nape_dynamics_ZPP_$ColArbiter.__super__ = zpp_$nape_dynamics_ZPP_$Arbiter;
zpp_$nape_dynamics_ZPP_$ColArbiter.prototype = $extend(zpp_$nape_dynamics_ZPP_$Arbiter.prototype,{
	injectContact: function(px,py,nx,ny,dist,hash,posOnly) {
		if(posOnly == null) posOnly = false;
		var c = null;
		var cx_ite = this.contacts.next;
		while(cx_ite != null) {
			var cur = cx_ite;
			if(hash == cur.hash) {
				c = cur;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(c == null) {
			if(zpp_$nape_dynamics_ZPP_$Contact.zpp_pool == null) c = new zpp_$nape_dynamics_ZPP_$Contact(); else {
				c = zpp_$nape_dynamics_ZPP_$Contact.zpp_pool;
				zpp_$nape_dynamics_ZPP_$Contact.zpp_pool = c.next;
				c.next = null;
			}
			null;
			var ci = c.inner;
			ci.jnAcc = ci.jtAcc = 0;
			c.hash = hash;
			c.fresh = true;
			c.arbiter = this;
			this.jrAcc = 0;
			this.contacts.inlined_add(c);
			this.innards.add(ci);
		} else c.fresh = false;
		c.px = px;
		c.py = py;
		this.nx = nx;
		this.ny = ny;
		c.dist = dist;
		c.stamp = this.stamp;
		c.posOnly = posOnly;
		return c;
	}
	,retire: function() {
		if(!this.cleared) {
			this.b1.arbiters.inlined_try_remove(this);
			this.b2.arbiters.inlined_try_remove(this);
			if(this.pair != null) {
				this.pair.arb = null;
				this.pair = null;
			}
		}
		this.b1 = this.b2 = null;
		this.active = false;
		this.intchange = false;
		while(!(this.contacts.next == null)) {
			var o = this.contacts.inlined_pop_unsafe();
			o.arbiter = null;
			o.next = zpp_$nape_dynamics_ZPP_$Contact.zpp_pool;
			zpp_$nape_dynamics_ZPP_$Contact.zpp_pool = o;
			this.innards.inlined_pop();
		}
		var o1 = this;
		o1.userdef_dyn_fric = false;
		o1.userdef_stat_fric = false;
		o1.userdef_restitution = false;
		o1.userdef_rfric = false;
		o1.__ref_edge1 = o1.__ref_edge2 = null;
		o1.next = zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool;
		zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool = o1;
		this.pre_dt = -1.0;
	}
	,cleanupContacts: function() {
		var fst = true;
		var pre = null;
		var prei = null;
		var cx_itei = this.innards.next;
		this.hc2 = false;
		var cx_ite = this.contacts.next;
		while(cx_ite != null) {
			var c = cx_ite;
			if(c.stamp + nape_Config.arbiterExpirationDelay < this.stamp) {
				cx_ite = this.contacts.inlined_erase(pre);
				cx_itei = this.innards.inlined_erase(prei);
				var o = c;
				o.arbiter = null;
				o.next = zpp_$nape_dynamics_ZPP_$Contact.zpp_pool;
				zpp_$nape_dynamics_ZPP_$Contact.zpp_pool = o;
				continue;
			}
			var ci = c.inner;
			var pact = c.active;
			c.active = c.stamp == this.stamp;
			if(c.active) {
				if(fst) {
					fst = false;
					this.c1 = ci;
					this.oc1 = c;
				} else {
					this.hc2 = true;
					this.c2 = ci;
					this.oc2 = c;
				}
			}
			if(pact != c.active) this.contacts.modified = true;
			pre = cx_ite;
			prei = cx_itei;
			cx_itei = cx_itei.next;
			cx_ite = cx_ite.next;
		}
		if(this.hc2) {
			this.hpc2 = true;
			if(this.oc1.posOnly) {
				var tmp = this.c1;
				this.c1 = this.c2;
				this.c2 = tmp;
				var tmp2 = this.oc1;
				this.oc1 = this.oc2;
				this.oc2 = tmp2;
				this.hc2 = false;
			} else if(this.oc2.posOnly) this.hc2 = false;
			if(this.oc1.posOnly) fst = true;
		} else this.hpc2 = false;
		return fst;
	}
	,preStep: function(dt) {
		if(this.invalidated) {
			this.invalidated = false;
			if(!this.userdef_restitution) {
				if(this.s1.material.elasticity <= -Infinity || this.s2.material.elasticity <= -Infinity) this.restitution = 0; else if(this.s1.material.elasticity >= Infinity || this.s2.material.elasticity >= Infinity) this.restitution = 1; else this.restitution = (this.s1.material.elasticity + this.s2.material.elasticity) / 2;
				if(this.restitution < 0) this.restitution = 0;
				if(this.restitution > 1) this.restitution = 1;
			}
			if(!this.userdef_dyn_fric) this.dyn_fric = Math.sqrt(this.s1.material.dynamicFriction * this.s2.material.dynamicFriction);
			if(!this.userdef_stat_fric) this.stat_fric = Math.sqrt(this.s1.material.staticFriction * this.s2.material.staticFriction);
			if(!this.userdef_rfric) this.rfric = Math.sqrt(this.s1.material.rollingFriction * this.s2.material.rollingFriction);
		}
		if(this.pre_dt == -1.0) this.pre_dt = dt;
		var dtratio = dt / this.pre_dt;
		this.pre_dt = dt;
		var mass_sum = this.b1.smass + this.b2.smass;
		this.hc2 = false;
		var fst = true;
		var statType = !(this.b1.type == 2) || !(this.b2.type == 2);
		var bias;
		if(statType) {
			if(this.continuous) bias = nape_Config.contactContinuousStaticBiasCoef; else bias = nape_Config.contactStaticBiasCoef;
		} else if(this.continuous) bias = nape_Config.contactContinuousBiasCoef; else bias = nape_Config.contactBiasCoef;
		this.biasCoef = bias;
		this.continuous = false;
		var pre = null;
		var prei = null;
		var cx_itei = this.innards.next;
		var cx_ite = this.contacts.next;
		while(cx_ite != null) {
			var c = cx_ite;
			if(c.stamp + nape_Config.arbiterExpirationDelay < this.stamp) {
				cx_ite = this.contacts.inlined_erase(pre);
				cx_itei = this.innards.inlined_erase(prei);
				var o = c;
				o.arbiter = null;
				o.next = zpp_$nape_dynamics_ZPP_$Contact.zpp_pool;
				zpp_$nape_dynamics_ZPP_$Contact.zpp_pool = o;
				continue;
			}
			var ci = c.inner;
			var pact = c.active;
			c.active = c.stamp == this.stamp;
			if(c.active) {
				if(fst) {
					fst = false;
					this.c1 = ci;
					this.oc1 = c;
				} else {
					this.hc2 = true;
					this.c2 = ci;
					this.oc2 = c;
				}
				ci.r2x = c.px - this.b2.posx;
				ci.r2y = c.py - this.b2.posy;
				ci.r1x = c.px - this.b1.posx;
				ci.r1y = c.py - this.b1.posy;
				var kt = mass_sum + this.b2.sinertia * zpp_$nape_util_ZPP_$Math.sqr(ci.r2x * this.nx + ci.r2y * this.ny);
				kt += this.b1.sinertia * zpp_$nape_util_ZPP_$Math.sqr(ci.r1x * this.nx + ci.r1y * this.ny);
				if(kt < nape_Config.epsilon * nape_Config.epsilon) ci.tMass = 0; else ci.tMass = 1.0 / kt;
				var nt = mass_sum + this.b2.sinertia * zpp_$nape_util_ZPP_$Math.sqr(this.ny * ci.r2x - this.nx * ci.r2y);
				nt += this.b1.sinertia * zpp_$nape_util_ZPP_$Math.sqr(this.ny * ci.r1x - this.nx * ci.r1y);
				if(nt < nape_Config.epsilon * nape_Config.epsilon) ci.nMass = 0; else ci.nMass = 1.0 / nt;
				var vrx = 0.0;
				var vry = 0.0;
				var ang = this.b2.angvel + this.b2.kinangvel;
				vrx = this.b2.velx + this.b2.kinvelx - ci.r2y * ang;
				vry = this.b2.vely + this.b2.kinvely + ci.r2x * ang;
				ang = this.b1.angvel + this.b1.kinangvel;
				vrx -= this.b1.velx + this.b1.kinvelx - ci.r1y * ang;
				vry -= this.b1.vely + this.b1.kinvely + ci.r1x * ang;
				var vdot = this.nx * vrx + this.ny * vry;
				c.elasticity = this.restitution;
				ci.bounce = vdot * c.elasticity;
				if(ci.bounce > -nape_Config.elasticThreshold) ci.bounce = 0;
				vdot = vry * this.nx - vrx * this.ny;
				var thr = nape_Config.staticFrictionThreshold;
				if(vdot * vdot > thr * thr) ci.friction = this.dyn_fric; else ci.friction = this.stat_fric;
				ci.jnAcc *= dtratio;
				ci.jtAcc *= dtratio;
			}
			if(pact != c.active) this.contacts.modified = true;
			pre = cx_ite;
			prei = cx_itei;
			cx_itei = cx_itei.next;
			cx_ite = cx_ite.next;
		}
		if(this.hc2) {
			this.hpc2 = true;
			if(this.oc1.posOnly) {
				var tmp = this.c1;
				this.c1 = this.c2;
				this.c2 = tmp;
				var tmp2 = this.oc1;
				this.oc1 = this.oc2;
				this.oc2 = tmp2;
				this.hc2 = false;
			} else if(this.oc2.posOnly) this.hc2 = false;
			if(this.oc1.posOnly) fst = true;
		} else this.hpc2 = false;
		this.jrAcc *= dtratio;
		if(!fst) {
			this.rn1a = this.ny * this.c1.r1x - this.nx * this.c1.r1y;
			this.rt1a = this.c1.r1x * this.nx + this.c1.r1y * this.ny;
			this.rn1b = this.ny * this.c1.r2x - this.nx * this.c1.r2y;
			this.rt1b = this.c1.r2x * this.nx + this.c1.r2y * this.ny;
			this.k1x = this.b2.kinvelx - this.c1.r2y * this.b2.kinangvel - (this.b1.kinvelx - this.c1.r1y * this.b1.kinangvel);
			this.k1y = this.b2.kinvely + this.c1.r2x * this.b2.kinangvel - (this.b1.kinvely + this.c1.r1x * this.b1.kinangvel);
		}
		if(this.hc2) {
			this.rn2a = this.ny * this.c2.r1x - this.nx * this.c2.r1y;
			this.rt2a = this.c2.r1x * this.nx + this.c2.r1y * this.ny;
			this.rn2b = this.ny * this.c2.r2x - this.nx * this.c2.r2y;
			this.rt2b = this.c2.r2x * this.nx + this.c2.r2y * this.ny;
			this.k2x = this.b2.kinvelx - this.c2.r2y * this.b2.kinangvel - (this.b1.kinvelx - this.c2.r1y * this.b1.kinangvel);
			this.k2y = this.b2.kinvely + this.c2.r2x * this.b2.kinangvel - (this.b1.kinvely + this.c2.r1x * this.b1.kinangvel);
			this.kMassa = mass_sum + this.b1.sinertia * this.rn1a * this.rn1a + this.b2.sinertia * this.rn1b * this.rn1b;
			this.kMassb = mass_sum + this.b1.sinertia * this.rn1a * this.rn2a + this.b2.sinertia * this.rn1b * this.rn2b;
			this.kMassc = mass_sum + this.b1.sinertia * this.rn2a * this.rn2a + this.b2.sinertia * this.rn2b * this.rn2b;
			var norm = this.kMassa * this.kMassa + 2 * this.kMassb * this.kMassb + this.kMassc * this.kMassc;
			if(norm < nape_Config.illConditionedThreshold * (this.kMassa * this.kMassc - this.kMassb * this.kMassb)) {
				this.Ka = this.kMassa;
				this.Kb = this.kMassb;
				this.Kc = this.kMassc;
				var det = this.kMassa * this.kMassc - this.kMassb * this.kMassb;
				if(det != det) {
					this.kMassa = this.kMassb = this.kMassc = 0;
					3;
				} else if(det == 0) {
					var flag = 0;
					if(this.kMassa != 0) this.kMassa = 1 / this.kMassa; else {
						this.kMassa = 0;
						flag |= 1;
					}
					if(this.kMassc != 0) this.kMassc = 1 / this.kMassc; else {
						this.kMassc = 0;
						flag |= 2;
					}
					this.kMassb = 0;
					flag;
				} else {
					det = 1 / det;
					var t = this.kMassc * det;
					this.kMassc = this.kMassa * det;
					this.kMassa = t;
					this.kMassb *= -det;
					0;
				}
			} else {
				this.hc2 = false;
				if(this.oc2.dist < this.oc1.dist) {
					var t1 = this.c1;
					this.c1 = this.c2;
					this.c2 = t1;
				}
				this.oc2.active = false;
				this.contacts.modified = true;
			}
		}
		this.surfacex = this.b2.svelx;
		this.surfacey = this.b2.svely;
		var t2 = 1.0;
		this.surfacex += this.b1.svelx * t2;
		this.surfacey += this.b1.svely * t2;
		this.surfacex = -this.surfacex;
		this.surfacey = -this.surfacey;
		this.rMass = this.b1.sinertia + this.b2.sinertia;
		if(this.rMass != 0) this.rMass = 1 / this.rMass;
		return fst;
	}
	,warmStart: function() {
		var jx = this.nx * this.c1.jnAcc - this.ny * this.c1.jtAcc;
		var jy = this.ny * this.c1.jnAcc + this.nx * this.c1.jtAcc;
		var t = this.b1.imass;
		this.b1.velx -= jx * t;
		this.b1.vely -= jy * t;
		this.b1.angvel -= this.b1.iinertia * (jy * this.c1.r1x - jx * this.c1.r1y);
		var t1 = this.b2.imass;
		this.b2.velx += jx * t1;
		this.b2.vely += jy * t1;
		this.b2.angvel += this.b2.iinertia * (jy * this.c1.r2x - jx * this.c1.r2y);
		if(this.hc2) {
			var jx1 = this.nx * this.c2.jnAcc - this.ny * this.c2.jtAcc;
			var jy1 = this.ny * this.c2.jnAcc + this.nx * this.c2.jtAcc;
			var t2 = this.b1.imass;
			this.b1.velx -= jx1 * t2;
			this.b1.vely -= jy1 * t2;
			this.b1.angvel -= this.b1.iinertia * (jy1 * this.c2.r1x - jx1 * this.c2.r1y);
			var t3 = this.b2.imass;
			this.b2.velx += jx1 * t3;
			this.b2.vely += jy1 * t3;
			this.b2.angvel += this.b2.iinertia * (jy1 * this.c2.r2x - jx1 * this.c2.r2y);
		}
		this.b2.angvel += this.jrAcc * this.b2.iinertia;
		this.b1.angvel -= this.jrAcc * this.b1.iinertia;
	}
	,applyImpulseVel: function() {
		var jx;
		var jy;
		var j;
		var jMax;
		var jOld;
		var cjAcc;
		var v1x = this.k1x + this.b2.velx - this.c1.r2y * this.b2.angvel - (this.b1.velx - this.c1.r1y * this.b1.angvel);
		var v1y = this.k1y + this.b2.vely + this.c1.r2x * this.b2.angvel - (this.b1.vely + this.c1.r1x * this.b1.angvel);
		j = (v1y * this.nx - v1x * this.ny + this.surfacex) * this.c1.tMass;
		jMax = this.c1.friction * this.c1.jnAcc;
		jOld = this.c1.jtAcc;
		cjAcc = jOld - j;
		if(cjAcc > jMax) cjAcc = jMax; else if(cjAcc < -jMax) cjAcc = -jMax;
		j = cjAcc - jOld;
		this.c1.jtAcc = cjAcc;
		jx = -this.ny * j;
		jy = this.nx * j;
		this.b2.velx += jx * this.b2.imass;
		this.b2.vely += jy * this.b2.imass;
		this.b1.velx -= jx * this.b1.imass;
		this.b1.vely -= jy * this.b1.imass;
		this.b2.angvel += this.rt1b * j * this.b2.iinertia;
		this.b1.angvel -= this.rt1a * j * this.b1.iinertia;
		if(this.hc2) {
			var v2x = this.k2x + this.b2.velx - this.c2.r2y * this.b2.angvel - (this.b1.velx - this.c2.r1y * this.b1.angvel);
			var v2y = this.k2y + this.b2.vely + this.c2.r2x * this.b2.angvel - (this.b1.vely + this.c2.r1x * this.b1.angvel);
			j = (v2y * this.nx - v2x * this.ny + this.surfacex) * this.c2.tMass;
			jMax = this.c2.friction * this.c2.jnAcc;
			jOld = this.c2.jtAcc;
			cjAcc = jOld - j;
			if(cjAcc > jMax) cjAcc = jMax; else if(cjAcc < -jMax) cjAcc = -jMax;
			j = cjAcc - jOld;
			this.c2.jtAcc = cjAcc;
			jx = -this.ny * j;
			jy = this.nx * j;
			this.b2.velx += jx * this.b2.imass;
			this.b2.vely += jy * this.b2.imass;
			this.b1.velx -= jx * this.b1.imass;
			this.b1.vely -= jy * this.b1.imass;
			this.b2.angvel += this.rt2b * j * this.b2.iinertia;
			this.b1.angvel -= this.rt2a * j * this.b1.iinertia;
			v1x = this.k1x + this.b2.velx - this.c1.r2y * this.b2.angvel - (this.b1.velx - this.c1.r1y * this.b1.angvel);
			v1y = this.k1y + this.b2.vely + this.c1.r2x * this.b2.angvel - (this.b1.vely + this.c1.r1x * this.b1.angvel);
			v2x = this.k2x + this.b2.velx - this.c2.r2y * this.b2.angvel - (this.b1.velx - this.c2.r1y * this.b1.angvel);
			v2y = this.k2y + this.b2.vely + this.c2.r2x * this.b2.angvel - (this.b1.vely + this.c2.r1x * this.b1.angvel);
			var ax = this.c1.jnAcc;
			var ay = this.c2.jnAcc;
			var jnx = v1x * this.nx + v1y * this.ny + this.surfacey + this.c1.bounce - (this.Ka * ax + this.Kb * ay);
			var jny = v2x * this.nx + v2y * this.ny + this.surfacey + this.c2.bounce - (this.Kb * ax + this.Kc * ay);
			var xx = -(this.kMassa * jnx + this.kMassb * jny);
			var xy = -(this.kMassb * jnx + this.kMassc * jny);
			if(xx >= 0 && xy >= 0) {
				jnx = xx - ax;
				jny = xy - ay;
				this.c1.jnAcc = xx;
				this.c2.jnAcc = xy;
			} else {
				xx = -this.c1.nMass * jnx;
				if(xx >= 0 && this.Kb * xx + jny >= 0) {
					jnx = xx - ax;
					jny = -ay;
					this.c1.jnAcc = xx;
					this.c2.jnAcc = 0;
				} else {
					xy = -this.c2.nMass * jny;
					if(xy >= 0 && this.Kb * xy + jnx >= 0) {
						jnx = -ax;
						jny = xy - ay;
						this.c1.jnAcc = 0;
						this.c2.jnAcc = xy;
					} else if(jnx >= 0 && jny >= 0) {
						jnx = -ax;
						jny = -ay;
						this.c1.jnAcc = this.c2.jnAcc = 0;
					} else {
						jnx = 0;
						jny = 0;
					}
				}
			}
			j = jnx + jny;
			jx = this.nx * j;
			jy = this.ny * j;
			this.b2.velx += jx * this.b2.imass;
			this.b2.vely += jy * this.b2.imass;
			this.b1.velx -= jx * this.b1.imass;
			this.b1.vely -= jy * this.b1.imass;
			this.b2.angvel += (this.rn1b * jnx + this.rn2b * jny) * this.b2.iinertia;
			this.b1.angvel -= (this.rn1a * jnx + this.rn2a * jny) * this.b1.iinertia;
		} else {
			if(this.radius != 0.0) {
				var dw = this.b2.angvel - this.b1.angvel;
				j = dw * this.rMass;
				jMax = this.rfric * this.c1.jnAcc;
				jOld = this.jrAcc;
				this.jrAcc -= j;
				if(this.jrAcc > jMax) this.jrAcc = jMax; else if(this.jrAcc < -jMax) this.jrAcc = -jMax;
				j = this.jrAcc - jOld;
				this.b2.angvel += j * this.b2.iinertia;
				this.b1.angvel -= j * this.b1.iinertia;
			}
			v1x = this.k1x + this.b2.velx - this.c1.r2y * this.b2.angvel - (this.b1.velx - this.c1.r1y * this.b1.angvel);
			v1y = this.k1y + this.b2.vely + this.c1.r2x * this.b2.angvel - (this.b1.vely + this.c1.r1x * this.b1.angvel);
			j = (this.c1.bounce + (this.nx * v1x + this.ny * v1y) + this.surfacey) * this.c1.nMass;
			jOld = this.c1.jnAcc;
			cjAcc = jOld - j;
			if(cjAcc < 0.0) cjAcc = 0.0;
			j = cjAcc - jOld;
			this.c1.jnAcc = cjAcc;
			jx = this.nx * j;
			jy = this.ny * j;
			this.b2.velx += jx * this.b2.imass;
			this.b2.vely += jy * this.b2.imass;
			this.b1.velx -= jx * this.b1.imass;
			this.b1.vely -= jy * this.b1.imass;
			this.b2.angvel += this.rn1b * j * this.b2.iinertia;
			this.b1.angvel -= this.rn1a * j * this.b1.iinertia;
		}
	}
	,applyImpulsePos: function() {
		if(this.ptype == 2) {
			var c = this.c1;
			var dx = 0.0;
			var dy = 0.0;
			var r2x = 0.0;
			var r2y = 0.0;
			r2x = this.b2.axisy * c.lr2x - this.b2.axisx * c.lr2y;
			r2y = c.lr2x * this.b2.axisx + c.lr2y * this.b2.axisy;
			var t = 1.0;
			r2x += this.b2.posx * t;
			r2y += this.b2.posy * t;
			var r1x = 0.0;
			var r1y = 0.0;
			r1x = this.b1.axisy * c.lr1x - this.b1.axisx * c.lr1y;
			r1y = c.lr1x * this.b1.axisx + c.lr1y * this.b1.axisy;
			var t1 = 1.0;
			r1x += this.b1.posx * t1;
			r1y += this.b1.posy * t1;
			var dx1 = 0.0;
			var dy1 = 0.0;
			dx1 = r2x - r1x;
			dy1 = r2y - r1y;
			var dl = Math.sqrt(dx1 * dx1 + dy1 * dy1);
			var r = this.radius - nape_Config.collisionSlop;
			var err = dl - r;
			if(dx1 * this.nx + dy1 * this.ny < 0) {
				dx1 = -dx1;
				dy1 = -dy1;
				err -= this.radius;
			}
			if(err < 0) {
				if(dl < nape_Config.epsilon) {
					if(this.b1.smass != 0.0) this.b1.posx += nape_Config.epsilon * 10; else this.b2.posx += nape_Config.epsilon * 10;
				} else {
					var t2 = 1.0 / dl;
					dx1 *= t2;
					dy1 *= t2;
					var px = 0.5 * (r1x + r2x);
					var py = 0.5 * (r1y + r2y);
					var pen = dl - r;
					r1x = px - this.b1.posx;
					r1y = py - this.b1.posy;
					r2x = px - this.b2.posx;
					r2y = py - this.b2.posy;
					var rn1 = dy1 * r1x - dx1 * r1y;
					var rn2 = dy1 * r2x - dx1 * r2y;
					var K = this.b2.smass + rn2 * rn2 * this.b2.sinertia + this.b1.smass + rn1 * rn1 * this.b1.sinertia;
					if(K != 0) {
						var jn = -this.biasCoef * pen / K;
						var Jx = 0.0;
						var Jy = 0.0;
						var t3 = jn;
						Jx = dx1 * t3;
						Jy = dy1 * t3;
						var t4 = this.b1.imass;
						this.b1.posx -= Jx * t4;
						this.b1.posy -= Jy * t4;
						this.b1.delta_rot(-rn1 * this.b1.iinertia * jn);
						var t5 = this.b2.imass;
						this.b2.posx += Jx * t5;
						this.b2.posy += Jy * t5;
						this.b2.delta_rot(rn2 * this.b2.iinertia * jn);
					}
				}
			}
		} else {
			var gnormx = 0.0;
			var gnormy = 0.0;
			var gproj;
			var clip1x = 0.0;
			var clip1y = 0.0;
			var clip2x = 0;
			var clip2y = 0;
			if(this.ptype == 0) {
				gnormx = this.b1.axisy * this.lnormx - this.b1.axisx * this.lnormy;
				gnormy = this.lnormx * this.b1.axisx + this.lnormy * this.b1.axisy;
				gproj = this.lproj + (gnormx * this.b1.posx + gnormy * this.b1.posy);
				clip1x = this.b2.axisy * this.c1.lr1x - this.b2.axisx * this.c1.lr1y;
				clip1y = this.c1.lr1x * this.b2.axisx + this.c1.lr1y * this.b2.axisy;
				var t6 = 1.0;
				clip1x += this.b2.posx * t6;
				clip1y += this.b2.posy * t6;
				if(this.hpc2) {
					clip2x = this.b2.axisy * this.c2.lr1x - this.b2.axisx * this.c2.lr1y;
					clip2y = this.c2.lr1x * this.b2.axisx + this.c2.lr1y * this.b2.axisy;
					var t7 = 1.0;
					clip2x += this.b2.posx * t7;
					clip2y += this.b2.posy * t7;
				}
			} else {
				gnormx = this.b2.axisy * this.lnormx - this.b2.axisx * this.lnormy;
				gnormy = this.lnormx * this.b2.axisx + this.lnormy * this.b2.axisy;
				gproj = this.lproj + (gnormx * this.b2.posx + gnormy * this.b2.posy);
				clip1x = this.b1.axisy * this.c1.lr1x - this.b1.axisx * this.c1.lr1y;
				clip1y = this.c1.lr1x * this.b1.axisx + this.c1.lr1y * this.b1.axisy;
				var t8 = 1.0;
				clip1x += this.b1.posx * t8;
				clip1y += this.b1.posy * t8;
				if(this.hpc2) {
					clip2x = this.b1.axisy * this.c2.lr1x - this.b1.axisx * this.c2.lr1y;
					clip2y = this.c2.lr1x * this.b1.axisx + this.c2.lr1y * this.b1.axisy;
					var t9 = 1.0;
					clip2x += this.b1.posx * t9;
					clip2y += this.b1.posy * t9;
				}
			}
			var err1 = clip1x * gnormx + clip1y * gnormy - gproj - this.radius;
			err1 += nape_Config.collisionSlop;
			var err2 = 0.0;
			if(this.hpc2) {
				err2 = clip2x * gnormx + clip2y * gnormy - gproj - this.radius;
				err2 += nape_Config.collisionSlop;
			}
			if(err1 < 0 || err2 < 0) {
				if(this.rev) {
					gnormx = -gnormx;
					gnormy = -gnormy;
				}
				var c1r1x = 0.0;
				var c1r1y = 0.0;
				c1r1x = clip1x - this.b1.posx;
				c1r1y = clip1y - this.b1.posy;
				var c1r2x = 0.0;
				var c1r2y = 0.0;
				c1r2x = clip1x - this.b2.posx;
				c1r2y = clip1y - this.b2.posy;
				var c2r1x = 0;
				var c2r1y = 0;
				var c2r2x = 0;
				var c2r2y = 0;
				if(this.hpc2) {
					c2r1x = clip2x - this.b1.posx;
					c2r1y = clip2y - this.b1.posy;
					c2r2x = clip2x - this.b2.posx;
					c2r2y = clip2y - this.b2.posy;
					var rn1a = gnormy * c1r1x - gnormx * c1r1y;
					var rn1b = gnormy * c1r2x - gnormx * c1r2y;
					var rn2a = gnormy * c2r1x - gnormx * c2r1y;
					var rn2b = gnormy * c2r2x - gnormx * c2r2y;
					var mass_sum = this.b1.smass + this.b2.smass;
					this.kMassa = mass_sum + this.b1.sinertia * rn1a * rn1a + this.b2.sinertia * rn1b * rn1b;
					this.kMassb = mass_sum + this.b1.sinertia * rn1a * rn2a + this.b2.sinertia * rn1b * rn2b;
					this.kMassc = mass_sum + this.b1.sinertia * rn2a * rn2a + this.b2.sinertia * rn2b * rn2b;
					var Ka = 0.0;
					var Kb = 0.0;
					var Kc = 0.0;
					Ka = this.kMassa;
					Kb = this.kMassb;
					Kc = this.kMassc;
					var bx = err1 * this.biasCoef;
					var by = err2 * this.biasCoef;
					do {
						var xx = 0.0;
						var xy = 0.0;
						xx = bx;
						xy = by;
						xx = -xx;
						xy = -xy;
						var det = this.kMassa * this.kMassc - this.kMassb * this.kMassb;
						if(det != det) xx = xy = 0; else if(det == 0) {
							if(this.kMassa != 0) xx /= this.kMassa; else xx = 0;
							if(this.kMassc != 0) xy /= this.kMassc; else xy = 0;
						} else {
							det = 1 / det;
							var t10 = det * (this.kMassc * xx - this.kMassb * xy);
							xy = det * (this.kMassa * xy - this.kMassb * xx);
							xx = t10;
						}
						if(xx >= 0 && xy >= 0) {
							var t11 = (xx + xy) * this.b1.imass;
							this.b1.posx -= gnormx * t11;
							this.b1.posy -= gnormy * t11;
							this.b1.delta_rot(-this.b1.iinertia * (rn1a * xx + rn2a * xy));
							var t12 = (xx + xy) * this.b2.imass;
							this.b2.posx += gnormx * t12;
							this.b2.posy += gnormy * t12;
							this.b2.delta_rot(this.b2.iinertia * (rn1b * xx + rn2b * xy));
							break;
						}
						xx = -bx / Ka;
						xy = 0;
						var vn2 = Kb * xx + by;
						if(xx >= 0 && vn2 >= 0) {
							var t13 = (xx + xy) * this.b1.imass;
							this.b1.posx -= gnormx * t13;
							this.b1.posy -= gnormy * t13;
							this.b1.delta_rot(-this.b1.iinertia * (rn1a * xx + rn2a * xy));
							var t14 = (xx + xy) * this.b2.imass;
							this.b2.posx += gnormx * t14;
							this.b2.posy += gnormy * t14;
							this.b2.delta_rot(this.b2.iinertia * (rn1b * xx + rn2b * xy));
							break;
						}
						xx = 0;
						xy = -by / Kc;
						var vn1 = Kb * xy + bx;
						if(xy >= 0 && vn1 >= 0) {
							var t15 = (xx + xy) * this.b1.imass;
							this.b1.posx -= gnormx * t15;
							this.b1.posy -= gnormy * t15;
							this.b1.delta_rot(-this.b1.iinertia * (rn1a * xx + rn2a * xy));
							var t16 = (xx + xy) * this.b2.imass;
							this.b2.posx += gnormx * t16;
							this.b2.posy += gnormy * t16;
							this.b2.delta_rot(this.b2.iinertia * (rn1b * xx + rn2b * xy));
							break;
						}
					} while(false);
				} else {
					var rn11 = gnormy * c1r1x - gnormx * c1r1y;
					var rn21 = gnormy * c1r2x - gnormx * c1r2y;
					var K1 = this.b2.smass + rn21 * rn21 * this.b2.sinertia + this.b1.smass + rn11 * rn11 * this.b1.sinertia;
					if(K1 != 0) {
						var jn1 = -this.biasCoef * err1 / K1;
						var Jx1 = 0.0;
						var Jy1 = 0.0;
						var t17 = jn1;
						Jx1 = gnormx * t17;
						Jy1 = gnormy * t17;
						var t18 = this.b1.imass;
						this.b1.posx -= Jx1 * t18;
						this.b1.posy -= Jy1 * t18;
						this.b1.delta_rot(-rn11 * this.b1.iinertia * jn1);
						var t19 = this.b2.imass;
						this.b2.posx += Jx1 * t19;
						this.b2.posy += Jy1 * t19;
						this.b2.delta_rot(rn21 * this.b2.iinertia * jn1);
					}
				}
			}
		}
	}
	,__class__: zpp_$nape_dynamics_ZPP_$ColArbiter
});
var zpp_$nape_dynamics_ZPP_$Contact = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this._inuse = false;
	this.next = null;
	this.elasticity = 0.0;
	this.dist = 0.0;
	this.fresh = false;
	this.hash = 0;
	this.stamp = 0;
	this.posOnly = false;
	this.active = false;
	this.inner = null;
	this.arbiter = null;
	this.py = 0.0;
	this.px = 0.0;
	this.outer = null;
	this.inner = new zpp_$nape_dynamics_ZPP_$IContact();
};
zpp_$nape_dynamics_ZPP_$Contact.__name__ = true;
zpp_$nape_dynamics_ZPP_$Contact.prototype = {
	wrapper: function() {
		if(this.outer == null) {
			zpp_$nape_dynamics_ZPP_$Contact.internal = true;
			this.outer = new nape_dynamics_Contact();
			zpp_$nape_dynamics_ZPP_$Contact.internal = false;
			this.outer.zpp_inner = this;
		}
		return this.outer;
	}
	,inlined_add: function(o) {
		var temp;
		o._inuse = true;
		temp = o;
		temp.next = this.next;
		this.next = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.next;
		this.next = ret.next;
		ret._inuse = false;
		if(this.next == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,inlined_pop_unsafe: function() {
		var ret = this.next;
		this.pop();
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.next;
			ret = old.next;
			this.next = ret;
			if(this.next == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		old._inuse = false;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_dynamics_ZPP_$Contact
};
var zpp_$nape_dynamics_ZPP_$IContact = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this._inuse = false;
	this.next = null;
	this.lr2y = 0.0;
	this.lr2x = 0.0;
	this.lr1y = 0.0;
	this.lr1x = 0.0;
	this.jtAcc = 0.0;
	this.jnAcc = 0.0;
	this.friction = 0.0;
	this.bounce = 0.0;
	this.tMass = 0.0;
	this.nMass = 0.0;
	this.r2y = 0.0;
	this.r2x = 0.0;
	this.r1y = 0.0;
	this.r1x = 0.0;
};
zpp_$nape_dynamics_ZPP_$IContact.__name__ = true;
zpp_$nape_dynamics_ZPP_$IContact.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		o._inuse = true;
		temp = o;
		temp.next = this.next;
		this.next = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,inlined_pop: function() {
		var ret = this.next;
		this.next = ret.next;
		ret._inuse = false;
		if(this.next == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.next;
			ret = old.next;
			this.next = ret;
			if(this.next == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		old._inuse = false;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_dynamics_ZPP_$IContact
};
var zpp_$nape_dynamics_ZPP_$InteractionFilter = function() {
	this.fluidMask = 0;
	this.fluidGroup = 0;
	this.sensorMask = 0;
	this.sensorGroup = 0;
	this.collisionMask = 0;
	this.collisionGroup = 0;
	this.shapes = null;
	this.outer = null;
	this.next = null;
	this.shapes = new zpp_$nape_util_ZNPList_$ZPP_$Shape();
	this.collisionGroup = this.sensorGroup = this.fluidGroup = 1;
	this.collisionMask = this.sensorMask = this.fluidMask = -1;
};
zpp_$nape_dynamics_ZPP_$InteractionFilter.__name__ = true;
zpp_$nape_dynamics_ZPP_$InteractionFilter.prototype = {
	wrapper: function() {
		if(this.outer == null) {
			this.outer = new nape_dynamics_InteractionFilter();
			var o = this.outer.zpp_inner;
			o.outer = null;
			o.next = zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool;
			zpp_$nape_dynamics_ZPP_$InteractionFilter.zpp_pool = o;
			this.outer.zpp_inner = this;
		}
		return this.outer;
	}
	,shouldCollide: function(x) {
		return (this.collisionMask & x.collisionGroup) != 0 && (x.collisionMask & this.collisionGroup) != 0;
	}
	,shouldSense: function(x) {
		return (this.sensorMask & x.sensorGroup) != 0 && (x.sensorMask & this.sensorGroup) != 0;
	}
	,shouldFlow: function(x) {
		return (this.fluidMask & x.fluidGroup) != 0 && (x.fluidMask & this.fluidGroup) != 0;
	}
	,invalidate: function() {
		var cx_ite = this.shapes.head;
		while(cx_ite != null) {
			var s = cx_ite.elt;
			s.invalidate_filter();
			cx_ite = cx_ite.next;
		}
	}
	,__class__: zpp_$nape_dynamics_ZPP_$InteractionFilter
};
var zpp_$nape_dynamics_ZPP_$InteractionGroup = function() {
	this.depth = 0;
	this.interactors = null;
	this.group = null;
	this.ignore = false;
	this.outer = null;
};
zpp_$nape_dynamics_ZPP_$InteractionGroup.__name__ = true;
zpp_$nape_dynamics_ZPP_$InteractionGroup.prototype = {
	__class__: zpp_$nape_dynamics_ZPP_$InteractionGroup
};
var zpp_$nape_geom_ZPP_$AABB = function() {
	this.wrap_max = null;
	this.maxy = 0.0;
	this.maxx = 0.0;
	this.wrap_min = null;
	this.miny = 0.0;
	this.minx = 0.0;
	this.next = null;
	this.outer = null;
	this._immutable = false;
	this._validate = null;
	this._invalidate = null;
};
zpp_$nape_geom_ZPP_$AABB.__name__ = true;
zpp_$nape_geom_ZPP_$AABB.get = function(minx,miny,maxx,maxy) {
	var ret;
	if(zpp_$nape_geom_ZPP_$AABB.zpp_pool == null) ret = new zpp_$nape_geom_ZPP_$AABB(); else {
		ret = zpp_$nape_geom_ZPP_$AABB.zpp_pool;
		zpp_$nape_geom_ZPP_$AABB.zpp_pool = ret.next;
		ret.next = null;
	}
	null;
	ret.minx = minx;
	ret.miny = miny;
	ret.maxx = maxx;
	ret.maxy = maxy;
	return ret;
};
zpp_$nape_geom_ZPP_$AABB.prototype = {
	validate: function() {
		if(this._validate != null) this._validate();
	}
	,perimeter: function() {
		return (this.maxx - this.minx + (this.maxy - this.miny)) * 2;
	}
	,intersectY: function(x) {
		return !(x.miny > this.maxy || this.miny > x.maxy);
	}
	,intersect: function(x) {
		return x.miny <= this.maxy && this.miny <= x.maxy && x.minx <= this.maxx && this.minx <= x.maxx;
	}
	,combine: function(x) {
		if(x.minx < this.minx) this.minx = x.minx;
		if(x.maxx > this.maxx) this.maxx = x.maxx;
		if(x.miny < this.miny) this.miny = x.miny;
		if(x.maxy > this.maxy) this.maxy = x.maxy;
	}
	,contains: function(x) {
		return x.minx >= this.minx && x.miny >= this.miny && x.maxx <= this.maxx && x.maxy <= this.maxy;
	}
	,setCombine: function(a,b) {
		if(a.minx < b.minx) this.minx = a.minx; else this.minx = b.minx;
		if(a.miny < b.miny) this.miny = a.miny; else this.miny = b.miny;
		if(a.maxx > b.maxx) this.maxx = a.maxx; else this.maxx = b.maxx;
		if(a.maxy > b.maxy) this.maxy = a.maxy; else this.maxy = b.maxy;
	}
	,setExpand: function(a,fatten) {
		this.minx = a.minx - fatten;
		this.miny = a.miny - fatten;
		this.maxx = a.maxx + fatten;
		this.maxy = a.maxy + fatten;
	}
	,toString: function() {
		return "{ x: " + this.minx + " y: " + this.miny + " w: " + (this.maxx - this.minx) + " h: " + (this.maxy - this.miny) + " }";
	}
	,__class__: zpp_$nape_geom_ZPP_$AABB
};
var zpp_$nape_util_ZNPList_$ZPP_$Vec2 = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Vec2.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Vec2.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Vec2(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,insert: function(cur,o) {
		return this.inlined_insert(cur,o);
	}
	,inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Vec2(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,erase: function(pre) {
		return this.inlined_erase(pre);
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Vec2.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,clear: function() {
		while(!(this.head == null)) this.inlined_pop();
		this.pushmod = true;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Vec2
};
var zpp_$nape_geom_ZPP_$Collide = function() { };
zpp_$nape_geom_ZPP_$Collide.__name__ = true;
zpp_$nape_geom_ZPP_$Collide.contactCollide = function(s1,s2,arb,rev) {
	if(s2.type == 1) {
		if(s1.type == 1) {
			var cont = true;
			var max = -1e+100;
			var maxmin = -1e+100;
			var maxi = -1;
			var axis1 = null;
			var axis2 = null;
			var cx_ite = s1.polygon.edges.head;
			while(cx_ite != null) {
				var ax = cx_ite.elt;
				var min = 1e100;
				var cx_ite1 = s2.polygon.gverts.next;
				while(cx_ite1 != null) {
					var v = cx_ite1;
					var k = ax.gnormx * v.x + ax.gnormy * v.y;
					if(k < min) min = k;
					if(min - ax.gprojection <= max) break;
					cx_ite1 = cx_ite1.next;
				}
				min -= ax.gprojection;
				if(min >= 0) {
					cont = false;
					break;
				}
				if(min > max) {
					max = min;
					axis1 = ax;
					maxi = 1;
				}
				cx_ite = cx_ite.next;
			}
			if(cont) {
				var cx_ite2 = s2.polygon.edges.head;
				while(cx_ite2 != null) {
					var ax1 = cx_ite2.elt;
					var min1 = 1e100;
					var cx_ite3 = s1.polygon.gverts.next;
					while(cx_ite3 != null) {
						var v1 = cx_ite3;
						var k1 = ax1.gnormx * v1.x + ax1.gnormy * v1.y;
						if(k1 < min1) min1 = k1;
						if(min1 - ax1.gprojection <= max) break;
						cx_ite3 = cx_ite3.next;
					}
					min1 -= ax1.gprojection;
					if(min1 >= 0) {
						cont = false;
						break;
					}
					if(min1 > max) {
						max = min1;
						axis2 = ax1;
						maxi = 2;
					}
					cx_ite2 = cx_ite2.next;
				}
				if(!cont) return false; else {
					var q1;
					var q2;
					var ax2;
					var scale;
					if(maxi == 1) {
						q1 = s1.polygon;
						q2 = s2.polygon;
						ax2 = axis1;
						scale = 1.0;
					} else {
						q1 = s2.polygon;
						q2 = s1.polygon;
						ax2 = axis2;
						scale = -1.0;
					}
					var ay = null;
					var min2 = 1e100;
					var cx_ite4 = q2.edges.head;
					while(cx_ite4 != null) {
						var axis = cx_ite4.elt;
						var k2 = ax2.gnormx * axis.gnormx + ax2.gnormy * axis.gnormy;
						if(k2 < min2) {
							min2 = k2;
							ay = axis;
						}
						cx_ite4 = cx_ite4.next;
					}
					var c0x = 0.0;
					var c0y = 0.0;
					c0x = ay.gp0.x;
					c0y = ay.gp0.y;
					var c1x = 0.0;
					var c1y = 0.0;
					c1x = ay.gp1.x;
					c1y = ay.gp1.y;
					var dvx = 0.0;
					var dvy = 0.0;
					dvx = c1x - c0x;
					dvy = c1y - c0y;
					var d0 = ax2.gnormy * c0x - ax2.gnormx * c0y;
					var d1 = ax2.gnormy * c1x - ax2.gnormx * c1y;
					var den = 1 / (d1 - d0);
					var t = (-ax2.tp1 - d0) * den;
					if(t > nape_Config.epsilon) {
						var t2 = t;
						c0x += dvx * t2;
						c0y += dvy * t2;
					}
					var t1 = (-ax2.tp0 - d1) * den;
					if(t1 < -nape_Config.epsilon) {
						var t3 = t1;
						c1x += dvx * t3;
						c1y += dvy * t3;
					}
					var nx = 0.0;
					var ny = 0.0;
					var t4 = scale;
					nx = ax2.gnormx * t4;
					ny = ax2.gnormy * t4;
					arb.lnormx = ax2.lnormx;
					arb.lnormy = ax2.lnormy;
					arb.lproj = ax2.lprojection;
					arb.radius = 0;
					arb.rev = rev != (scale == -1);
					if(arb.rev) arb.ptype = 1; else arb.ptype = 0;
					var c0d = c0x * ax2.gnormx + c0y * ax2.gnormy - ax2.gprojection;
					var c1d = c1x * ax2.gnormx + c1y * ax2.gnormy - ax2.gprojection;
					if(c0d > 0 && c1d > 0) return false; else {
						if(rev) {
							nx = -nx;
							ny = -ny;
						}
						var con = arb.injectContact(c0x - ax2.gnormx * c0d * 0.5,c0y - ax2.gnormy * c0d * 0.5,nx,ny,c0d,arb.rev?1:0,c0d > 0);
						var t5 = 1.0;
						c0x -= q2.body.posx * t5;
						c0y -= q2.body.posy * t5;
						con.inner.lr1x = c0x * q2.body.axisy + c0y * q2.body.axisx;
						con.inner.lr1y = c0y * q2.body.axisy - c0x * q2.body.axisx;
						con = arb.injectContact(c1x - ax2.gnormx * c1d * 0.5,c1y - ax2.gnormy * c1d * 0.5,nx,ny,c1d,arb.rev?0:1,c1d > 0);
						var t6 = 1.0;
						c1x -= q2.body.posx * t6;
						c1y -= q2.body.posy * t6;
						con.inner.lr1x = c1x * q2.body.axisy + c1y * q2.body.axisx;
						con.inner.lr1y = c1y * q2.body.axisy - c1x * q2.body.axisx;
						if(maxi == 1) {
							arb.__ref_edge1 = ax2;
							arb.__ref_edge2 = ay;
						} else {
							arb.__ref_edge2 = ax2;
							arb.__ref_edge1 = ay;
						}
						return true;
					}
				}
			} else return false;
		} else {
			var max1 = -1e+100;
			var minmax = -1e+100;
			var cont1 = true;
			var a0 = null;
			var vi = null;
			var vite = s2.polygon.gverts.next;
			var cx_ite5 = s2.polygon.edges.head;
			while(cx_ite5 != null) {
				var a = cx_ite5.elt;
				var dist = a.gnormx * s1.circle.worldCOMx + a.gnormy * s1.circle.worldCOMy - a.gprojection - s1.circle.radius;
				if(dist > 0) {
					cont1 = false;
					break;
				}
				if(dist > max1) {
					max1 = dist;
					a0 = a;
					vi = vite;
				}
				vite = vite.next;
				cx_ite5 = cx_ite5.next;
			}
			if(cont1) {
				var v0 = vi;
				var v11;
				if(vi.next == null) v11 = s2.polygon.gverts.next; else v11 = vi.next;
				var dt = s1.circle.worldCOMy * a0.gnormx - s1.circle.worldCOMx * a0.gnormy;
				if(dt <= v0.y * a0.gnormx - v0.x * a0.gnormy) {
					var co;
					var minDist = s1.circle.radius;
					var px = 0.0;
					var py = 0.0;
					px = v0.x - s1.circle.worldCOMx;
					py = v0.y - s1.circle.worldCOMy;
					var distSqr = px * px + py * py;
					if(distSqr > minDist * minDist) co = null; else if(distSqr < nape_Config.epsilon * nape_Config.epsilon) co = arb.injectContact(s1.circle.worldCOMx,s1.circle.worldCOMy,1,0,-minDist,0,null); else {
						var invDist = 1.0 / Math.sqrt(distSqr);
						var dist1;
						if(invDist < nape_Config.epsilon) dist1 = 1e100; else dist1 = 1.0 / invDist;
						var df = 0.5 + (s1.circle.radius - 0.5 * minDist) * invDist;
						if(rev) co = arb.injectContact(s1.circle.worldCOMx + px * df,s1.circle.worldCOMy + py * df,-px * invDist,-py * invDist,dist1 - minDist,0,null); else co = arb.injectContact(s1.circle.worldCOMx + px * df,s1.circle.worldCOMy + py * df,px * invDist,py * invDist,dist1 - minDist,0,null);
					}
					if(co != null) {
						var con1 = co.inner;
						arb.ptype = 2;
						var vx = 0.0;
						var vy = 0.0;
						vx = v0.x - s2.polygon.body.posx;
						vy = v0.y - s2.polygon.body.posy;
						arb.__ref_edge1 = a0;
						arb.__ref_vertex = -1;
						if(rev) {
							con1.lr1x = vx * s2.polygon.body.axisy + vy * s2.polygon.body.axisx;
							con1.lr1y = vy * s2.polygon.body.axisy - vx * s2.polygon.body.axisx;
							con1.lr2x = s1.circle.localCOMx;
							con1.lr2y = s1.circle.localCOMy;
						} else {
							con1.lr2x = vx * s2.polygon.body.axisy + vy * s2.polygon.body.axisx;
							con1.lr2y = vy * s2.polygon.body.axisy - vx * s2.polygon.body.axisx;
							con1.lr1x = s1.circle.localCOMx;
							con1.lr1y = s1.circle.localCOMy;
						}
						arb.radius = s1.circle.radius;
					}
					return co != null;
				} else if(dt >= v11.y * a0.gnormx - v11.x * a0.gnormy) {
					var co1;
					var minDist1 = s1.circle.radius;
					var px1 = 0.0;
					var py1 = 0.0;
					px1 = v11.x - s1.circle.worldCOMx;
					py1 = v11.y - s1.circle.worldCOMy;
					var distSqr1 = px1 * px1 + py1 * py1;
					if(distSqr1 > minDist1 * minDist1) co1 = null; else if(distSqr1 < nape_Config.epsilon * nape_Config.epsilon) co1 = arb.injectContact(s1.circle.worldCOMx,s1.circle.worldCOMy,1,0,-minDist1,0,null); else {
						var invDist1 = 1.0 / Math.sqrt(distSqr1);
						var dist2;
						if(invDist1 < nape_Config.epsilon) dist2 = 1e100; else dist2 = 1.0 / invDist1;
						var df1 = 0.5 + (s1.circle.radius - 0.5 * minDist1) * invDist1;
						if(rev) co1 = arb.injectContact(s1.circle.worldCOMx + px1 * df1,s1.circle.worldCOMy + py1 * df1,-px1 * invDist1,-py1 * invDist1,dist2 - minDist1,0,null); else co1 = arb.injectContact(s1.circle.worldCOMx + px1 * df1,s1.circle.worldCOMy + py1 * df1,px1 * invDist1,py1 * invDist1,dist2 - minDist1,0,null);
					}
					if(co1 != null) {
						var con2 = co1.inner;
						arb.ptype = 2;
						var vx1 = 0.0;
						var vy1 = 0.0;
						vx1 = v11.x - s2.polygon.body.posx;
						vy1 = v11.y - s2.polygon.body.posy;
						arb.__ref_edge1 = a0;
						arb.__ref_vertex = 1;
						if(rev) {
							con2.lr1x = vx1 * s2.polygon.body.axisy + vy1 * s2.polygon.body.axisx;
							con2.lr1y = vy1 * s2.polygon.body.axisy - vx1 * s2.polygon.body.axisx;
							con2.lr2x = s1.circle.localCOMx;
							con2.lr2y = s1.circle.localCOMy;
						} else {
							con2.lr2x = vx1 * s2.polygon.body.axisy + vy1 * s2.polygon.body.axisx;
							con2.lr2y = vy1 * s2.polygon.body.axisy - vx1 * s2.polygon.body.axisx;
							con2.lr1x = s1.circle.localCOMx;
							con2.lr1y = s1.circle.localCOMy;
						}
						arb.radius = s1.circle.radius;
					}
					return co1 != null;
				} else {
					var nx1 = 0.0;
					var ny1 = 0.0;
					var t7 = s1.circle.radius + max1 * 0.5;
					nx1 = a0.gnormx * t7;
					ny1 = a0.gnormy * t7;
					var px2 = 0.0;
					var py2 = 0.0;
					px2 = s1.circle.worldCOMx - nx1;
					py2 = s1.circle.worldCOMy - ny1;
					var con3;
					if(rev) con3 = arb.injectContact(px2,py2,a0.gnormx,a0.gnormy,max1,0,null); else con3 = arb.injectContact(px2,py2,-a0.gnormx,-a0.gnormy,max1,0,null);
					if(rev) arb.ptype = 0; else arb.ptype = 1;
					arb.lnormx = a0.lnormx;
					arb.lnormy = a0.lnormy;
					arb.rev = !rev;
					arb.lproj = a0.lprojection;
					arb.radius = s1.circle.radius;
					con3.inner.lr1x = s1.circle.localCOMx;
					con3.inner.lr1y = s1.circle.localCOMy;
					arb.__ref_edge1 = a0;
					arb.__ref_vertex = 0;
					return true;
				}
			} else return false;
		}
	} else {
		var co2;
		var minDist2 = s1.circle.radius + s2.circle.radius;
		var px3 = 0.0;
		var py3 = 0.0;
		px3 = s2.circle.worldCOMx - s1.circle.worldCOMx;
		py3 = s2.circle.worldCOMy - s1.circle.worldCOMy;
		var distSqr2 = px3 * px3 + py3 * py3;
		if(distSqr2 > minDist2 * minDist2) co2 = null; else if(distSqr2 < nape_Config.epsilon * nape_Config.epsilon) co2 = arb.injectContact(s1.circle.worldCOMx,s1.circle.worldCOMy,1,0,-minDist2,0,null); else {
			var invDist2 = 1.0 / Math.sqrt(distSqr2);
			var dist3;
			if(invDist2 < nape_Config.epsilon) dist3 = 1e100; else dist3 = 1.0 / invDist2;
			var df2 = 0.5 + (s1.circle.radius - 0.5 * minDist2) * invDist2;
			if(rev) co2 = arb.injectContact(s1.circle.worldCOMx + px3 * df2,s1.circle.worldCOMy + py3 * df2,-px3 * invDist2,-py3 * invDist2,dist3 - minDist2,0,null); else co2 = arb.injectContact(s1.circle.worldCOMx + px3 * df2,s1.circle.worldCOMy + py3 * df2,px3 * invDist2,py3 * invDist2,dist3 - minDist2,0,null);
		}
		if(co2 != null) {
			var con4 = co2.inner;
			if(rev) {
				con4.lr1x = s2.circle.localCOMx;
				con4.lr1y = s2.circle.localCOMy;
				con4.lr2x = s1.circle.localCOMx;
				con4.lr2y = s1.circle.localCOMy;
			} else {
				con4.lr1x = s1.circle.localCOMx;
				con4.lr1y = s1.circle.localCOMy;
				con4.lr2x = s2.circle.localCOMx;
				con4.lr2y = s2.circle.localCOMy;
			}
			arb.radius = s1.circle.radius + s2.circle.radius;
			arb.ptype = 2;
			return true;
		} else return false;
	}
};
zpp_$nape_geom_ZPP_$Collide.testCollide_safe = function(s1,s2) {
	if(s2.type == 0) {
		var t = s1;
		s1 = s2;
		s2 = t;
	}
	return zpp_$nape_geom_ZPP_$Collide.testCollide(s1,s2);
};
zpp_$nape_geom_ZPP_$Collide.testCollide = function(s1,s2) {
	if(s2.type == 1) if(s1.type == 1) {
		var cont = true;
		var cx_ite = s1.polygon.edges.head;
		while(cx_ite != null) {
			var ax = cx_ite.elt;
			var min = 1e100;
			var cx_ite1 = s2.polygon.gverts.next;
			while(cx_ite1 != null) {
				var v = cx_ite1;
				var k = ax.gnormx * v.x + ax.gnormy * v.y;
				if(k < min) min = k;
				cx_ite1 = cx_ite1.next;
			}
			min -= ax.gprojection;
			if(min > 0) {
				cont = false;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(cont) {
			var cx_ite2 = s2.polygon.edges.head;
			while(cx_ite2 != null) {
				var ax1 = cx_ite2.elt;
				var min1 = 1e100;
				var cx_ite3 = s1.polygon.gverts.next;
				while(cx_ite3 != null) {
					var v1 = cx_ite3;
					var k1 = ax1.gnormx * v1.x + ax1.gnormy * v1.y;
					if(k1 < min1) min1 = k1;
					cx_ite3 = cx_ite3.next;
				}
				min1 -= ax1.gprojection;
				if(min1 > 0) {
					cont = false;
					break;
				}
				cx_ite2 = cx_ite2.next;
			}
			return cont;
		} else return false;
	} else {
		var a0 = null;
		var vi = null;
		var cont1 = true;
		var max = -1e+100;
		var vite = s2.polygon.gverts.next;
		var cx_ite4 = s2.polygon.edges.head;
		while(cx_ite4 != null) {
			var a = cx_ite4.elt;
			var dist = a.gnormx * s1.circle.worldCOMx + a.gnormy * s1.circle.worldCOMy - a.gprojection - s1.circle.radius;
			if(dist > 0) {
				cont1 = false;
				break;
			}
			if(dist > max) {
				max = dist;
				a0 = a;
				vi = vite;
			}
			vite = vite.next;
			cx_ite4 = cx_ite4.next;
		}
		if(cont1) {
			var v0 = vi;
			var v11;
			if(vi.next == null) v11 = s2.polygon.gverts.next; else v11 = vi.next;
			var dt = s1.circle.worldCOMy * a0.gnormx - s1.circle.worldCOMx * a0.gnormy;
			if(dt <= v0.y * a0.gnormx - v0.x * a0.gnormy) {
				var minDist = s1.circle.radius;
				var px = 0.0;
				var py = 0.0;
				px = v0.x - s1.circle.worldCOMx;
				py = v0.y - s1.circle.worldCOMy;
				var distSqr = px * px + py * py;
				return distSqr <= minDist * minDist;
			} else if(dt >= v11.y * a0.gnormx - v11.x * a0.gnormy) {
				var minDist1 = s1.circle.radius;
				var px1 = 0.0;
				var py1 = 0.0;
				px1 = v11.x - s1.circle.worldCOMx;
				py1 = v11.y - s1.circle.worldCOMy;
				var distSqr1 = px1 * px1 + py1 * py1;
				return distSqr1 <= minDist1 * minDist1;
			} else return true;
		} else return false;
	} else {
		var minDist2 = s1.circle.radius + s2.circle.radius;
		var px2 = 0.0;
		var py2 = 0.0;
		px2 = s2.circle.worldCOMx - s1.circle.worldCOMx;
		py2 = s2.circle.worldCOMy - s1.circle.worldCOMy;
		var distSqr2 = px2 * px2 + py2 * py2;
		return distSqr2 <= minDist2 * minDist2;
	}
};
zpp_$nape_geom_ZPP_$Collide.flowCollide = function(s1,s2,arb) {
	if(s2.type == 1) if(s1.type == 1) {
		var out1 = [];
		var out2 = [];
		var cont = true;
		var total = true;
		var cx_ite = s1.polygon.edges.head;
		while(cx_ite != null) {
			var ax = cx_ite.elt;
			var min = 1e100;
			var ind = 0;
			var cx_ite1 = s2.polygon.gverts.next;
			while(cx_ite1 != null) {
				var v = cx_ite1;
				var k = ax.gnormx * v.x + ax.gnormy * v.y;
				if(k < min) min = k;
				if(k >= ax.gprojection + nape_Config.epsilon) {
					out2[ind] = true;
					total = false;
				}
				ind++;
				cx_ite1 = cx_ite1.next;
			}
			min -= ax.gprojection;
			if(min > 0) {
				cont = false;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(total) {
			s2.polygon.validate_worldCOM();
			arb.overlap = s2.polygon.area;
			arb.centroidx = s2.polygon.worldCOMx;
			arb.centroidy = s2.polygon.worldCOMy;
			null;
			return true;
		} else if(cont) {
			total = true;
			var cx_ite2 = s2.polygon.edges.head;
			while(cx_ite2 != null) {
				var ax1 = cx_ite2.elt;
				var min1 = 1e100;
				var ind1 = 0;
				var cx_ite3 = s1.polygon.gverts.next;
				while(cx_ite3 != null) {
					var v1 = cx_ite3;
					var k1 = ax1.gnormx * v1.x + ax1.gnormy * v1.y;
					if(k1 < min1) min1 = k1;
					if(k1 >= ax1.gprojection + nape_Config.epsilon) {
						out1[ind1] = true;
						total = false;
					}
					ind1++;
					cx_ite3 = cx_ite3.next;
				}
				min1 -= ax1.gprojection;
				if(min1 > 0) {
					cont = false;
					break;
				}
				cx_ite2 = cx_ite2.next;
			}
			if(total) {
				s1.polygon.validate_worldCOM();
				arb.overlap = s1.polygon.area;
				arb.centroidx = s1.polygon.worldCOMx;
				arb.centroidy = s1.polygon.worldCOMy;
				null;
				return true;
			} else if(cont) {
				while(!(zpp_$nape_geom_ZPP_$Collide.flowpoly.head == null)) {
					var p = zpp_$nape_geom_ZPP_$Collide.flowpoly.pop_unsafe();
					if(!p._inuse) {
						var o = p;
						if(o.outer != null) {
							o.outer.zpp_inner = null;
							o.outer = null;
						}
						o._isimmutable = null;
						o._validate = null;
						o._invalidate = null;
						o.next = zpp_$nape_geom_ZPP_$Vec2.zpp_pool;
						zpp_$nape_geom_ZPP_$Vec2.zpp_pool = o;
					}
				}
				var fst_vert = null;
				var poly1 = false;
				var ite1 = s1.polygon.gverts.next;
				var ind11 = 0;
				var ite2 = s2.polygon.gverts.next;
				var ind2 = 0;
				var _g1 = 0;
				var _g = s2.polygon.edgeCnt;
				while(_g1 < _g) {
					var i = _g1++;
					if(!out2[i]) {
						ind2 = i;
						break;
					} else ite2 = ite2.next;
				}
				if(ite2 == null) {
					ite2 = s2.polygon.gverts.next;
					poly1 = true;
					var _g11 = 0;
					var _g2 = s1.polygon.edgeCnt;
					while(_g11 < _g2) {
						var i1 = _g11++;
						if(!out1[i1]) {
							ind11 = i1;
							break;
						} else ite1 = ite1.next;
					}
					if(ite1 == null) ite1 = s1.polygon.gverts.next; else {
						zpp_$nape_geom_ZPP_$Collide.flowpoly.add(ite1);
						fst_vert = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
					}
				} else {
					zpp_$nape_geom_ZPP_$Collide.flowpoly.add(ite2);
					fst_vert = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
				}
				var cnt = 1;
				if(zpp_$nape_geom_ZPP_$Collide.flowpoly.head == null) {
					var cx_cont = true;
					var cx_itei = s1.polygon.gverts.next;
					var u = cx_itei;
					var cx_itej = cx_itei.next;
					while(cx_itej != null) {
						var v2 = cx_itej;
						var min2 = 2.0;
						var cx_cont1 = true;
						var cx_itei1 = s2.polygon.gverts.next;
						var a = cx_itei1;
						var cx_itej1 = cx_itei1.next;
						while(cx_itej1 != null) {
							var b = cx_itej1;
							var t = 0.0;
							if((function($this) {
								var $r;
								var _sx = 0.0;
								var _sy = 0.0;
								{
									_sx = u.x - a.x;
									_sy = u.y - a.y;
								}
								var _vx = 0.0;
								var _vy = 0.0;
								{
									_vx = v2.x - u.x;
									_vy = v2.y - u.y;
								}
								var _qx = 0.0;
								var _qy = 0.0;
								{
									_qx = b.x - a.x;
									_qy = b.y - a.y;
								}
								var den = _vy * _qx - _vx * _qy;
								$r = den * den > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den = 1 / den;
									var txx = (_qy * _sx - _qx * _sy) * den;
									$r = txx > nape_Config.epsilon && txx < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx = (_vy * _sx - _vx * _sy) * den;
										$r = sxx > nape_Config.epsilon && sxx < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t = txx;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t < min2) {
									min2 = t;
									ite2 = cx_itei1;
								}
							}
							cx_itei1 = cx_itej1;
							a = b;
							cx_itej1 = cx_itej1.next;
						}
						if(cx_cont1) do {
							cx_itej1 = s2.polygon.gverts.next;
							var b1 = cx_itej1;
							var t1 = 0.0;
							if((function($this) {
								var $r;
								var _sx1 = 0.0;
								var _sy1 = 0.0;
								{
									_sx1 = u.x - a.x;
									_sy1 = u.y - a.y;
								}
								var _vx1 = 0.0;
								var _vy1 = 0.0;
								{
									_vx1 = v2.x - u.x;
									_vy1 = v2.y - u.y;
								}
								var _qx1 = 0.0;
								var _qy1 = 0.0;
								{
									_qx1 = b1.x - a.x;
									_qy1 = b1.y - a.y;
								}
								var den1 = _vy1 * _qx1 - _vx1 * _qy1;
								$r = den1 * den1 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den1 = 1 / den1;
									var txx1 = (_qy1 * _sx1 - _qx1 * _sy1) * den1;
									$r = txx1 > nape_Config.epsilon && txx1 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx1 = (_vy1 * _sx1 - _vx1 * _sy1) * den1;
										$r = sxx1 > nape_Config.epsilon && sxx1 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t1 = txx1;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t1 < min2) {
									min2 = t1;
									ite2 = cx_itei1;
								}
							}
						} while(false);
						if(min2 != 2.0) {
							var cx = 0.0;
							var cy = 0.0;
							var T = min2;
							cx = u.x + (v2.x - u.x) * T;
							cy = u.y + (v2.y - u.y) * T;
							fst_vert = zpp_$nape_geom_ZPP_$Vec2.get(cx,cy,null);
							zpp_$nape_geom_ZPP_$Collide.flowpoly.add(fst_vert);
							poly1 = true;
							ite1 = cx_itei;
							cx_cont = false;
							break;
						}
						cx_itei = cx_itej;
						u = v2;
						cx_itej = cx_itej.next;
					}
					if(cx_cont) do {
						cx_itej = s1.polygon.gverts.next;
						var v3 = cx_itej;
						var min3 = 2.0;
						var cx_cont2 = true;
						var cx_itei2 = s2.polygon.gverts.next;
						var a1 = cx_itei2;
						var cx_itej2 = cx_itei2.next;
						while(cx_itej2 != null) {
							var b2 = cx_itej2;
							var t2 = 0.0;
							if((function($this) {
								var $r;
								var _sx2 = 0.0;
								var _sy2 = 0.0;
								{
									_sx2 = u.x - a1.x;
									_sy2 = u.y - a1.y;
								}
								var _vx2 = 0.0;
								var _vy2 = 0.0;
								{
									_vx2 = v3.x - u.x;
									_vy2 = v3.y - u.y;
								}
								var _qx2 = 0.0;
								var _qy2 = 0.0;
								{
									_qx2 = b2.x - a1.x;
									_qy2 = b2.y - a1.y;
								}
								var den2 = _vy2 * _qx2 - _vx2 * _qy2;
								$r = den2 * den2 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den2 = 1 / den2;
									var txx2 = (_qy2 * _sx2 - _qx2 * _sy2) * den2;
									$r = txx2 > nape_Config.epsilon && txx2 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx2 = (_vy2 * _sx2 - _vx2 * _sy2) * den2;
										$r = sxx2 > nape_Config.epsilon && sxx2 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t2 = txx2;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t2 < min3) {
									min3 = t2;
									ite2 = cx_itei2;
								}
							}
							cx_itei2 = cx_itej2;
							a1 = b2;
							cx_itej2 = cx_itej2.next;
						}
						if(cx_cont2) do {
							cx_itej2 = s2.polygon.gverts.next;
							var b3 = cx_itej2;
							var t3 = 0.0;
							if((function($this) {
								var $r;
								var _sx3 = 0.0;
								var _sy3 = 0.0;
								{
									_sx3 = u.x - a1.x;
									_sy3 = u.y - a1.y;
								}
								var _vx3 = 0.0;
								var _vy3 = 0.0;
								{
									_vx3 = v3.x - u.x;
									_vy3 = v3.y - u.y;
								}
								var _qx3 = 0.0;
								var _qy3 = 0.0;
								{
									_qx3 = b3.x - a1.x;
									_qy3 = b3.y - a1.y;
								}
								var den3 = _vy3 * _qx3 - _vx3 * _qy3;
								$r = den3 * den3 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den3 = 1 / den3;
									var txx3 = (_qy3 * _sx3 - _qx3 * _sy3) * den3;
									$r = txx3 > nape_Config.epsilon && txx3 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx3 = (_vy3 * _sx3 - _vx3 * _sy3) * den3;
										$r = sxx3 > nape_Config.epsilon && sxx3 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t3 = txx3;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t3 < min3) {
									min3 = t3;
									ite2 = cx_itei2;
								}
							}
						} while(false);
						if(min3 != 2.0) {
							var cx1 = 0.0;
							var cy1 = 0.0;
							var T1 = min3;
							cx1 = u.x + (v3.x - u.x) * T1;
							cy1 = u.y + (v3.y - u.y) * T1;
							fst_vert = zpp_$nape_geom_ZPP_$Vec2.get(cx1,cy1,null);
							zpp_$nape_geom_ZPP_$Collide.flowpoly.add(fst_vert);
							poly1 = true;
							ite1 = cx_itei;
							break;
						}
					} while(false);
					cnt = 2;
				}
				while(true) if(poly1) {
					ite1 = ite1.next;
					ind11++;
					if(ite1 == null) {
						ite1 = s1.polygon.gverts.next;
						ind11 = 0;
					}
					if(!out1[ind11]) {
						var ex = ite1;
						if(fst_vert != null && zpp_$nape_geom_ZPP_$VecMath.vec_dsq(ex.x,ex.y,fst_vert.x,fst_vert.y) < nape_Config.epsilon) break;
						zpp_$nape_geom_ZPP_$Collide.flowpoly.add(ex);
						if(fst_vert == null) fst_vert = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
						cnt = 1;
					} else {
						var a2 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
						var b4 = ite1;
						var u1 = ite2;
						var itm = ite2.next;
						if(itm == null) itm = s2.polygon.gverts.next;
						var max = -1.0;
						var itmo = null;
						var indo = 0;
						var icnt = 0;
						var beg_ite = itm;
						var cx_ite4 = itm;
						do {
							var v5 = cx_ite4;
							var t4 = 0.0;
							if((function($this) {
								var $r;
								var _sx4 = 0.0;
								var _sy4 = 0.0;
								{
									_sx4 = u1.x - a2.x;
									_sy4 = u1.y - a2.y;
								}
								var _vx4 = 0.0;
								var _vy4 = 0.0;
								{
									_vx4 = v5.x - u1.x;
									_vy4 = v5.y - u1.y;
								}
								var _qx4 = 0.0;
								var _qy4 = 0.0;
								{
									_qx4 = b4.x - a2.x;
									_qy4 = b4.y - a2.y;
								}
								var den4 = _vy4 * _qx4 - _vx4 * _qy4;
								$r = den4 * den4 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den4 = 1 / den4;
									var txx4 = (_qy4 * _sx4 - _qx4 * _sy4) * den4;
									$r = txx4 > nape_Config.epsilon && txx4 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx4 = (_vy4 * _sx4 - _vx4 * _sy4) * den4;
										$r = sxx4 > nape_Config.epsilon && sxx4 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t4 = txx4;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t4 >= max) {
									itmo = ite2;
									indo = ind2;
									if(++icnt == cnt) {
										max = t4;
										cx_ite4 = beg_ite;
										break;
									} else max = t4;
								}
							}
							u1 = v5;
							ite2 = cx_ite4;
							ind2++;
							if(ind2 >= s2.polygon.edgeCnt) ind2 = 0;
							cx_ite4 = cx_ite4.next;
							if(cx_ite4 == null) cx_ite4 = s2.polygon.gverts.next;
						} while(false);
						while(cx_ite4 != beg_ite) {
							var v6 = cx_ite4;
							var t5 = 0.0;
							if((function($this) {
								var $r;
								var _sx5 = 0.0;
								var _sy5 = 0.0;
								{
									_sx5 = u1.x - a2.x;
									_sy5 = u1.y - a2.y;
								}
								var _vx5 = 0.0;
								var _vy5 = 0.0;
								{
									_vx5 = v6.x - u1.x;
									_vy5 = v6.y - u1.y;
								}
								var _qx5 = 0.0;
								var _qy5 = 0.0;
								{
									_qx5 = b4.x - a2.x;
									_qy5 = b4.y - a2.y;
								}
								var den5 = _vy5 * _qx5 - _vx5 * _qy5;
								$r = den5 * den5 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den5 = 1 / den5;
									var txx5 = (_qy5 * _sx5 - _qx5 * _sy5) * den5;
									$r = txx5 > nape_Config.epsilon && txx5 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx5 = (_vy5 * _sx5 - _vx5 * _sy5) * den5;
										$r = sxx5 > nape_Config.epsilon && sxx5 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t5 = txx5;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t5 >= max) {
									itmo = ite2;
									indo = ind2;
									if(++icnt == cnt) {
										max = t5;
										cx_ite4 = beg_ite;
										break;
									} else max = t5;
								}
							}
							u1 = v6;
							ite2 = cx_ite4;
							ind2++;
							if(ind2 >= s2.polygon.edgeCnt) ind2 = 0;
							cx_ite4 = cx_ite4.next;
							if(cx_ite4 == null) cx_ite4 = s2.polygon.gverts.next;
						}
						if(itmo == null) break;
						var u2 = itmo;
						var itm2 = itmo.next;
						if(itm2 == null) itm2 = s2.polygon.gverts.next;
						var v4 = itm2;
						var cx2 = 0.0;
						var cy2 = 0.0;
						var T2 = max;
						cx2 = u2.x + (v4.x - u2.x) * T2;
						cy2 = u2.y + (v4.y - u2.y) * T2;
						if(fst_vert != null && zpp_$nape_geom_ZPP_$VecMath.vec_dsq(cx2,cy2,fst_vert.x,fst_vert.y) < nape_Config.epsilon) break;
						zpp_$nape_geom_ZPP_$Collide.flowpoly.add(zpp_$nape_geom_ZPP_$Vec2.get(cx2,cy2,null));
						if(fst_vert == null) fst_vert = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
						ite2 = itmo;
						ind2 = indo;
						poly1 = !poly1;
						cnt = 2;
					}
				} else {
					ite2 = ite2.next;
					ind2++;
					if(ite2 == null) {
						ite2 = s2.polygon.gverts.next;
						ind2 = 0;
					}
					if(!out2[ind2]) {
						var ex1 = ite2;
						if(fst_vert != null && zpp_$nape_geom_ZPP_$VecMath.vec_dsq(ex1.x,ex1.y,fst_vert.x,fst_vert.y) < nape_Config.epsilon) break;
						zpp_$nape_geom_ZPP_$Collide.flowpoly.add(ex1);
						if(fst_vert == null) fst_vert = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
						cnt = 1;
					} else {
						var a3 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
						var b5 = ite2;
						var u3 = ite1;
						var itm1 = ite1.next;
						if(itm1 == null) itm1 = s1.polygon.gverts.next;
						var max1 = -1.0;
						var itmo1 = null;
						var indo1 = 0;
						var icnt1 = 0;
						var beg_ite1 = itm1;
						var cx_ite5 = itm1;
						do {
							var v8 = cx_ite5;
							var t6 = 0.0;
							if((function($this) {
								var $r;
								var _sx6 = 0.0;
								var _sy6 = 0.0;
								{
									_sx6 = u3.x - a3.x;
									_sy6 = u3.y - a3.y;
								}
								var _vx6 = 0.0;
								var _vy6 = 0.0;
								{
									_vx6 = v8.x - u3.x;
									_vy6 = v8.y - u3.y;
								}
								var _qx6 = 0.0;
								var _qy6 = 0.0;
								{
									_qx6 = b5.x - a3.x;
									_qy6 = b5.y - a3.y;
								}
								var den6 = _vy6 * _qx6 - _vx6 * _qy6;
								$r = den6 * den6 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den6 = 1 / den6;
									var txx6 = (_qy6 * _sx6 - _qx6 * _sy6) * den6;
									$r = txx6 > nape_Config.epsilon && txx6 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx6 = (_vy6 * _sx6 - _vx6 * _sy6) * den6;
										$r = sxx6 > nape_Config.epsilon && sxx6 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t6 = txx6;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t6 >= max1) {
									itmo1 = ite1;
									indo1 = ind11;
									if(++icnt1 == cnt) {
										max1 = t6;
										cx_ite5 = beg_ite1;
										break;
									} else max1 = t6;
								}
							}
							u3 = v8;
							ite1 = cx_ite5;
							ind11++;
							if(ind11 >= s1.polygon.edgeCnt) ind11 = 0;
							cx_ite5 = cx_ite5.next;
							if(cx_ite5 == null) cx_ite5 = s1.polygon.gverts.next;
						} while(false);
						while(cx_ite5 != beg_ite1) {
							var v9 = cx_ite5;
							var t7 = 0.0;
							if((function($this) {
								var $r;
								var _sx7 = 0.0;
								var _sy7 = 0.0;
								{
									_sx7 = u3.x - a3.x;
									_sy7 = u3.y - a3.y;
								}
								var _vx7 = 0.0;
								var _vy7 = 0.0;
								{
									_vx7 = v9.x - u3.x;
									_vy7 = v9.y - u3.y;
								}
								var _qx7 = 0.0;
								var _qy7 = 0.0;
								{
									_qx7 = b5.x - a3.x;
									_qy7 = b5.y - a3.y;
								}
								var den7 = _vy7 * _qx7 - _vx7 * _qy7;
								$r = den7 * den7 > nape_Config.epsilon * nape_Config.epsilon?(function($this) {
									var $r;
									den7 = 1 / den7;
									var txx7 = (_qy7 * _sx7 - _qx7 * _sy7) * den7;
									$r = txx7 > nape_Config.epsilon && txx7 < 1 - nape_Config.epsilon?(function($this) {
										var $r;
										var sxx7 = (_vy7 * _sx7 - _vx7 * _sy7) * den7;
										$r = sxx7 > nape_Config.epsilon && sxx7 < 1 - nape_Config.epsilon?(function($this) {
											var $r;
											t7 = txx7;
											$r = true;
											return $r;
										}($this)):false;
										return $r;
									}($this)):false;
									return $r;
								}($this)):false;
								return $r;
							}(this))) {
								if(t7 >= max1) {
									itmo1 = ite1;
									indo1 = ind11;
									if(++icnt1 == cnt) {
										max1 = t7;
										cx_ite5 = beg_ite1;
										break;
									} else max1 = t7;
								}
							}
							u3 = v9;
							ite1 = cx_ite5;
							ind11++;
							if(ind11 >= s1.polygon.edgeCnt) ind11 = 0;
							cx_ite5 = cx_ite5.next;
							if(cx_ite5 == null) cx_ite5 = s1.polygon.gverts.next;
						}
						if(itmo1 == null) break;
						var u4 = itmo1;
						var itm21 = itmo1.next;
						if(itm21 == null) itm21 = s1.polygon.gverts.next;
						var v7 = itm21;
						var cx3 = 0.0;
						var cy3 = 0.0;
						var T3 = max1;
						cx3 = u4.x + (v7.x - u4.x) * T3;
						cy3 = u4.y + (v7.y - u4.y) * T3;
						if(fst_vert != null && zpp_$nape_geom_ZPP_$VecMath.vec_dsq(cx3,cy3,fst_vert.x,fst_vert.y) < nape_Config.epsilon) break;
						zpp_$nape_geom_ZPP_$Collide.flowpoly.add(zpp_$nape_geom_ZPP_$Vec2.get(cx3,cy3,null));
						if(fst_vert == null) fst_vert = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
						ite1 = itmo1;
						ind11 = indo1;
						poly1 = !poly1;
						cnt = 2;
					}
				}
				if(zpp_$nape_geom_ZPP_$Collide.flowpoly.head != null && zpp_$nape_geom_ZPP_$Collide.flowpoly.head.next != null && zpp_$nape_geom_ZPP_$Collide.flowpoly.head.next.next != null) {
					var area = 0.0;
					var COMx = 0.0;
					var COMy = 0.0;
					COMx = 0;
					COMy = 0;
					area = 0.0;
					var cx_ite6 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head;
					var u5 = cx_ite6.elt;
					cx_ite6 = cx_ite6.next;
					var v10 = cx_ite6.elt;
					cx_ite6 = cx_ite6.next;
					while(cx_ite6 != null) {
						var w2 = cx_ite6.elt;
						area += v10.x * (w2.y - u5.y);
						var cf = w2.y * v10.x - w2.x * v10.y;
						COMx += (v10.x + w2.x) * cf;
						COMy += (v10.y + w2.y) * cf;
						u5 = v10;
						v10 = w2;
						cx_ite6 = cx_ite6.next;
					}
					cx_ite6 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head;
					var w = cx_ite6.elt;
					area += v10.x * (w.y - u5.y);
					var cf1 = w.y * v10.x - w.x * v10.y;
					COMx += (v10.x + w.x) * cf1;
					COMy += (v10.y + w.y) * cf1;
					u5 = v10;
					v10 = w;
					cx_ite6 = cx_ite6.next;
					var w1 = cx_ite6.elt;
					area += v10.x * (w1.y - u5.y);
					var cf2 = w1.y * v10.x - w1.x * v10.y;
					COMx += (v10.x + w1.x) * cf2;
					COMy += (v10.y + w1.y) * cf2;
					area *= 0.5;
					var ia = 1 / (6 * area);
					var t8 = ia;
					COMx *= t8;
					COMy *= t8;
					arb.overlap = -area;
					arb.centroidx = COMx;
					arb.centroidy = COMy;
					null;
					return true;
				} else return false;
			} else return false;
		} else return false;
	} else {
		var inte = [];
		var total1 = true;
		var a0 = null;
		var vi = null;
		var max2 = -1e+100;
		var cont1 = true;
		var vite = s2.polygon.gverts.next;
		var ind3 = 0;
		var cx_ite7 = s2.polygon.edges.head;
		while(cx_ite7 != null) {
			var a4 = cx_ite7.elt;
			var dist = a4.gnormx * s1.circle.worldCOMx + a4.gnormy * s1.circle.worldCOMy;
			if(dist > a4.gprojection + s1.circle.radius) {
				cont1 = false;
				break;
			} else if(dist + s1.circle.radius > a4.gprojection + nape_Config.epsilon) {
				total1 = false;
				inte[ind3] = true;
			}
			dist -= a4.gprojection + s1.circle.radius;
			if(dist > max2) {
				max2 = dist;
				a0 = a4;
				vi = vite;
			}
			vite = vite.next;
			ind3++;
			cx_ite7 = cx_ite7.next;
		}
		if(cont1) {
			if(total1) {
				arb.overlap = s1.circle.area;
				arb.centroidx = s1.circle.worldCOMx;
				arb.centroidy = s1.circle.worldCOMy;
				null;
				return true;
			} else {
				var v0 = vi;
				var v11;
				if(vi.next == null) v11 = s2.polygon.gverts.next; else v11 = vi.next;
				var dt = s1.circle.worldCOMy * a0.gnormx - s1.circle.worldCOMx * a0.gnormy;
				if(dt <= v0.y * a0.gnormx - v0.x * a0.gnormy?(function($this) {
					var $r;
					var minDist = s1.circle.radius;
					var px = 0.0;
					var py = 0.0;
					{
						px = v0.x - s1.circle.worldCOMx;
						py = v0.y - s1.circle.worldCOMy;
					}
					var distSqr = px * px + py * py;
					$r = distSqr <= minDist * minDist;
					return $r;
				}(this)):dt >= v11.y * a0.gnormx - v11.x * a0.gnormy?(function($this) {
					var $r;
					var minDist1 = s1.circle.radius;
					var px1 = 0.0;
					var py1 = 0.0;
					{
						px1 = v11.x - s1.circle.worldCOMx;
						py1 = v11.y - s1.circle.worldCOMy;
					}
					var distSqr1 = px1 * px1 + py1 * py1;
					$r = distSqr1 <= minDist1 * minDist1;
					return $r;
				}(this)):true) {
					var ins = [];
					var ind4 = 0;
					var total2 = true;
					var vi1 = null;
					var vind = 0;
					var cx_ite8 = s2.polygon.gverts.next;
					while(cx_ite8 != null) {
						var v12 = cx_ite8;
						var dist1 = zpp_$nape_geom_ZPP_$VecMath.vec_dsq(v12.x,v12.y,s1.circle.worldCOMx,s1.circle.worldCOMy);
						if(!(ins[ind4] = dist1 <= s1.circle.radius * s1.circle.radius)) total2 = false; else {
							vind = ind4;
							vi1 = cx_ite8;
						}
						ind4++;
						cx_ite8 = cx_ite8.next;
					}
					if(total2) {
						s2.polygon.validate_worldCOM();
						arb.overlap = s2.polygon.area;
						arb.centroidx = s2.polygon.worldCOMx;
						arb.centroidy = s2.polygon.worldCOMy;
						null;
						return true;
					} else {
						while(!(zpp_$nape_geom_ZPP_$Collide.flowpoly.head == null)) {
							var p1 = zpp_$nape_geom_ZPP_$Collide.flowpoly.pop_unsafe();
							if(!p1._inuse) {
								var o1 = p1;
								if(o1.outer != null) {
									o1.outer.zpp_inner = null;
									o1.outer = null;
								}
								o1._isimmutable = null;
								o1._validate = null;
								o1._invalidate = null;
								o1.next = zpp_$nape_geom_ZPP_$Vec2.zpp_pool;
								zpp_$nape_geom_ZPP_$Vec2.zpp_pool = o1;
							}
						}
						zpp_$nape_geom_ZPP_$Collide.flowsegs.clear();
						var fst_vert1 = null;
						var state = 1;
						if(vi1 == null) {
							vi1 = s2.polygon.gverts.next;
							state = 2;
						} else zpp_$nape_geom_ZPP_$Collide.flowpoly.add(fst_vert1 = vi1);
						while(state != 0) if(state == 1) {
							vi1 = vi1.next;
							if(vi1 == null) vi1 = s2.polygon.gverts.next;
							vind++;
							if(vind >= s2.polygon.edgeCnt) vind = 0;
							if(ins[vind]) {
								if(zpp_$nape_geom_ZPP_$VecMath.vec_dsq(fst_vert1.x,fst_vert1.y,vi1.x,vi1.y) < nape_Config.epsilon) break;
								zpp_$nape_geom_ZPP_$Collide.flowpoly.add(vi1);
							} else {
								var u6 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
								var v13 = vi1;
								var tval;
								var vx = 0.0;
								var vy = 0.0;
								vx = v13.x - u6.x;
								vy = v13.y - u6.y;
								var qx = 0.0;
								var qy = 0.0;
								qx = u6.x - s1.circle.worldCOMx;
								qy = u6.y - s1.circle.worldCOMy;
								var A = vx * vx + vy * vy;
								var B = 2 * (qx * vx + qy * vy);
								var C = qx * qx + qy * qy - s1.circle.radius * s1.circle.radius;
								var D = Math.sqrt(B * B - 4 * A * C);
								A = 1 / (2 * A);
								var t9 = (-B - D) * A;
								if(t9 < nape_Config.epsilon) tval = (-B + D) * A; else tval = t9;
								var cx4 = 0.0;
								var cy4 = 0.0;
								var T4 = tval;
								cx4 = u6.x + (v13.x - u6.x) * T4;
								cy4 = u6.y + (v13.y - u6.y) * T4;
								if(zpp_$nape_geom_ZPP_$VecMath.vec_dsq(fst_vert1.x,fst_vert1.y,cx4,cy4) < nape_Config.epsilon) break;
								zpp_$nape_geom_ZPP_$Collide.flowpoly.add(zpp_$nape_geom_ZPP_$Vec2.get(cx4,cy4,null));
								state = 2;
							}
						} else if(state == 2) {
							var vi2 = vi1.next;
							if(vi2 == null) vi2 = s2.polygon.gverts.next;
							var u7 = vi1;
							state = 0;
							var beg_ite2 = vi2;
							var cx_ite9 = vi2;
							do {
								var v14 = cx_ite9;
								var vind2 = vind + 1;
								if(vind2 == s2.polygon.edgeCnt) vind2 = 0;
								if(inte[vind]) {
									if(ins[vind2]) {
										var tval1;
										var vx1 = 0.0;
										var vy1 = 0.0;
										vx1 = v14.x - u7.x;
										vy1 = v14.y - u7.y;
										var qx1 = 0.0;
										var qy1 = 0.0;
										qx1 = u7.x - s1.circle.worldCOMx;
										qy1 = u7.y - s1.circle.worldCOMy;
										var A1 = vx1 * vx1 + vy1 * vy1;
										var B1 = 2 * (qx1 * vx1 + qy1 * vy1);
										var C1 = qx1 * qx1 + qy1 * qy1 - s1.circle.radius * s1.circle.radius;
										var D1 = Math.sqrt(B1 * B1 - 4 * A1 * C1);
										A1 = 1 / (2 * A1);
										var t10 = (-B1 - D1) * A1;
										if(t10 < nape_Config.epsilon) tval1 = (-B1 + D1) * A1; else tval1 = t10;
										var cx5 = 0.0;
										var cy5 = 0.0;
										var T5 = tval1;
										cx5 = u7.x + (v14.x - u7.x) * T5;
										cy5 = u7.y + (v14.y - u7.y) * T5;
										if(zpp_$nape_geom_ZPP_$VecMath.vec_dsq(fst_vert1.x,fst_vert1.y,cx5,cy5) < nape_Config.epsilon) {
											state = 0;
											cx_ite9 = beg_ite2;
											break;
										}
										var cp = zpp_$nape_geom_ZPP_$Vec2.get(cx5,cy5,null);
										zpp_$nape_geom_ZPP_$Collide.flowsegs.add(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt);
										zpp_$nape_geom_ZPP_$Collide.flowsegs.add(cp);
										zpp_$nape_geom_ZPP_$Collide.flowpoly.add(cp);
										state = 1;
										cx_ite9 = beg_ite2;
										break;
									} else {
										var t0 = 0.0;
										var t11 = 0.0;
										var two;
										var vx2 = 0.0;
										var vy2 = 0.0;
										vx2 = v14.x - u7.x;
										vy2 = v14.y - u7.y;
										var qx2 = 0.0;
										var qy2 = 0.0;
										qx2 = u7.x - s1.circle.worldCOMx;
										qy2 = u7.y - s1.circle.worldCOMy;
										var A2 = vx2 * vx2 + vy2 * vy2;
										var B2 = 2 * (qx2 * vx2 + qy2 * vy2);
										var C2 = qx2 * qx2 + qy2 * qy2 - s1.circle.radius * s1.circle.radius;
										var D2 = B2 * B2 - 4 * A2 * C2;
										if(D2 * D2 < nape_Config.epsilon) {
											if(D2 < 0) t0 = 10.0; else t0 = t11 = -B2 / (2 * A2);
											two = false;
										} else {
											D2 = Math.sqrt(D2);
											A2 = 1 / (2 * A2);
											t0 = (-B2 - D2) * A2;
											t11 = (-B2 + D2) * A2;
											two = true;
										}
										if(t0 < 1 - nape_Config.epsilon && t11 > nape_Config.epsilon) {
											var cx6 = 0.0;
											var cy6 = 0.0;
											var T6 = t0;
											cx6 = u7.x + (v14.x - u7.x) * T6;
											cy6 = u7.y + (v14.y - u7.y) * T6;
											if(fst_vert1 != null && zpp_$nape_geom_ZPP_$VecMath.vec_dsq(fst_vert1.x,fst_vert1.y,cx6,cy6) < nape_Config.epsilon) {
												state = 0;
												cx_ite9 = beg_ite2;
												break;
											}
											var cp1 = zpp_$nape_geom_ZPP_$Vec2.get(cx6,cy6,null);
											if(!(zpp_$nape_geom_ZPP_$Collide.flowpoly.head == null)) {
												zpp_$nape_geom_ZPP_$Collide.flowsegs.add(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt);
												zpp_$nape_geom_ZPP_$Collide.flowsegs.add(cp1);
											}
											zpp_$nape_geom_ZPP_$Collide.flowpoly.add(cp1);
											if(fst_vert1 == null) fst_vert1 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
											if(two) {
												var cx7 = 0.0;
												var cy7 = 0.0;
												var T7 = t11;
												cx7 = u7.x + (v14.x - u7.x) * T7;
												cy7 = u7.y + (v14.y - u7.y) * T7;
												zpp_$nape_geom_ZPP_$Collide.flowpoly.add(zpp_$nape_geom_ZPP_$Vec2.get(cx7,cy7,null));
											}
										}
									}
								}
								u7 = v14;
								vi1 = cx_ite9;
								vind = vind2;
								cx_ite9 = cx_ite9.next;
								if(cx_ite9 == null) cx_ite9 = s2.polygon.gverts.next;
							} while(false);
							while(cx_ite9 != beg_ite2) {
								var v15 = cx_ite9;
								var vind21 = vind + 1;
								if(vind21 == s2.polygon.edgeCnt) vind21 = 0;
								if(inte[vind]) {
									if(ins[vind21]) {
										var tval2;
										var vx3 = 0.0;
										var vy3 = 0.0;
										vx3 = v15.x - u7.x;
										vy3 = v15.y - u7.y;
										var qx3 = 0.0;
										var qy3 = 0.0;
										qx3 = u7.x - s1.circle.worldCOMx;
										qy3 = u7.y - s1.circle.worldCOMy;
										var A3 = vx3 * vx3 + vy3 * vy3;
										var B3 = 2 * (qx3 * vx3 + qy3 * vy3);
										var C3 = qx3 * qx3 + qy3 * qy3 - s1.circle.radius * s1.circle.radius;
										var D3 = Math.sqrt(B3 * B3 - 4 * A3 * C3);
										A3 = 1 / (2 * A3);
										var t12 = (-B3 - D3) * A3;
										if(t12 < nape_Config.epsilon) tval2 = (-B3 + D3) * A3; else tval2 = t12;
										var cx8 = 0.0;
										var cy8 = 0.0;
										var T8 = tval2;
										cx8 = u7.x + (v15.x - u7.x) * T8;
										cy8 = u7.y + (v15.y - u7.y) * T8;
										if(zpp_$nape_geom_ZPP_$VecMath.vec_dsq(fst_vert1.x,fst_vert1.y,cx8,cy8) < nape_Config.epsilon) {
											state = 0;
											cx_ite9 = beg_ite2;
											break;
										}
										var cp2 = zpp_$nape_geom_ZPP_$Vec2.get(cx8,cy8,null);
										zpp_$nape_geom_ZPP_$Collide.flowsegs.add(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt);
										zpp_$nape_geom_ZPP_$Collide.flowsegs.add(cp2);
										zpp_$nape_geom_ZPP_$Collide.flowpoly.add(cp2);
										state = 1;
										cx_ite9 = beg_ite2;
										break;
									} else {
										var t01 = 0.0;
										var t13 = 0.0;
										var two1;
										var vx4 = 0.0;
										var vy4 = 0.0;
										vx4 = v15.x - u7.x;
										vy4 = v15.y - u7.y;
										var qx4 = 0.0;
										var qy4 = 0.0;
										qx4 = u7.x - s1.circle.worldCOMx;
										qy4 = u7.y - s1.circle.worldCOMy;
										var A4 = vx4 * vx4 + vy4 * vy4;
										var B4 = 2 * (qx4 * vx4 + qy4 * vy4);
										var C4 = qx4 * qx4 + qy4 * qy4 - s1.circle.radius * s1.circle.radius;
										var D4 = B4 * B4 - 4 * A4 * C4;
										if(D4 * D4 < nape_Config.epsilon) {
											if(D4 < 0) t01 = 10.0; else t01 = t13 = -B4 / (2 * A4);
											two1 = false;
										} else {
											D4 = Math.sqrt(D4);
											A4 = 1 / (2 * A4);
											t01 = (-B4 - D4) * A4;
											t13 = (-B4 + D4) * A4;
											two1 = true;
										}
										if(t01 < 1 - nape_Config.epsilon && t13 > nape_Config.epsilon) {
											var cx9 = 0.0;
											var cy9 = 0.0;
											var T9 = t01;
											cx9 = u7.x + (v15.x - u7.x) * T9;
											cy9 = u7.y + (v15.y - u7.y) * T9;
											if(fst_vert1 != null && zpp_$nape_geom_ZPP_$VecMath.vec_dsq(fst_vert1.x,fst_vert1.y,cx9,cy9) < nape_Config.epsilon) {
												state = 0;
												cx_ite9 = beg_ite2;
												break;
											}
											var cp3 = zpp_$nape_geom_ZPP_$Vec2.get(cx9,cy9,null);
											if(!(zpp_$nape_geom_ZPP_$Collide.flowpoly.head == null)) {
												zpp_$nape_geom_ZPP_$Collide.flowsegs.add(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt);
												zpp_$nape_geom_ZPP_$Collide.flowsegs.add(cp3);
											}
											zpp_$nape_geom_ZPP_$Collide.flowpoly.add(cp3);
											if(fst_vert1 == null) fst_vert1 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt;
											if(two1) {
												var cx10 = 0.0;
												var cy10 = 0.0;
												var T10 = t13;
												cx10 = u7.x + (v15.x - u7.x) * T10;
												cy10 = u7.y + (v15.y - u7.y) * T10;
												zpp_$nape_geom_ZPP_$Collide.flowpoly.add(zpp_$nape_geom_ZPP_$Vec2.get(cx10,cy10,null));
											}
										}
									}
								}
								u7 = v15;
								vi1 = cx_ite9;
								vind = vind21;
								cx_ite9 = cx_ite9.next;
								if(cx_ite9 == null) cx_ite9 = s2.polygon.gverts.next;
							}
						}
						if(zpp_$nape_geom_ZPP_$Collide.flowpoly.head == null) return false; else if(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.next == null) {
							var all = true;
							var cx_ite10 = s2.polygon.edges.head;
							while(cx_ite10 != null) {
								var e = cx_ite10.elt;
								var dist2 = e.gnormx * s1.circle.worldCOMx + e.gnormy * s1.circle.worldCOMy;
								if(dist2 > e.gprojection) {
									all = false;
									break;
								}
								cx_ite10 = cx_ite10.next;
							}
							if(all) {
								arb.overlap = s1.circle.area;
								arb.centroidx = s1.circle.worldCOMx;
								arb.centroidy = s1.circle.worldCOMy;
								null;
								return true;
							} else return false;
						} else {
							var COMx1 = 0;
							var COMy1 = 0;
							var area1 = 0.0;
							if(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.next.next != null) {
								var parea = 0.0;
								var pCOMx = 0.0;
								var pCOMy = 0.0;
								pCOMx = 0;
								pCOMy = 0;
								parea = 0.0;
								var cx_ite11 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head;
								var u8 = cx_ite11.elt;
								cx_ite11 = cx_ite11.next;
								var v16 = cx_ite11.elt;
								cx_ite11 = cx_ite11.next;
								while(cx_ite11 != null) {
									var w5 = cx_ite11.elt;
									parea += v16.x * (w5.y - u8.y);
									var cf3 = w5.y * v16.x - w5.x * v16.y;
									pCOMx += (v16.x + w5.x) * cf3;
									pCOMy += (v16.y + w5.y) * cf3;
									u8 = v16;
									v16 = w5;
									cx_ite11 = cx_ite11.next;
								}
								cx_ite11 = zpp_$nape_geom_ZPP_$Collide.flowpoly.head;
								var w3 = cx_ite11.elt;
								parea += v16.x * (w3.y - u8.y);
								var cf4 = w3.y * v16.x - w3.x * v16.y;
								pCOMx += (v16.x + w3.x) * cf4;
								pCOMy += (v16.y + w3.y) * cf4;
								u8 = v16;
								v16 = w3;
								cx_ite11 = cx_ite11.next;
								var w4 = cx_ite11.elt;
								parea += v16.x * (w4.y - u8.y);
								var cf5 = w4.y * v16.x - w4.x * v16.y;
								pCOMx += (v16.x + w4.x) * cf5;
								pCOMy += (v16.y + w4.y) * cf5;
								parea *= 0.5;
								var ia1 = 1 / (6 * parea);
								var t14 = ia1;
								pCOMx *= t14;
								pCOMy *= t14;
								var t15 = -parea;
								COMx1 += pCOMx * t15;
								COMy1 += pCOMy * t15;
								area1 -= parea;
							} else {
								zpp_$nape_geom_ZPP_$Collide.flowsegs.add(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.elt);
								zpp_$nape_geom_ZPP_$Collide.flowsegs.add(zpp_$nape_geom_ZPP_$Collide.flowpoly.head.next.elt);
							}
							while(!(zpp_$nape_geom_ZPP_$Collide.flowsegs.head == null)) {
								var u9 = zpp_$nape_geom_ZPP_$Collide.flowsegs.pop_unsafe();
								var v17 = zpp_$nape_geom_ZPP_$Collide.flowsegs.pop_unsafe();
								var dx = 0.0;
								var dy = 0.0;
								dx = v17.x - u9.x;
								dy = v17.y - u9.y;
								var nx = 0.0;
								var ny = 0.0;
								nx = dx;
								ny = dy;
								var d = nx * nx + ny * ny;
								var imag = 1.0 / Math.sqrt(d);
								var t16 = imag;
								nx *= t16;
								ny *= t16;
								var t17 = nx;
								nx = -ny;
								ny = t17;
								var cx11 = 0.0;
								var cy11 = 0.0;
								cx11 = u9.x + v17.x;
								cy11 = u9.y + v17.y;
								var t18 = 0.5;
								cx11 *= t18;
								cy11 *= t18;
								var t19 = 1.0;
								cx11 -= s1.circle.worldCOMx * t19;
								cy11 -= s1.circle.worldCOMy * t19;
								var xd = nx * cx11 + ny * cy11;
								var carea = 0.0;
								var ccom = 0.0;
								var X = xd;
								var cos = X / s1.circle.radius;
								var sin = Math.sqrt(1 - cos * cos);
								var theta = Math.acos(cos);
								carea = s1.circle.radius * (s1.circle.radius * theta - X * sin);
								ccom = 0.66666666666666663 * s1.circle.radius * sin * sin * sin / (theta - cos * sin);
								cx11 = s1.circle.worldCOMx;
								cy11 = s1.circle.worldCOMy;
								var t20 = ccom;
								cx11 += nx * t20;
								cy11 += ny * t20;
								var t21 = carea;
								COMx1 += cx11 * t21;
								COMy1 += cy11 * t21;
								area1 += carea;
							}
							var t22 = 1.0 / area1;
							COMx1 *= t22;
							COMy1 *= t22;
							arb.overlap = area1;
							arb.centroidx = COMx1;
							arb.centroidy = COMy1;
							null;
							return true;
						}
					}
				} else return false;
			}
		} else return false;
	} else {
		var c1 = s1.circle;
		var c2 = s2.circle;
		var deltax = 0.0;
		var deltay = 0.0;
		deltax = c2.worldCOMx - c1.worldCOMx;
		deltay = c2.worldCOMy - c1.worldCOMy;
		var cr = c1.radius + c2.radius;
		var ds = deltax * deltax + deltay * deltay;
		if(ds > cr * cr) return false; else if(ds < nape_Config.epsilon * nape_Config.epsilon) {
			if(c1.radius < c2.radius) {
				arb.overlap = c1.area;
				arb.centroidx = c1.worldCOMx;
				arb.centroidy = c1.worldCOMy;
				null;
			} else {
				arb.overlap = c2.area;
				arb.centroidx = c2.worldCOMx;
				arb.centroidy = c2.worldCOMy;
				null;
			}
			return true;
		} else {
			var d1 = Math.sqrt(ds);
			var id = 1 / d1;
			var x1 = 0.5 * (d1 - (c2.radius * c2.radius - c1.radius * c1.radius) * id);
			if(x1 <= -c1.radius) {
				arb.overlap = c1.area;
				arb.centroidx = c1.worldCOMx;
				arb.centroidy = c1.worldCOMy;
				null;
			} else {
				var x2 = d1 - x1;
				if(x2 <= -c2.radius) {
					arb.overlap = c2.area;
					arb.centroidx = c2.worldCOMx;
					arb.centroidy = c2.worldCOMy;
					null;
				} else {
					var area11 = 0.0;
					var y1 = 0.0;
					var area2 = 0.0;
					var y2 = 0.0;
					var X1 = x1;
					var cos1 = X1 / c1.radius;
					var sin1 = Math.sqrt(1 - cos1 * cos1);
					var theta1 = Math.acos(cos1);
					area11 = c1.radius * (c1.radius * theta1 - X1 * sin1);
					y1 = 0.66666666666666663 * c1.radius * sin1 * sin1 * sin1 / (theta1 - cos1 * sin1);
					var X2 = x2;
					var cos2 = X2 / c2.radius;
					var sin2 = Math.sqrt(1 - cos2 * cos2);
					var theta2 = Math.acos(cos2);
					area2 = c2.radius * (c2.radius * theta2 - X2 * sin2);
					y2 = 0.66666666666666663 * c2.radius * sin2 * sin2 * sin2 / (theta2 - cos2 * sin2);
					var tarea = area11 + area2;
					var ya = (y1 * area11 + (d1 - y2) * area2) / tarea * id;
					arb.overlap = tarea;
					arb.centroidx = c1.worldCOMx + deltax * ya;
					arb.centroidy = c1.worldCOMy + deltay * ya;
					null;
				}
			}
			return true;
		}
	}
};
var zpp_$nape_geom_ZPP_$ConvexRayResult = function() {
	this.toiDistance = 0.0;
	this.next = null;
	this.inner = false;
	this.shape = null;
};
zpp_$nape_geom_ZPP_$ConvexRayResult.__name__ = true;
zpp_$nape_geom_ZPP_$ConvexRayResult.prototype = {
	__class__: zpp_$nape_geom_ZPP_$ConvexRayResult
};
var zpp_$nape_geom_ZPP_$GeomVert = function() {
	this.next = null;
	this.y = 0.0;
	this.x = 0.0;
};
zpp_$nape_geom_ZPP_$GeomVert.__name__ = true;
zpp_$nape_geom_ZPP_$GeomVert.prototype = {
	__class__: zpp_$nape_geom_ZPP_$GeomVert
};
var zpp_$nape_geom_ZPP_$GeomPoly = function() {
	this.vertices = null;
	this.outer = null;
};
zpp_$nape_geom_ZPP_$GeomPoly.__name__ = true;
zpp_$nape_geom_ZPP_$GeomPoly.prototype = {
	__class__: zpp_$nape_geom_ZPP_$GeomPoly
};
var zpp_$nape_geom_ZPP_$Mat23 = function() {
	this.ty = 0.0;
	this.tx = 0.0;
	this.d = 0.0;
	this.c = 0.0;
	this.b = 0.0;
	this.a = 0.0;
};
zpp_$nape_geom_ZPP_$Mat23.__name__ = true;
zpp_$nape_geom_ZPP_$Mat23.prototype = {
	__class__: zpp_$nape_geom_ZPP_$Mat23
};
var zpp_$nape_geom_ZPP_$MatMN = function() {
	this.x = null;
	this.n = 0;
	this.m = 0;
};
zpp_$nape_geom_ZPP_$MatMN.__name__ = true;
zpp_$nape_geom_ZPP_$MatMN.prototype = {
	__class__: zpp_$nape_geom_ZPP_$MatMN
};
var zpp_$nape_geom_ZPP_$ToiEvent = function() {
	this.kinematic = false;
	this.failed = false;
	this.slipped = false;
	this.axis = null;
	this.c2 = null;
	this.c1 = null;
	this.frozen2 = false;
	this.frozen1 = false;
	this.arbiter = null;
	this.s2 = null;
	this.s1 = null;
	this.toi = 0.0;
	this.next = null;
	this.c1 = new zpp_$nape_geom_ZPP_$Vec2();
	this.c2 = new zpp_$nape_geom_ZPP_$Vec2();
	this.axis = new zpp_$nape_geom_ZPP_$Vec2();
};
zpp_$nape_geom_ZPP_$ToiEvent.__name__ = true;
zpp_$nape_geom_ZPP_$ToiEvent.prototype = {
	__class__: zpp_$nape_geom_ZPP_$ToiEvent
};
var zpp_$nape_geom_ZPP_$SweepDistance = function() { };
zpp_$nape_geom_ZPP_$SweepDistance.__name__ = true;
zpp_$nape_geom_ZPP_$SweepDistance.dynamicSweep = function(toi,timeStep,lowerBound,negRadius,userAPI) {
	if(userAPI == null) userAPI = false;
	var s1 = toi.s1;
	var s2 = toi.s2;
	var b1 = s1.body;
	var b2 = s2.body;
	var deltax = 0.0;
	var deltay = 0.0;
	deltax = b2.velx - b1.velx;
	deltay = b2.vely - b1.vely;
	var ang1 = b1.angvel;
	if(ang1 < 0) ang1 = -ang1;
	var ang2 = b2.angvel;
	if(ang2 < 0) ang2 = -ang2;
	var angBias = s1.sweepCoef * ang1 + s2.sweepCoef * ang2;
	if(!userAPI && !toi.kinematic && deltax * deltax + deltay * deltay < nape_Config.dynamicSweepLinearThreshold * nape_Config.dynamicSweepLinearThreshold && angBias < nape_Config.dynamicSweepAngularThreshold) {
		toi.toi = -1;
		toi.failed = true;
		return;
	}
	var c1 = toi.c1;
	var c2 = toi.c2;
	var axis = toi.axis;
	var curTOI = lowerBound;
	var curIter = 0;
	while(true) {
		b1.sweepIntegrate(curTOI * timeStep);
		b1.sweepValidate(s1);
		b2.sweepIntegrate(curTOI * timeStep);
		b2.sweepValidate(s2);
		var sep = zpp_$nape_geom_ZPP_$SweepDistance.distance(s1,s2,c1,c2,axis,null) + negRadius;
		var dot = deltax * axis.x + deltay * axis.y;
		if(sep < nape_Config.distanceThresholdCCD) {
			if(userAPI) break;
			var d1x = 0.0;
			var d1y = 0.0;
			d1x = c1.x - b1.posx;
			d1y = c1.y - b1.posy;
			var d2x = 0.0;
			var d2y = 0.0;
			d2x = c2.x - b2.posx;
			d2y = c2.y - b2.posy;
			var proj = dot - b1.sweep_angvel * (axis.y * d1x - axis.x * d1y) + b2.sweep_angvel * (axis.y * d2x - axis.x * d2y);
			if(proj > 0) toi.slipped = true;
			if(proj <= 0 || sep < nape_Config.distanceThresholdCCD * 0.5) break;
		}
		var denom = (angBias - dot) * timeStep;
		if(denom <= 0) {
			curTOI = -1;
			break;
		}
		var delta = sep / denom;
		if(delta < 1e-6) delta = 1e-6;
		curTOI += delta;
		if(curTOI >= 1) {
			curTOI = 1;
			b1.sweepIntegrate(curTOI * timeStep);
			b1.sweepValidate(s1);
			b2.sweepIntegrate(curTOI * timeStep);
			b2.sweepValidate(s2);
			var sep1 = zpp_$nape_geom_ZPP_$SweepDistance.distance(s1,s2,c1,c2,axis,null) + negRadius;
			var dot1 = deltax * axis.x + deltay * axis.y;
			if(sep1 < nape_Config.distanceThresholdCCD) {
				if(userAPI) break;
				var d1x1 = 0.0;
				var d1y1 = 0.0;
				d1x1 = c1.x - b1.posx;
				d1y1 = c1.y - b1.posy;
				var d2x1 = 0.0;
				var d2y1 = 0.0;
				d2x1 = c2.x - b2.posx;
				d2y1 = c2.y - b2.posy;
				var proj1 = dot1 - b1.sweep_angvel * (axis.y * d1x1 - axis.x * d1y1) + b2.sweep_angvel * (axis.y * d2x1 - axis.x * d2y1);
				if(proj1 > 0) toi.slipped = true;
				if(proj1 <= 0 || sep1 < nape_Config.distanceThresholdCCD * 0.5) break;
			}
			curTOI = -1;
			break;
		}
		if(++curIter >= 40) {
			if(sep > negRadius) toi.failed = true;
			break;
		}
	}
	toi.toi = curTOI;
};
zpp_$nape_geom_ZPP_$SweepDistance.staticSweep = function(toi,timeStep,lowerBound,negRadius) {
	var s1 = toi.s1;
	var s2 = toi.s2;
	var b1 = s1.body;
	var b2 = s2.body;
	var deltax = 0.0;
	var deltay = 0.0;
	deltax = -b1.velx;
	deltay = -b1.vely;
	var ang1 = b1.sweep_angvel;
	if(ang1 < 0) ang1 = -ang1;
	var angBias = s1.sweepCoef * ang1;
	var c1 = toi.c1;
	var c2 = toi.c2;
	var axis = toi.axis;
	var curTOI = lowerBound;
	var curIter = 0;
	while(true) {
		b1.sweepIntegrate(curTOI * timeStep);
		b1.sweepValidate(s1);
		var sep = zpp_$nape_geom_ZPP_$SweepDistance.distance(s1,s2,c1,c2,axis,null) + negRadius;
		var dot = deltax * axis.x + deltay * axis.y;
		if(sep < nape_Config.distanceThresholdCCD) {
			var d1x = 0.0;
			var d1y = 0.0;
			d1x = c1.x - b1.posx;
			d1y = c1.y - b1.posy;
			var proj = dot - b1.sweep_angvel * (axis.y * d1x - axis.x * d1y);
			if(proj > 0) toi.slipped = true;
			if(proj <= 0 || sep < nape_Config.distanceThresholdCCD * 0.5) break;
		}
		var denom = (angBias - dot) * timeStep;
		if(denom <= 0) {
			curTOI = -1;
			break;
		}
		var delta = sep / denom;
		if(delta < 1e-6) delta = 1e-6;
		curTOI += delta;
		if(curTOI >= 1) {
			curTOI = 1;
			b1.sweepIntegrate(curTOI * timeStep);
			b1.sweepValidate(s1);
			var sep1 = zpp_$nape_geom_ZPP_$SweepDistance.distance(s1,s2,c1,c2,axis,null) + negRadius;
			var dot1 = deltax * axis.x + deltay * axis.y;
			if(sep1 < nape_Config.distanceThresholdCCD) {
				var d1x1 = 0.0;
				var d1y1 = 0.0;
				d1x1 = c1.x - b1.posx;
				d1y1 = c1.y - b1.posy;
				var proj1 = dot1 - b1.sweep_angvel * (axis.y * d1x1 - axis.x * d1y1);
				if(proj1 > 0) toi.slipped = true;
				if(proj1 <= 0 || sep1 < nape_Config.distanceThresholdCCD * 0.5) break;
			}
			curTOI = -1;
			break;
		}
		if(++curIter >= 40) {
			if(sep > negRadius) toi.failed = true;
			break;
		}
	}
	toi.toi = curTOI;
};
zpp_$nape_geom_ZPP_$SweepDistance.distance = function(s1,s2,w1,w2,axis,upperBound) {
	if(upperBound == null) upperBound = 1e100;
	if(s1.type == 0 && s2.type == 0) {
		var c1 = s1.circle;
		var c2 = s2.circle;
		var dist;
		var nx = 0.0;
		var ny = 0.0;
		nx = c2.worldCOMx - c1.worldCOMx;
		ny = c2.worldCOMy - c1.worldCOMy;
		var len = Math.sqrt(nx * nx + ny * ny);
		dist = len - (c1.radius + c2.radius);
		if(dist < upperBound) {
			if(len == 0) {
				nx = 1;
				ny = 0;
			} else {
				var t = 1.0 / len;
				nx *= t;
				ny *= t;
			}
			var t1 = c1.radius;
			w1.x = c1.worldCOMx + nx * t1;
			w1.y = c1.worldCOMy + ny * t1;
			var t2 = -c2.radius;
			w2.x = c2.worldCOMx + nx * t2;
			w2.y = c2.worldCOMy + ny * t2;
			axis.x = nx;
			axis.y = ny;
		}
		return dist;
	} else {
		var swapped = false;
		if(s1.type == 0 && s2.type == 1) {
			var tmp = s1;
			s1 = s2;
			s2 = tmp;
			var tmp2 = w1;
			w1 = w2;
			w2 = tmp2;
			swapped = true;
		}
		if(s1.type == 1 && s2.type == 0) {
			var poly = s1.polygon;
			var circle = s2.circle;
			var best = -1e+100;
			var a0 = null;
			var cx_ite = poly.edges.head;
			while(cx_ite != null) {
				var a = cx_ite.elt;
				var dist1 = a.gnormx * circle.worldCOMx + a.gnormy * circle.worldCOMy - a.gprojection - circle.radius;
				if(dist1 > upperBound) {
					best = dist1;
					break;
				}
				if(dist1 > 0) {
					if(dist1 > best) {
						best = dist1;
						a0 = a;
					}
				} else if(best < 0 && dist1 > best) {
					best = dist1;
					a0 = a;
				}
				cx_ite = cx_ite.next;
			}
			if(best < upperBound) {
				var v0 = a0.gp0;
				var v1 = a0.gp1;
				var dt = circle.worldCOMy * a0.gnormx - circle.worldCOMx * a0.gnormy;
				if(dt <= v0.y * a0.gnormx - v0.x * a0.gnormy) {
					var nx1 = 0.0;
					var ny1 = 0.0;
					nx1 = circle.worldCOMx - v0.x;
					ny1 = circle.worldCOMy - v0.y;
					var len1 = Math.sqrt(nx1 * nx1 + ny1 * ny1);
					best = len1 - circle.radius;
					if(best < upperBound) {
						if(len1 == 0) {
							nx1 = 1;
							ny1 = 0;
						} else {
							var t3 = 1.0 / len1;
							nx1 *= t3;
							ny1 *= t3;
						}
						var t4 = 0;
						w1.x = v0.x + nx1 * t4;
						w1.y = v0.y + ny1 * t4;
						var t5 = -circle.radius;
						w2.x = circle.worldCOMx + nx1 * t5;
						w2.y = circle.worldCOMy + ny1 * t5;
						axis.x = nx1;
						axis.y = ny1;
					}
				} else if(dt >= v1.y * a0.gnormx - v1.x * a0.gnormy) {
					var nx2 = 0.0;
					var ny2 = 0.0;
					nx2 = circle.worldCOMx - v1.x;
					ny2 = circle.worldCOMy - v1.y;
					var len2 = Math.sqrt(nx2 * nx2 + ny2 * ny2);
					best = len2 - circle.radius;
					if(best < upperBound) {
						if(len2 == 0) {
							nx2 = 1;
							ny2 = 0;
						} else {
							var t6 = 1.0 / len2;
							nx2 *= t6;
							ny2 *= t6;
						}
						var t7 = 0;
						w1.x = v1.x + nx2 * t7;
						w1.y = v1.y + ny2 * t7;
						var t8 = -circle.radius;
						w2.x = circle.worldCOMx + nx2 * t8;
						w2.y = circle.worldCOMy + ny2 * t8;
						axis.x = nx2;
						axis.y = ny2;
					}
				} else {
					var t9 = -circle.radius;
					w2.x = circle.worldCOMx + a0.gnormx * t9;
					w2.y = circle.worldCOMy + a0.gnormy * t9;
					var t10 = -best;
					w1.x = w2.x + a0.gnormx * t10;
					w1.y = w2.y + a0.gnormy * t10;
					axis.x = a0.gnormx;
					axis.y = a0.gnormy;
				}
			}
			if(swapped) {
				axis.x = -axis.x;
				axis.y = -axis.y;
			}
			return best;
		} else {
			var p1 = s1.polygon;
			var p2 = s2.polygon;
			var best1 = -1e+100;
			var a1 = null;
			var a2 = null;
			var besti = 0;
			var cx_ite1 = p1.edges.head;
			while(cx_ite1 != null) {
				var a3 = cx_ite1.elt;
				var min = 1e100;
				var cx_ite2 = p2.gverts.next;
				while(cx_ite2 != null) {
					var v = cx_ite2;
					var k = a3.gnormx * v.x + a3.gnormy * v.y;
					if(k < min) min = k;
					cx_ite2 = cx_ite2.next;
				}
				min -= a3.gprojection;
				if(min > upperBound) {
					best1 = min;
					break;
				}
				if(min > 0) {
					if(min > best1) {
						best1 = min;
						a1 = a3;
						besti = 1;
					}
				} else if(best1 < 0 && min > best1) {
					best1 = min;
					a1 = a3;
					besti = 1;
				}
				cx_ite1 = cx_ite1.next;
			}
			if(best1 < upperBound) {
				var cx_ite3 = p2.edges.head;
				while(cx_ite3 != null) {
					var a4 = cx_ite3.elt;
					var min1 = 1e100;
					var cx_ite4 = p1.gverts.next;
					while(cx_ite4 != null) {
						var v2 = cx_ite4;
						var k1 = a4.gnormx * v2.x + a4.gnormy * v2.y;
						if(k1 < min1) min1 = k1;
						cx_ite4 = cx_ite4.next;
					}
					min1 -= a4.gprojection;
					if(min1 > upperBound) {
						best1 = min1;
						break;
					}
					if(min1 > 0) {
						if(min1 > best1) {
							best1 = min1;
							a2 = a4;
							besti = 2;
						}
					} else if(best1 < 0 && min1 > best1) {
						best1 = min1;
						a2 = a4;
						besti = 2;
					}
					cx_ite3 = cx_ite3.next;
				}
				if(best1 < upperBound) {
					var q1;
					var q2;
					var ax;
					if(besti == 1) {
						q1 = p1;
						q2 = p2;
						ax = a1;
					} else {
						q1 = p2;
						q2 = p1;
						ax = a2;
						var tmp1 = w1;
						w1 = w2;
						w2 = tmp1;
						swapped = !swapped;
					}
					var ay = null;
					var min2 = 1e100;
					var cx_ite5 = q2.edges.head;
					while(cx_ite5 != null) {
						var a5 = cx_ite5.elt;
						var k2 = ax.gnormx * a5.gnormx + ax.gnormy * a5.gnormy;
						if(k2 < min2) {
							min2 = k2;
							ay = a5;
						}
						cx_ite5 = cx_ite5.next;
					}
					if(swapped) {
						axis.x = -ax.gnormx;
						axis.y = -ax.gnormy;
					} else {
						axis.x = ax.gnormx;
						axis.y = ax.gnormy;
					}
					if(best1 >= 0) {
						var v01 = ax.gp0;
						var v11 = ax.gp1;
						var q0 = ay.gp0;
						var q11 = ay.gp1;
						var vx = 0.0;
						var vy = 0.0;
						var qx = 0.0;
						var qy = 0.0;
						vx = v11.x - v01.x;
						vy = v11.y - v01.y;
						qx = q11.x - q0.x;
						qy = q11.y - q0.y;
						var vdot = 1 / (vx * vx + vy * vy);
						var qdot = 1 / (qx * qx + qy * qy);
						var t11 = -(vx * (v01.x - q0.x) + vy * (v01.y - q0.y)) * vdot;
						var t21 = -(vx * (v01.x - q11.x) + vy * (v01.y - q11.y)) * vdot;
						var s11 = -(qx * (q0.x - v01.x) + qy * (q0.y - v01.y)) * qdot;
						var s21 = -(qx * (q0.x - v11.x) + qy * (q0.y - v11.y)) * qdot;
						if(t11 < 0) t11 = 0; else if(t11 > 1) t11 = 1;
						if(t21 < 0) t21 = 0; else if(t21 > 1) t21 = 1;
						if(s11 < 0) s11 = 0; else if(s11 > 1) s11 = 1;
						if(s21 < 0) s21 = 0; else if(s21 > 1) s21 = 1;
						var f1x = 0.0;
						var f1y = 0.0;
						var t12 = t11;
						f1x = v01.x + vx * t12;
						f1y = v01.y + vy * t12;
						var f2x = 0.0;
						var f2y = 0.0;
						var t13 = t21;
						f2x = v01.x + vx * t13;
						f2y = v01.y + vy * t13;
						var g1x = 0.0;
						var g1y = 0.0;
						var t14 = s11;
						g1x = q0.x + qx * t14;
						g1y = q0.y + qy * t14;
						var g2x = 0.0;
						var g2y = 0.0;
						var t15 = s21;
						g2x = q0.x + qx * t15;
						g2y = q0.y + qy * t15;
						var d1 = zpp_$nape_geom_ZPP_$VecMath.vec_dsq(f1x,f1y,q0.x,q0.y);
						var d2 = zpp_$nape_geom_ZPP_$VecMath.vec_dsq(f2x,f2y,q11.x,q11.y);
						var e1 = zpp_$nape_geom_ZPP_$VecMath.vec_dsq(g1x,g1y,v01.x,v01.y);
						var e2 = zpp_$nape_geom_ZPP_$VecMath.vec_dsq(g2x,g2y,v11.x,v11.y);
						var minfx = 0.0;
						var minfy = 0.0;
						var minq = null;
						if(d1 < d2) {
							minfx = f1x;
							minfy = f1y;
							minq = q0;
						} else {
							minfx = f2x;
							minfy = f2y;
							minq = q11;
							d1 = d2;
						}
						var mingx = 0.0;
						var mingy = 0.0;
						var minv = null;
						if(e1 < e2) {
							mingx = g1x;
							mingy = g1y;
							minv = v01;
						} else {
							mingx = g2x;
							mingy = g2y;
							minv = v11;
							e1 = e2;
						}
						if(d1 < e1) {
							w1.x = minfx;
							w1.y = minfy;
							w2.x = minq.x;
							w2.y = minq.y;
							best1 = Math.sqrt(d1);
						} else {
							w2.x = mingx;
							w2.y = mingy;
							w1.x = minv.x;
							w1.y = minv.y;
							best1 = Math.sqrt(e1);
						}
						if(best1 != 0) {
							axis.x = w2.x - w1.x;
							axis.y = w2.y - w1.y;
							var t16 = 1.0 / best1;
							axis.x *= t16;
							axis.y *= t16;
							if(swapped) {
								axis.x = -axis.x;
								axis.y = -axis.y;
							}
						}
						return best1;
					} else {
						var c0x = 0.0;
						var c0y = 0.0;
						c0x = ay.gp0.x;
						c0y = ay.gp0.y;
						var c1x = 0.0;
						var c1y = 0.0;
						c1x = ay.gp1.x;
						c1y = ay.gp1.y;
						var dvx = 0.0;
						var dvy = 0.0;
						dvx = c1x - c0x;
						dvy = c1y - c0y;
						var d0 = ax.gnormy * c0x - ax.gnormx * c0y;
						var d11 = ax.gnormy * c1x - ax.gnormx * c1y;
						var den = 1 / (d11 - d0);
						var t17 = (-ax.tp1 - d0) * den;
						if(t17 > nape_Config.epsilon) {
							var t19 = t17;
							c0x += dvx * t19;
							c0y += dvy * t19;
						}
						var t18 = (-ax.tp0 - d11) * den;
						if(t18 < -nape_Config.epsilon) {
							var t20 = t18;
							c1x += dvx * t20;
							c1y += dvy * t20;
						}
						var c0d = c0x * ax.gnormx + c0y * ax.gnormy - ax.gprojection;
						var c1d = c1x * ax.gnormx + c1y * ax.gnormy - ax.gprojection;
						if(c0d < c1d) {
							w2.x = c0x;
							w2.y = c0y;
							var t22 = -c0d;
							w1.x = w2.x + ax.gnormx * t22;
							w1.y = w2.y + ax.gnormy * t22;
							return c0d;
						} else {
							w2.x = c1x;
							w2.y = c1y;
							var t23 = -c1d;
							w1.x = w2.x + ax.gnormx * t23;
							w1.y = w2.y + ax.gnormy * t23;
							return c1d;
						}
					}
				} else return upperBound;
			} else return upperBound;
		}
	}
};
var zpp_$nape_geom_ZPP_$Vec2 = function() {
	this.y = 0.0;
	this.x = 0.0;
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this._inuse = false;
	this.next = null;
	this.weak = false;
	this.outer = null;
	this._isimmutable = null;
	this._immutable = false;
	this._validate = null;
	this._invalidate = null;
};
zpp_$nape_geom_ZPP_$Vec2.__name__ = true;
zpp_$nape_geom_ZPP_$Vec2.get = function(x,y,immutable) {
	if(immutable == null) immutable = false;
	var ret;
	if(zpp_$nape_geom_ZPP_$Vec2.zpp_pool == null) ret = new zpp_$nape_geom_ZPP_$Vec2(); else {
		ret = zpp_$nape_geom_ZPP_$Vec2.zpp_pool;
		zpp_$nape_geom_ZPP_$Vec2.zpp_pool = ret.next;
		ret.next = null;
	}
	ret.weak = false;
	ret._immutable = immutable;
	ret.x = x;
	ret.y = y;
	return ret;
};
zpp_$nape_geom_ZPP_$Vec2.prototype = {
	validate: function() {
		if(this._validate != null) this._validate();
	}
	,invalidate: function() {
		if(this._invalidate != null) this._invalidate(this);
	}
	,immutable: function() {
		if(this._immutable) throw new js__$Boot_HaxeError("Error: Vec2 is immutable");
		if(this._isimmutable != null) this._isimmutable();
	}
	,wrapper: function() {
		if(this.outer == null) {
			this.outer = new nape_geom_Vec2();
			var o = this.outer.zpp_inner;
			if(o.outer != null) {
				o.outer.zpp_inner = null;
				o.outer = null;
			}
			o._isimmutable = null;
			o._validate = null;
			o._invalidate = null;
			o.next = zpp_$nape_geom_ZPP_$Vec2.zpp_pool;
			zpp_$nape_geom_ZPP_$Vec2.zpp_pool = o;
			this.outer.zpp_inner = this;
		}
		return this.outer;
	}
	,add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		o._inuse = true;
		temp = o;
		temp.next = this.next;
		this.next = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,insert: function(cur,o) {
		return this.inlined_insert(cur,o);
	}
	,inlined_insert: function(cur,o) {
		var temp;
		o._inuse = true;
		temp = o;
		if(cur == null) {
			temp.next = this.next;
			this.next = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,erase: function(pre) {
		return this.inlined_erase(pre);
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.next;
			ret = old.next;
			this.next = ret;
			if(this.next == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		old._inuse = false;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,reverse: function() {
		var cur = this.next;
		var pre = null;
		while(cur != null) {
			var nx = cur.next;
			cur.next = pre;
			this.next = cur;
			pre = cur;
			cur = nx;
		}
		this.modified = true;
		this.pushmod = true;
	}
	,iterator_at: function(ind) {
		var ret = this.next;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,toString: function() {
		return "{ x: " + this.x + " y: " + this.y + " }";
	}
	,__class__: zpp_$nape_geom_ZPP_$Vec2
};
var zpp_$nape_geom_ZPP_$Vec3 = function() {
	this._validate = null;
	this.z = 0.0;
	this.y = 0.0;
	this.x = 0.0;
};
zpp_$nape_geom_ZPP_$Vec3.__name__ = true;
zpp_$nape_geom_ZPP_$Vec3.prototype = {
	validate: function() {
		if(this._validate != null) this._validate();
	}
	,__class__: zpp_$nape_geom_ZPP_$Vec3
};
var zpp_$nape_geom_ZPP_$VecMath = function() { };
zpp_$nape_geom_ZPP_$VecMath.__name__ = true;
zpp_$nape_geom_ZPP_$VecMath.vec_dsq = function(ax,ay,bx,by) {
	var dx = 0.0;
	var dy = 0.0;
	dx = ax - bx;
	dy = ay - by;
	return dx * dx + dy * dy;
};
var zpp_$nape_phys_ZPP_$Interactor = function() {
	this.cbSet = null;
	this.cbTypes = null;
	this.group = null;
	this.cbsets = null;
	this.icompound = null;
	this.ibody = null;
	this.ishape = null;
	this.id = 0;
	this.outer_i = null;
	this.id = zpp_$nape_ZPP_$ID.Interactor();
	this.cbsets = new zpp_$nape_util_ZNPList_$ZPP_$CallbackSet();
	this.cbTypes = new zpp_$nape_util_ZNPList_$ZPP_$CbType();
};
zpp_$nape_phys_ZPP_$Interactor.__name__ = true;
zpp_$nape_phys_ZPP_$Interactor.get = function(i1,i2) {
	var id;
	if(i1.id < i2.id) id = i1.id; else id = i2.id;
	var di;
	if(i1.id < i2.id) di = i2.id; else di = i1.id;
	var xs;
	if(i1.cbsets.length < i2.cbsets.length) xs = i1.cbsets; else xs = i2.cbsets;
	var ret = null;
	var cx_ite = xs.head;
	while(cx_ite != null) {
		var x = cx_ite.elt;
		if(x.id == id && x.di == di) {
			ret = x;
			break;
		}
		cx_ite = cx_ite.next;
	}
	return ret;
};
zpp_$nape_phys_ZPP_$Interactor.int_callback = function(set,x,cb) {
	var o1 = set.int1;
	var o2 = set.int2;
	if(x.options1.compatible(o1.cbTypes) && x.options2.compatible(o2.cbTypes)) {
		cb.int1 = o1;
		cb.int2 = o2;
	} else {
		cb.int1 = o2;
		cb.int2 = o1;
	}
};
zpp_$nape_phys_ZPP_$Interactor.prototype = {
	__iaddedToSpace: function() {
		if(this.group != null) this.group.interactors.add(this);
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.interactors.add(this);
			cx_ite = cx_ite.next;
		}
		this.alloc_cbSet();
	}
	,__iremovedFromSpace: function() {
		if(this.group != null) this.group.interactors.remove(this);
		var cx_ite = this.cbTypes.head;
		while(cx_ite != null) {
			var cb = cx_ite.elt;
			cb.interactors.remove(this);
			cx_ite = cx_ite.next;
		}
		this.dealloc_cbSet();
	}
	,wake: function() {
		if(this.ishape != null) {
			var body = this.ishape.body;
			if(body != null && body.space != null) body.space.non_inlined_wake(body);
			true;
		} else if(this.ibody != null) {
			if(this.ibody.space != null) this.ibody.space.non_inlined_wake(this.ibody); else false;
		} else {
			if(this.icompound.space != null) this.icompound.space.wakeCompound(this.icompound);
			true;
		}
	}
	,insert_cbtype: function(cb) {
		if(!this.cbTypes.has(cb)) {
			var space;
			if(this.ishape != null) {
				if(this.ishape.body == null) space = null; else space = this.ishape.body.space;
			} else if(this.ibody != null) space = this.ibody.space; else space = this.icompound.space;
			if(space != null) {
				this.dealloc_cbSet();
				cb.interactors.add(this);
			}
			var pre = null;
			var cx_ite = this.cbTypes.head;
			while(cx_ite != null) {
				var j = cx_ite.elt;
				if(cb.id < j.id) break;
				pre = cx_ite;
				cx_ite = cx_ite.next;
			}
			this.cbTypes.inlined_insert(pre,cb);
			if(space != null) {
				this.alloc_cbSet();
				this.wake();
			}
		}
	}
	,alloc_cbSet: function() {
		var space;
		if(this.ishape != null) {
			if(this.ishape.body == null) space = null; else space = this.ishape.body.space;
		} else if(this.ibody != null) space = this.ibody.space; else space = this.icompound.space;
		if((this.cbSet = space.cbsets.get(this.cbTypes)) != null) {
			this.cbSet.count++;
			this.cbSet.interactors.add(this);
			this.cbSet.validate();
			space.freshInteractorType(this);
		}
	}
	,dealloc_cbSet: function() {
		var space;
		if(this.ishape != null) {
			if(this.ishape.body == null) space = null; else space = this.ishape.body.space;
		} else if(this.ibody != null) space = this.ibody.space; else space = this.icompound.space;
		if(this.cbSet != null) {
			this.cbSet.interactors.remove(this);
			space.nullInteractorType(this);
			if(--this.cbSet.count == 0) {
				space.cbsets.remove(this.cbSet);
				var o = this.cbSet;
				o.free();
				o.next = zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool;
				zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool = o;
			}
			this.cbSet = null;
		}
	}
	,immutable_midstep: function(n) {
		if(this.ibody != null) this.ibody.__immutable_midstep(n); else if(this.ishape != null) this.ishape.__immutable_midstep(n); else this.icompound.__imutable_midstep(n);
	}
	,lookup_group: function() {
		var cur = this;
		while(cur != null && cur.group == null) if(cur.ishape != null) cur = cur.ishape.body; else if(cur.icompound != null) cur = cur.icompound.compound; else cur = cur.ibody.compound;
		if(cur == null) return null; else return cur.group;
	}
	,__class__: zpp_$nape_phys_ZPP_$Interactor
};
var zpp_$nape_phys_ZPP_$Body = function() {
	this.wrap_worldCOM = null;
	this.wrap_localCOM = null;
	this.zip_worldCOM = false;
	this.worldCOMy = 0.0;
	this.worldCOMx = 0.0;
	this.zip_localCOM = false;
	this.localCOMy = 0.0;
	this.localCOMx = 0.0;
	this.zip_aabb = false;
	this.aabb = null;
	this.norotate = false;
	this.sinertia = 0.0;
	this.iinertia = 0.0;
	this.cinertia = 0.0;
	this.zip_inertia = false;
	this.inertia = 0.0;
	this.inertiaMode = 0;
	this.zip_gravMassScale = false;
	this.gravMassScale = 0.0;
	this.gravMassMode = 0;
	this.zip_gravMass = false;
	this.gravMass = 0.0;
	this.nomove = false;
	this.cmass = 0.0;
	this.smass = 0.0;
	this.imass = 0.0;
	this.massMode = 0;
	this.zip_mass = false;
	this.mass = 0.0;
	this.zip_axis = false;
	this.axisy = 0.0;
	this.axisx = 0.0;
	this.rot = 0.0;
	this.pre_rot = 0.0;
	this.kinangvel = 0.0;
	this.torque = 0.0;
	this.angvel = 0.0;
	this.svely = 0.0;
	this.svelx = 0.0;
	this.kinvely = 0.0;
	this.kinvelx = 0.0;
	this.forcey = 0.0;
	this.forcex = 0.0;
	this.vely = 0.0;
	this.velx = 0.0;
	this.wrap_pos = null;
	this.posy = 0.0;
	this.posx = 0.0;
	this.pre_posy = 0.0;
	this.pre_posx = 0.0;
	this.disableCCD = false;
	this.bulletEnabled = false;
	this.bullet = false;
	this.sweepRadius = 0.0;
	this.sweepFrozen = false;
	this.sweep_angvel = 0.0;
	this.sweepTime = 0.0;
	this.component = null;
	this.constraints = null;
	this.arbiters = null;
	this.space = null;
	this.wrap_shapes = null;
	this.shapes = null;
	this.compound = null;
	this.type = 0;
	this.world = false;
	this.outer = null;
	zpp_$nape_phys_ZPP_$Interactor.call(this);
	this.ibody = this;
	this.world = false;
	this.bulletEnabled = false;
	this.sweepTime = 0;
	this.sweep_angvel = 0;
	this.norotate = this.nomove = false;
	this.disableCCD = false;
	this.posx = 0;
	this.posy = 0;
	this.rot = 0;
	this.axisx = 0;
	this.axisy = 1;
	this.svelx = 0;
	this.svely = 0;
	this.velx = 0;
	this.vely = 0;
	this.kinvelx = 0;
	this.kinvely = 0;
	this.forcex = 0;
	this.forcey = 0;
	this.torque = this.angvel = this.kinangvel = 0;
	this.pre_posx = Infinity;
	this.pre_posy = Infinity;
	this.pre_rot = Infinity;
	this.localCOMx = 0;
	this.localCOMy = 0;
	this.worldCOMx = 0;
	this.worldCOMy = 0;
	this.zip_aabb = true;
	this.aabb = zpp_$nape_geom_ZPP_$AABB.get(0,0,0,0);
	this.aabb._immutable = true;
	var me = this;
	this.aabb._validate = $bind(this,this.aabb_validate);
	this.massMode = 0;
	this.gravMassMode = 0;
	this.gravMassScale = 1.0;
	this.inertiaMode = 0;
	this.arbiters = new zpp_$nape_util_ZNPList_$ZPP_$Arbiter();
	this.constraints = new zpp_$nape_util_ZNPList_$ZPP_$Constraint();
	this.shapes = new zpp_$nape_util_ZNPList_$ZPP_$Shape();
	this.wrap_shapes = zpp_$nape_util_ZPP_$ShapeList.get(this.shapes);
	this.wrap_shapes.zpp_inner.adder = $bind(this,this.shapes_adder);
	this.wrap_shapes.zpp_inner.subber = $bind(this,this.shapes_subber);
	this.wrap_shapes.zpp_inner._invalidate = $bind(this,this.shapes_invalidate);
	this.wrap_shapes.zpp_inner._modifiable = $bind(this,this.shapes_modifiable);
	this.kinematicDelaySleep = false;
};
zpp_$nape_phys_ZPP_$Body.__name__ = true;
zpp_$nape_phys_ZPP_$Body.__static = function() {
	var ret = new nape_phys_Body((function($this) {
		var $r;
		if(zpp_$nape_util_ZPP_$Flags.BodyType_STATIC == null) {
			zpp_$nape_util_ZPP_$Flags.internal = true;
			zpp_$nape_util_ZPP_$Flags.BodyType_STATIC = new nape_phys_BodyType();
			zpp_$nape_util_ZPP_$Flags.internal = false;
		}
		$r = zpp_$nape_util_ZPP_$Flags.BodyType_STATIC;
		return $r;
	}(this)));
	var si = ret.zpp_inner;
	si.world = true;
	si.wrap_shapes.zpp_inner.immutable = true;
	si.smass = si.imass = si.cmass = si.mass = si.gravMass = 0.0;
	si.sinertia = si.iinertia = si.cinertia = si.inertia = 0.0;
	si.cbTypes.clear();
	return ret;
};
zpp_$nape_phys_ZPP_$Body.__super__ = zpp_$nape_phys_ZPP_$Interactor;
zpp_$nape_phys_ZPP_$Body.prototype = $extend(zpp_$nape_phys_ZPP_$Interactor.prototype,{
	invalidate_type: function() {
		this.invalidate_mass();
		this.invalidate_inertia();
	}
	,invalidate_shapes: function() {
		this.zip_aabb = true;
		this.zip_localCOM = true;
		this.zip_worldCOM = true;
		this.invalidate_mass();
		this.invalidate_inertia();
	}
	,atRest: function(dt) {
		if(!(this.type == 2)) return this.component.sleeping; else {
			var linSq = nape_Config.linearSleepThreshold;
			linSq *= linSq;
			var cansleep;
			if(this.velx * this.velx + this.vely * this.vely > linSq) cansleep = false; else if(zpp_$nape_geom_ZPP_$VecMath.vec_dsq(this.posx,this.posy,this.pre_posx,this.pre_posy) > 0.25 * linSq * dt * dt) cansleep = false; else {
				var dx = 0.0;
				var dy = 0.0;
				dx = this.aabb.maxx - this.aabb.minx;
				dy = this.aabb.maxy - this.aabb.miny;
				var idl = dx * dx + dy * dy;
				var angSq = nape_Config.angularSleepThreshold;
				angSq *= angSq;
				if(4 * this.angvel * this.angvel * idl > angSq) cansleep = false; else {
					var dr = this.rot - this.pre_rot;
					if(dr * dr * idl > angSq * dt * dt) cansleep = false; else cansleep = true;
				}
			}
			if(!cansleep) this.component.waket = this.space.stamp;
			return this.component.waket + nape_Config.sleepDelay < this.space.stamp;
		}
	}
	,refreshArbiters: function() {
		var cx_ite = this.arbiters.head;
		while(cx_ite != null) {
			var arb = cx_ite.elt;
			arb.invalidated = true;
			cx_ite = cx_ite.next;
		}
	}
	,sweepIntegrate: function(dt) {
		var delta = dt - this.sweepTime;
		if(delta != 0) {
			this.sweepTime = dt;
			var t = delta;
			this.posx += this.velx * t;
			this.posy += this.vely * t;
			if(this.angvel != 0) this.delta_rot(this.sweep_angvel * delta);
		}
	}
	,sweepValidate: function(s) {
		if(s.type == 0) {
			s.worldCOMx = this.posx + (this.axisy * s.localCOMx - this.axisx * s.localCOMy);
			s.worldCOMy = this.posy + (s.localCOMx * this.axisx + s.localCOMy * this.axisy);
		} else {
			var p = s.polygon;
			var li = p.lverts.next;
			var cx_ite = p.gverts.next;
			while(cx_ite != null) {
				var g = cx_ite;
				var l = li;
				li = li.next;
				g.x = this.posx + (this.axisy * l.x - this.axisx * l.y);
				g.y = this.posy + (l.x * this.axisx + l.y * this.axisy);
				cx_ite = cx_ite.next;
			}
			var ite = p.edges.head;
			var cx_ite1 = p.gverts.next;
			var u = cx_ite1;
			cx_ite1 = cx_ite1.next;
			while(cx_ite1 != null) {
				var v1 = cx_ite1;
				var e = ite.elt;
				ite = ite.next;
				e.gnormx = this.axisy * e.lnormx - this.axisx * e.lnormy;
				e.gnormy = e.lnormx * this.axisx + e.lnormy * this.axisy;
				e.gprojection = this.posx * e.gnormx + this.posy * e.gnormy + e.lprojection;
				e.tp0 = u.y * e.gnormx - u.x * e.gnormy;
				e.tp1 = v1.y * e.gnormx - v1.x * e.gnormy;
				u = v1;
				cx_ite1 = cx_ite1.next;
			}
			var v = p.gverts.next;
			var e1 = ite.elt;
			ite = ite.next;
			e1.gnormx = this.axisy * e1.lnormx - this.axisx * e1.lnormy;
			e1.gnormy = e1.lnormx * this.axisx + e1.lnormy * this.axisy;
			e1.gprojection = this.posx * e1.gnormx + this.posy * e1.gnormy + e1.lprojection;
			e1.tp0 = u.y * e1.gnormx - u.x * e1.gnormy;
			e1.tp1 = v.y * e1.gnormx - v.x * e1.gnormy;
		}
	}
	,invalidate_pos: function() {
		var cx_ite = this.shapes.head;
		while(cx_ite != null) {
			var s = cx_ite.elt;
			if(s.type == 1) {
				s.polygon.invalidate_gverts();
				s.polygon.invalidate_gaxi();
			}
			s.invalidate_worldCOM();
			cx_ite = cx_ite.next;
		}
		this.zip_worldCOM = true;
	}
	,pos_invalidate: function(pos) {
		this.immutable_midstep("Body::position");
		if(this.type == 1 && this.space != null) throw new js__$Boot_HaxeError("Error: Cannot move a static object once inside a Space");
		if(!(this.posx == pos.x && this.posy == pos.y)) {
			this.posx = pos.x;
			this.posy = pos.y;
			this.invalidate_pos();
			this.wake();
		}
	}
	,pos_validate: function() {
		this.wrap_pos.zpp_inner.x = this.posx;
		this.wrap_pos.zpp_inner.y = this.posy;
	}
	,setupPosition: function() {
		this.wrap_pos = nape_geom_Vec2.get(this.posx,this.posy,null);
		this.wrap_pos.zpp_inner._inuse = true;
		if(this.world) this.wrap_pos.zpp_inner._immutable = true; else {
			this.wrap_pos.zpp_inner._invalidate = $bind(this,this.pos_invalidate);
			this.wrap_pos.zpp_inner._validate = $bind(this,this.pos_validate);
		}
	}
	,invalidate_rot: function() {
		this.zip_axis = true;
		var cx_ite = this.shapes.head;
		while(cx_ite != null) {
			var s = cx_ite.elt;
			if(s.type == 1) {
				s.polygon.invalidate_gverts();
				s.polygon.invalidate_gaxi();
			}
			s.invalidate_worldCOM();
			cx_ite = cx_ite.next;
		}
		this.zip_worldCOM = true;
	}
	,validate_axis: function() {
		if(this.zip_axis) {
			this.zip_axis = false;
			this.axisx = Math.sin(this.rot);
			this.axisy = Math.cos(this.rot);
			null;
		}
	}
	,delta_rot: function(dr) {
		this.rot += dr;
		if(dr * dr > 0.0001) {
			this.axisx = Math.sin(this.rot);
			this.axisy = Math.cos(this.rot);
			null;
		} else {
			var d2 = dr * dr;
			var p = 1 - 0.5 * d2;
			var m = 1 - d2 * d2 / 8;
			var nx = (p * this.axisx + dr * this.axisy) * m;
			this.axisy = (p * this.axisy - dr * this.axisx) * m;
			this.axisx = nx;
		}
	}
	,invalidate_mass: function() {
		this.zip_mass = true;
		this.invalidate_gravMass();
	}
	,validate_mass: function() {
		var exist = false;
		if(this.zip_mass || this.massMode == 0 && exist) {
			this.zip_mass = false;
			if(this.massMode == 0) {
				this.cmass = 0;
				var cx_ite = this.shapes.head;
				while(cx_ite != null) {
					var s = cx_ite.elt;
					s.refmaterial.density = s.material.density;
					s.validate_area_inertia();
					this.cmass += s.area * s.material.density;
					cx_ite = cx_ite.next;
				}
			}
			if(this.type == 2 && !this.nomove) {
				this.mass = this.cmass;
				this.imass = this.smass = 1.0 / this.mass;
			} else {
				this.mass = Infinity;
				this.imass = this.smass = 0.0;
			}
			if(exist) this.invalidate_inertia();
		}
	}
	,invalidate_gravMass: function() {
		if(this.gravMassMode != 1) this.zip_gravMass = true;
		if(this.gravMassMode != 2) this.zip_gravMassScale = true;
		this.wake();
	}
	,validate_gravMass: function() {
		if(this.zip_gravMass) {
			this.zip_gravMass = false;
			this.validate_mass();
			if(this.gravMassMode == 0) {
				this.validate_mass();
				this.gravMass = this.cmass;
			} else if(this.gravMassMode == 2) {
				this.validate_mass();
				this.gravMass = this.cmass * this.gravMassScale;
			}
		}
	}
	,invalidate_inertia: function() {
		this.zip_inertia = true;
		this.wake();
	}
	,validate_inertia: function() {
		var exist = false;
		if(this.zip_inertia || this.inertiaMode == 0 && exist) {
			this.zip_inertia = false;
			if(this.inertiaMode == 0) {
				this.cinertia = 0;
				var cx_ite = this.shapes.head;
				while(cx_ite != null) {
					var s = cx_ite.elt;
					s.refmaterial.density = s.material.density;
					s.validate_area_inertia();
					this.cinertia += s.inertia * s.area * s.material.density;
					cx_ite = cx_ite.next;
				}
			}
			if(this.type == 2 && !this.norotate) {
				this.inertia = this.cinertia;
				this.sinertia = this.iinertia = 1.0 / this.inertia;
			} else {
				this.inertia = Infinity;
				this.sinertia = this.iinertia = 0;
			}
			if(exist) this.invalidate_inertia();
		}
	}
	,validate_aabb: function() {
		if(this.shapes.head == null) throw new js__$Boot_HaxeError("Error: Body bounds only makes sense if it contains shapes");
		if(this.zip_aabb) {
			this.zip_aabb = false;
			this.aabb.minx = Infinity;
			this.aabb.miny = Infinity;
			this.aabb.maxx = -Infinity;
			this.aabb.maxy = -Infinity;
			var cx_ite = this.shapes.head;
			while(cx_ite != null) {
				var s = cx_ite.elt;
				if(s.zip_aabb) {
					if(s.body != null) {
						s.zip_aabb = false;
						if(s.type == 0) s.circle.__validate_aabb(); else s.polygon.__validate_aabb();
					}
				}
				this.aabb.combine(s.aabb);
				cx_ite = cx_ite.next;
			}
		}
	}
	,invalidate_localCOM: function() {
		this.zip_localCOM = true;
		this.zip_worldCOM = true;
	}
	,validate_localCOM: function() {
		if(this.zip_localCOM) {
			this.zip_localCOM = false;
			var tempx = 0;
			var tempy = 0;
			var msum = 0.0;
			var cx_ite = this.shapes.head;
			while(cx_ite != null) {
				var s = cx_ite.elt;
				if(s.zip_localCOM) {
					s.zip_localCOM = false;
					if(s.type == 1) s.polygon.__validate_localCOM();
					if(s.wrap_localCOM != null) {
						s.wrap_localCOM.zpp_inner.x = s.localCOMx;
						s.wrap_localCOM.zpp_inner.y = s.localCOMy;
					}
				}
				s.validate_area_inertia();
				var t = s.area * s.material.density;
				tempx += s.localCOMx * t;
				tempy += s.localCOMy * t;
				msum += s.area * s.material.density;
				cx_ite = cx_ite.next;
			}
			if(msum != 0) {
				var t1 = 1.0 / msum;
				this.localCOMx = tempx * t1;
				this.localCOMy = tempy * t1;
			}
			if(this.wrap_localCOM != null) {
				this.wrap_localCOM.zpp_inner.x = this.localCOMx;
				this.wrap_localCOM.zpp_inner.y = this.localCOMy;
			}
			if(this.zip_mass && this.massMode == 0) {
				this.zip_mass = false;
				this.cmass = msum;
				if(this.type == 2) {
					this.mass = this.cmass;
					this.imass = this.smass = 1.0 / this.mass;
				} else {
					this.mass = Infinity;
					this.imass = this.smass = 0.0;
				}
			}
		}
	}
	,validate_worldCOM: function() {
		if(this.zip_worldCOM) {
			this.zip_worldCOM = false;
			this.validate_localCOM();
			if(this.zip_axis) {
				this.zip_axis = false;
				this.axisx = Math.sin(this.rot);
				this.axisy = Math.cos(this.rot);
				null;
			}
			this.worldCOMx = this.posx + (this.axisy * this.localCOMx - this.axisx * this.localCOMy);
			this.worldCOMy = this.posy + (this.localCOMx * this.axisx + this.localCOMy * this.axisy);
			if(this.wrap_worldCOM != null) {
				this.wrap_worldCOM.zpp_inner.x = this.worldCOMx;
				this.wrap_worldCOM.zpp_inner.y = this.worldCOMy;
			}
		}
	}
	,__immutable_midstep: function(name) {
		if(this.space != null && this.space.midstep) throw new js__$Boot_HaxeError("Error: " + name + " cannot be set during a space step()");
	}
	,aabb_validate: function() {
		if(this.shapes.head == null) throw new js__$Boot_HaxeError("Error: bounds only makes sense when Body has shapes");
		this.validate_aabb();
	}
	,shapes_adder: function(s) {
		if(s.zpp_inner.body != this) {
			if(s.zpp_inner.body != null) s.zpp_inner.body.wrap_shapes.remove(s);
			s.zpp_inner.body = this;
			s.zpp_inner.addedToBody();
			if(this.space != null) this.space.added_shape(s.zpp_inner,null);
			if(s.zpp_inner.type == 1) {
				s.zpp_inner.polygon.invalidate_gaxi();
				s.zpp_inner.polygon.invalidate_gverts();
			}
			return true;
		} else return false;
	}
	,shapes_subber: function(s) {
		if(this.space != null) this.space.removed_shape(s.zpp_inner);
		s.zpp_inner.body = null;
		s.zpp_inner.removedFromBody();
	}
	,shapes_invalidate: function(_) {
		this.invalidate_shapes();
	}
	,shapes_modifiable: function() {
		this.immutable_midstep("Body::shapes");
		if(this.type == 1 && this.space != null) throw new js__$Boot_HaxeError("Error: Cannot modifiy shapes of static object once added to Space");
	}
	,addedToSpace: function() {
		if(zpp_$nape_space_ZPP_$Component.zpp_pool == null) this.component = new zpp_$nape_space_ZPP_$Component(); else {
			this.component = zpp_$nape_space_ZPP_$Component.zpp_pool;
			zpp_$nape_space_ZPP_$Component.zpp_pool = this.component.next;
			this.component.next = null;
		}
		null;
		this.component.isBody = true;
		this.component.body = this;
		this.__iaddedToSpace();
	}
	,removedFromSpace: function() {
		while(!(this.arbiters.head == null)) {
			var arb = this.arbiters.pop_unsafe();
			arb.cleared = true;
			if(arb.b2 == this) arb.b1.arbiters.inlined_try_remove(arb);
			if(arb.b1 == this) arb.b2.arbiters.inlined_try_remove(arb);
			if(arb.pair != null) {
				arb.pair.arb = null;
				arb.pair = null;
			}
			arb.active = false;
			this.space.f_arbiters.modified = true;
		}
		var o = this.component;
		o.body = null;
		o.constraint = null;
		null;
		o.next = zpp_$nape_space_ZPP_$Component.zpp_pool;
		zpp_$nape_space_ZPP_$Component.zpp_pool = o;
		this.component = null;
		this.__iremovedFromSpace();
	}
	,__class__: zpp_$nape_phys_ZPP_$Body
});
var zpp_$nape_phys_ZPP_$Compound = function() {
	this.space = null;
	this.compound = null;
	this.depth = 0;
	this.wrap_constraints = null;
	this.compounds = null;
	this.constraints = null;
	this.bodies = null;
	this.outer = null;
};
zpp_$nape_phys_ZPP_$Compound.__name__ = true;
zpp_$nape_phys_ZPP_$Compound.__super__ = zpp_$nape_phys_ZPP_$Interactor;
zpp_$nape_phys_ZPP_$Compound.prototype = $extend(zpp_$nape_phys_ZPP_$Interactor.prototype,{
	__imutable_midstep: function(name) {
		if(this.space != null && this.space.midstep) throw new js__$Boot_HaxeError("Error: " + name + " cannot be set during space step()");
	}
	,addedToSpace: function() {
		this.__iaddedToSpace();
	}
	,removedFromSpace: function() {
		this.__iremovedFromSpace();
	}
	,__class__: zpp_$nape_phys_ZPP_$Compound
});
var zpp_$nape_phys_ZPP_$FluidProperties = function() {
	this.wrap_gravity = null;
	this.gravityy = 0.0;
	this.gravityx = 0.0;
	this.density = 0.0;
	this.viscosity = 0.0;
	this.shapes = null;
};
zpp_$nape_phys_ZPP_$FluidProperties.__name__ = true;
zpp_$nape_phys_ZPP_$FluidProperties.prototype = {
	__class__: zpp_$nape_phys_ZPP_$FluidProperties
};
var zpp_$nape_phys_ZPP_$Material = function() {
	this.rollingFriction = 0.0;
	this.elasticity = 0.0;
	this.density = 0.0;
	this.staticFriction = 0.0;
	this.dynamicFriction = 0.0;
	this.shapes = null;
	this.outer = null;
	this.next = null;
	this.shapes = new zpp_$nape_util_ZNPList_$ZPP_$Shape();
	this.elasticity = 0;
	this.dynamicFriction = 1;
	this.staticFriction = 2;
	this.density = 0.001;
	this.rollingFriction = 0.01;
};
zpp_$nape_phys_ZPP_$Material.__name__ = true;
zpp_$nape_phys_ZPP_$Material.prototype = {
	wrapper: function() {
		if(this.outer == null) {
			this.outer = new nape_phys_Material();
			var o = this.outer.zpp_inner;
			o.outer = null;
			o.next = zpp_$nape_phys_ZPP_$Material.zpp_pool;
			zpp_$nape_phys_ZPP_$Material.zpp_pool = o;
			this.outer.zpp_inner = this;
		}
		return this.outer;
	}
	,set: function(x) {
		this.dynamicFriction = x.dynamicFriction;
		this.staticFriction = x.staticFriction;
		this.density = x.density;
		this.elasticity = x.elasticity;
		this.rollingFriction = x.rollingFriction;
	}
	,invalidate: function(x) {
		var cx_ite = this.shapes.head;
		while(cx_ite != null) {
			var s = cx_ite.elt;
			s.invalidate_material(x);
			cx_ite = cx_ite.next;
		}
	}
	,__class__: zpp_$nape_phys_ZPP_$Material
};
var zpp_$nape_shape_ZPP_$Shape = function(type) {
	this.zip_aabb = false;
	this.aabb = null;
	this.pairs = null;
	this.node = null;
	this.sweep = null;
	this.sensorEnabled = false;
	this.fluidEnabled = false;
	this.fluidProperties = null;
	this.filter = null;
	this.material = null;
	this.refmaterial = null;
	this.polygon = null;
	this.circle = null;
	this.sweepCoef = 0.0;
	this.zip_sweepRadius = false;
	this.sweepRadius = 0.0;
	this.wrap_localCOM = null;
	this.zip_worldCOM = false;
	this.worldCOMy = 0.0;
	this.worldCOMx = 0.0;
	this.zip_localCOM = false;
	this.localCOMy = 0.0;
	this.localCOMx = 0.0;
	this.zip_angDrag = false;
	this.angDrag = 0.0;
	this.inertia = 0.0;
	this.zip_area_inertia = false;
	this.area = 0.0;
	this.type = 0;
	this.body = null;
	this.outer = null;
	zpp_$nape_phys_ZPP_$Interactor.call(this);
	this.pairs = new zpp_$nape_util_ZNPList_$ZPP_$AABBPair();
	this.ishape = this;
	this.type = type;
	this.aabb = zpp_$nape_geom_ZPP_$AABB.get(0,0,0,0);
	this.aabb._immutable = true;
	var me = this;
	this.aabb._validate = $bind(this,this.aabb_validate);
	this.zip_area_inertia = this.zip_angDrag = this.zip_localCOM = this.zip_sweepRadius = true;
	this.localCOMx = 0;
	this.localCOMy = 0;
	this.worldCOMx = 0;
	this.worldCOMy = 0;
	this.fluidEnabled = false;
	this.sensorEnabled = false;
	this.fluidProperties = null;
	this.body = null;
	this.refmaterial = new zpp_$nape_phys_ZPP_$Material();
	this.sweepRadius = this.sweepCoef = 0;
};
zpp_$nape_shape_ZPP_$Shape.__name__ = true;
zpp_$nape_shape_ZPP_$Shape.__super__ = zpp_$nape_phys_ZPP_$Interactor;
zpp_$nape_shape_ZPP_$Shape.prototype = $extend(zpp_$nape_phys_ZPP_$Interactor.prototype,{
	validate_sweepRadius: function() {
		if(this.zip_sweepRadius) {
			this.zip_sweepRadius = false;
			if(this.type == 0) this.circle.__validate_sweepRadius(); else this.polygon.__validate_sweepRadius();
		}
	}
	,validate_area_inertia: function() {
		if(this.zip_area_inertia) {
			this.zip_area_inertia = false;
			if(this.type == 0) this.circle.__validate_area_inertia(); else this.polygon.__validate_area_inertia();
		}
	}
	,validate_angDrag: function() {
		if(this.zip_angDrag || this.refmaterial.dynamicFriction != this.material.dynamicFriction) {
			this.zip_angDrag = false;
			this.refmaterial.dynamicFriction = this.material.dynamicFriction;
			if(this.type == 0) this.circle.__validate_angDrag(); else this.polygon.__validate_angDrag();
		}
	}
	,validate_worldCOM: function() {
		if(this.zip_worldCOM) {
			if(this.body != null) {
				this.zip_worldCOM = false;
				if(this.zip_localCOM) {
					this.zip_localCOM = false;
					if(this.type == 1) this.polygon.__validate_localCOM();
					if(this.wrap_localCOM != null) {
						this.wrap_localCOM.zpp_inner.x = this.localCOMx;
						this.wrap_localCOM.zpp_inner.y = this.localCOMy;
					}
				}
				this.body.validate_axis();
				this.worldCOMx = this.body.posx + (this.body.axisy * this.localCOMx - this.body.axisx * this.localCOMy);
				this.worldCOMy = this.body.posy + (this.localCOMx * this.body.axisx + this.localCOMy * this.body.axisy);
			}
		}
	}
	,invalidate_area_inertia: function() {
		this.zip_area_inertia = true;
		if(this.body != null) {
			this.body.invalidate_localCOM();
			this.body.invalidate_mass();
			this.body.invalidate_inertia();
		}
	}
	,invalidate_angDrag: function() {
		this.zip_angDrag = true;
	}
	,invalidate_localCOM: function() {
		this.zip_localCOM = true;
		this.invalidate_area_inertia();
		if(this.type == 0) this.zip_sweepRadius = true;
		this.invalidate_angDrag();
		this.invalidate_worldCOM();
		if(this.body != null) this.body.invalidate_localCOM();
	}
	,invalidate_worldCOM: function() {
		this.zip_worldCOM = true;
		this.zip_aabb = true;
		if(this.body != null) this.body.zip_aabb = true;
	}
	,invalidate_material: function(flags) {
		if((flags & zpp_$nape_phys_ZPP_$Material.WAKE) != 0) this.wake();
		if((flags & zpp_$nape_phys_ZPP_$Material.ARBITERS) != 0) {
			if(this.body != null) this.body.refreshArbiters();
		}
		if((flags & zpp_$nape_phys_ZPP_$Material.PROPS) != 0) {
			if(this.body != null) {
				this.body.invalidate_localCOM();
				this.body.invalidate_mass();
				this.body.invalidate_inertia();
			}
		}
		if((flags & zpp_$nape_phys_ZPP_$Material.ANGDRAG) != 0) this.invalidate_angDrag();
		this.refmaterial.set(this.material);
	}
	,invalidate_filter: function() {
		this.wake();
	}
	,aabb_validate: function() {
		if(this.body == null) throw new js__$Boot_HaxeError("Error: bounds only makes sense when Shape belongs to a Body");
		if(this.zip_aabb) {
			if(this.body != null) {
				this.zip_aabb = false;
				if(this.type == 0) this.circle.__validate_aabb(); else this.polygon.__validate_aabb();
			}
		}
	}
	,setMaterial: function(material) {
		if(this.material != material) {
			if(this.body != null && this.body.space != null) {
				if(this.material != null) this.material.shapes.remove(this);
			}
			this.material = material;
			if(this.body != null && this.body.space != null) material.shapes.add(this);
			this.wake();
			if(this.body != null) this.body.refreshArbiters();
		}
	}
	,setFilter: function(filter) {
		if(this.filter != filter) {
			if(this.body != null && this.body.space != null) {
				if(this.filter != null) this.filter.shapes.remove(this);
			}
			this.filter = filter;
			if(this.body != null && this.body.space != null) filter.shapes.add(this);
			this.wake();
		}
	}
	,__immutable_midstep: function(name) {
		if(this.body != null && this.body.space != null && this.body.space.midstep) throw new js__$Boot_HaxeError("Error: " + name + " cannot be set during a space step()");
	}
	,addedToBody: function() {
		this.invalidate_worldCOM();
		this.zip_aabb = true;
		if(this.body != null) this.body.zip_aabb = true;
	}
	,removedFromBody: function() {
	}
	,addedToSpace: function() {
		this.__iaddedToSpace();
		this.material.shapes.add(this);
		this.filter.shapes.add(this);
		if(this.fluidProperties != null) this.fluidProperties.shapes.add(this);
	}
	,removedFromSpace: function() {
		this.__iremovedFromSpace();
		this.material.shapes.remove(this);
		this.filter.shapes.remove(this);
		if(this.fluidProperties != null) this.fluidProperties.shapes.remove(this);
	}
	,__class__: zpp_$nape_shape_ZPP_$Shape
});
var zpp_$nape_shape_ZPP_$Circle = function() {
	this.radius = 0.0;
	this.outer_zn = null;
	zpp_$nape_shape_ZPP_$Shape.call(this,0);
	this.circle = this;
	this.zip_localCOM = false;
};
zpp_$nape_shape_ZPP_$Circle.__name__ = true;
zpp_$nape_shape_ZPP_$Circle.__super__ = zpp_$nape_shape_ZPP_$Shape;
zpp_$nape_shape_ZPP_$Circle.prototype = $extend(zpp_$nape_shape_ZPP_$Shape.prototype,{
	invalidate_radius: function() {
		this.invalidate_area_inertia();
		this.invalidate_angDrag();
		this.zip_aabb = true;
		if(this.body != null) this.body.zip_aabb = true;
		if(this.body != null) this.body.wake();
	}
	,__validate_aabb: function() {
		if(this.zip_worldCOM) {
			if(this.body != null) {
				this.zip_worldCOM = false;
				if(this.zip_localCOM) {
					this.zip_localCOM = false;
					if(this.type == 1) this.polygon.__validate_localCOM();
					if(this.wrap_localCOM != null) {
						this.wrap_localCOM.zpp_inner.x = this.localCOMx;
						this.wrap_localCOM.zpp_inner.y = this.localCOMy;
					}
				}
				this.body.validate_axis();
				this.worldCOMx = this.body.posx + (this.body.axisy * this.localCOMx - this.body.axisx * this.localCOMy);
				this.worldCOMy = this.body.posy + (this.localCOMx * this.body.axisx + this.localCOMy * this.body.axisy);
			}
		}
		var rx = this.radius;
		var ry = this.radius;
		this.aabb.minx = this.worldCOMx - rx;
		this.aabb.miny = this.worldCOMy - ry;
		this.aabb.maxx = this.worldCOMx + rx;
		this.aabb.maxy = this.worldCOMy + ry;
	}
	,_force_validate_aabb: function() {
		this.worldCOMx = this.body.posx + (this.body.axisy * this.localCOMx - this.body.axisx * this.localCOMy);
		this.worldCOMy = this.body.posy + (this.localCOMx * this.body.axisx + this.localCOMy * this.body.axisy);
		this.aabb.minx = this.worldCOMx - this.radius;
		this.aabb.miny = this.worldCOMy - this.radius;
		this.aabb.maxx = this.worldCOMx + this.radius;
		this.aabb.maxy = this.worldCOMy + this.radius;
	}
	,__validate_sweepRadius: function() {
		this.sweepCoef = Math.sqrt(this.localCOMx * this.localCOMx + this.localCOMy * this.localCOMy);
		this.sweepRadius = this.sweepCoef + this.radius;
	}
	,__validate_area_inertia: function() {
		var r2 = this.radius * this.radius;
		this.area = r2 * Math.PI;
		this.inertia = r2 * 0.5 + (this.localCOMx * this.localCOMx + this.localCOMy * this.localCOMy);
	}
	,__validate_angDrag: function() {
		var lc = this.localCOMx * this.localCOMx + this.localCOMy * this.localCOMy;
		var r2 = this.radius * this.radius;
		var skin = this.material.dynamicFriction * nape_Config.fluidAngularDragFriction;
		this.angDrag = (lc + 2 * r2) * skin + 0.5 * nape_Config.fluidAngularDrag * (1 + nape_Config.fluidVacuumDrag) * lc;
		this.angDrag /= 2 * (lc + 0.5 * r2);
	}
	,__class__: zpp_$nape_shape_ZPP_$Circle
});
var zpp_$nape_shape_ZPP_$Edge = function() {
	this.tp1 = 0.0;
	this.tp0 = 0.0;
	this.gp1 = null;
	this.lp1 = null;
	this.gp0 = null;
	this.lp0 = null;
	this.gprojection = 0.0;
	this.lprojection = 0.0;
	this.length = 0.0;
	this.wrap_gnorm = null;
	this.gnormy = 0.0;
	this.gnormx = 0.0;
	this.wrap_lnorm = null;
	this.lnormy = 0.0;
	this.lnormx = 0.0;
	this.outer = null;
	this.polygon = null;
	this.next = null;
	this.lnormx = 0;
	this.lnormy = 0;
	this.gnormx = 0;
	this.gnormy = 0;
	this.length = 0;
	this.lprojection = 0;
	this.gprojection = 0;
};
zpp_$nape_shape_ZPP_$Edge.__name__ = true;
zpp_$nape_shape_ZPP_$Edge.prototype = {
	wrapper: function() {
		if(this.outer == null) {
			zpp_$nape_shape_ZPP_$Edge.internal = true;
			this.outer = new nape_shape_Edge();
			zpp_$nape_shape_ZPP_$Edge.internal = false;
			this.outer.zpp_inner = this;
		}
		return this.outer;
	}
	,__class__: zpp_$nape_shape_ZPP_$Edge
};
var zpp_$nape_shape_ZPP_$Polygon = function() {
	this.zip_sanitation = false;
	this.zip_valid = false;
	this.zip_gaxi = false;
	this.zip_gverts = false;
	this.zip_laxi = false;
	this.zip_lverts = false;
	this.reverse_flag = false;
	this.edgeCnt = 0;
	this.wrap_edges = null;
	this.edges = null;
	this.wrap_gverts = null;
	this.gverts = null;
	this.wrap_lverts = null;
	this.lverts = null;
	this.outer_zn = null;
	zpp_$nape_shape_ZPP_$Shape.call(this,1);
	this.polygon = this;
	this.lverts = new zpp_$nape_geom_ZPP_$Vec2();
	this.gverts = new zpp_$nape_geom_ZPP_$Vec2();
	this.edges = new zpp_$nape_util_ZNPList_$ZPP_$Edge();
	this.edgeCnt = 0;
};
zpp_$nape_shape_ZPP_$Polygon.__name__ = true;
zpp_$nape_shape_ZPP_$Polygon.__super__ = zpp_$nape_shape_ZPP_$Shape;
zpp_$nape_shape_ZPP_$Polygon.prototype = $extend(zpp_$nape_shape_ZPP_$Shape.prototype,{
	lverts_pa_invalidate: function(x) {
		this.invalidate_lverts();
	}
	,lverts_pa_immutable: function() {
		if(this.body != null && this.body.type == 1 && this.body.space != null) throw new js__$Boot_HaxeError("Error: Cannot modify local vertex of Polygon added to a static body whilst within a Space");
	}
	,gverts_pa_validate: function() {
		if(this.body == null) throw new js__$Boot_HaxeError("Error: World vertex only makes sense when Polygon is contained in a rigid body");
		this.validate_gverts();
	}
	,lverts_post_adder: function(x) {
		x.zpp_inner._invalidate = $bind(this,this.lverts_pa_invalidate);
		x.zpp_inner._isimmutable = $bind(this,this.lverts_pa_immutable);
		var ite = null;
		var ite2 = null;
		var cx_ite = this.lverts.next;
		while(cx_ite != null) {
			var i = cx_ite;
			if(i == x.zpp_inner) break; else {
				if(ite == null) ite = this.gverts.next; else ite = ite.next;
				if(ite2 == null) ite2 = this.edges.head; else ite2 = ite2.next;
			}
			cx_ite = cx_ite.next;
		}
		var vec = zpp_$nape_geom_ZPP_$Vec2.get(0,0,true);
		this.gverts.insert(ite,vec);
		if(this.lverts.next.next != null) {
			if(this.lverts.next.next.next == null) {
				var ed;
				if(zpp_$nape_shape_ZPP_$Edge.zpp_pool == null) ed = new zpp_$nape_shape_ZPP_$Edge(); else {
					ed = zpp_$nape_shape_ZPP_$Edge.zpp_pool;
					zpp_$nape_shape_ZPP_$Edge.zpp_pool = ed.next;
					ed.next = null;
				}
				null;
				ed.polygon = this;
				this.edges.add(ed);
				var ed1;
				if(zpp_$nape_shape_ZPP_$Edge.zpp_pool == null) ed1 = new zpp_$nape_shape_ZPP_$Edge(); else {
					ed1 = zpp_$nape_shape_ZPP_$Edge.zpp_pool;
					zpp_$nape_shape_ZPP_$Edge.zpp_pool = ed1.next;
					ed1.next = null;
				}
				null;
				ed1.polygon = this;
				this.edges.add(ed1);
				this.edgeCnt += 2;
			} else {
				var ed2;
				if(zpp_$nape_shape_ZPP_$Edge.zpp_pool == null) ed2 = new zpp_$nape_shape_ZPP_$Edge(); else {
					ed2 = zpp_$nape_shape_ZPP_$Edge.zpp_pool;
					zpp_$nape_shape_ZPP_$Edge.zpp_pool = ed2.next;
					ed2.next = null;
				}
				null;
				ed2.polygon = this;
				this.edges.insert(ite2,ed2);
				this.edgeCnt++;
			}
		}
		vec._validate = $bind(this,this.gverts_pa_validate);
	}
	,lverts_subber: function(x) {
		this.cleanup_lvert(x.zpp_inner);
	}
	,lverts_invalidate: function(_) {
		this.invalidate_lverts();
	}
	,lverts_validate: function() {
		this.validate_lverts();
	}
	,lverts_modifiable: function() {
		this.immutable_midstep("Polygon::localVerts");
		if(this.body != null && this.body.type == 1 && this.body.space != null) throw new js__$Boot_HaxeError("Error: Cannot modifiy shapes of static object once added to Space");
	}
	,getlverts: function() {
		var me = this;
		this.wrap_lverts = zpp_$nape_util_ZPP_$MixVec2List.get(this.lverts);
		this.wrap_lverts.zpp_inner.post_adder = $bind(this,this.lverts_post_adder);
		this.wrap_lverts.zpp_inner.subber = $bind(this,this.lverts_subber);
		this.wrap_lverts.zpp_inner._invalidate = $bind(this,this.lverts_invalidate);
		this.wrap_lverts.zpp_inner._validate = $bind(this,this.lverts_validate);
		this.wrap_lverts.zpp_inner._modifiable = $bind(this,this.lverts_modifiable);
		this.wrap_lverts.zpp_inner.reverse_flag = this.reverse_flag;
	}
	,invalidate_lverts: function() {
		this.invalidate_laxi();
		this.invalidate_area_inertia();
		this.invalidate_angDrag();
		this.invalidate_localCOM();
		this.invalidate_gverts();
		this.zip_lverts = true;
		this.zip_valid = true;
		this.zip_sanitation = true;
		if(this.body != null) this.body.wake();
	}
	,invalidate_laxi: function() {
		this.invalidate_gaxi();
		this.zip_sweepRadius = true;
		this.zip_laxi = true;
	}
	,invalidate_gverts: function() {
		this.zip_aabb = true;
		if(this.body != null) this.body.zip_aabb = true;
		this.zip_gverts = true;
	}
	,invalidate_gaxi: function() {
		this.zip_gaxi = true;
	}
	,valid: function() {
		if(this.zip_valid) {
			this.zip_valid = false;
			if(this.zip_sanitation) {
				this.zip_sanitation = false;
				this.splice_collinear_real();
			}
			if(this.lverts.length < 3) return (function($this) {
				var $r;
				if(zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE == null) {
					zpp_$nape_util_ZPP_$Flags.internal = true;
					zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE = new nape_shape_ValidationResult();
					zpp_$nape_util_ZPP_$Flags.internal = false;
				}
				$r = $this.validation = zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE;
				return $r;
			}(this)); else {
				this.validate_lverts();
				this.validate_area_inertia();
				if(this.area < nape_Config.epsilon) return (function($this) {
					var $r;
					if(zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE == null) {
						zpp_$nape_util_ZPP_$Flags.internal = true;
						zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE = new nape_shape_ValidationResult();
						zpp_$nape_util_ZPP_$Flags.internal = false;
					}
					$r = $this.validation = zpp_$nape_util_ZPP_$Flags.ValidationResult_DEGENERATE;
					return $r;
				}(this)); else {
					var neg = false;
					var pos = false;
					var cx_cont = true;
					var cx_ite = this.lverts.next;
					var u = cx_ite;
					cx_ite = cx_ite.next;
					var v = cx_ite;
					cx_ite = cx_ite.next;
					while(cx_ite != null) {
						var w = cx_ite;
						var ax = 0.0;
						var ay = 0.0;
						ax = w.x - v.x;
						ay = w.y - v.y;
						var bx = 0.0;
						var by = 0.0;
						bx = v.x - u.x;
						by = v.y - u.y;
						var dot = by * ax - bx * ay;
						if(dot > nape_Config.epsilon) pos = true; else if(dot < -nape_Config.epsilon) neg = true;
						if(pos && neg) {
							cx_cont = false;
							break;
						}
						u = v;
						v = w;
						cx_ite = cx_ite.next;
					}
					if(cx_cont) {
						cx_ite = this.lverts.next;
						var w1 = cx_ite;
						do {
							var ax1 = 0.0;
							var ay1 = 0.0;
							ax1 = w1.x - v.x;
							ay1 = w1.y - v.y;
							var bx1 = 0.0;
							var by1 = 0.0;
							bx1 = v.x - u.x;
							by1 = v.y - u.y;
							var dot1 = by1 * ax1 - bx1 * ay1;
							if(dot1 > nape_Config.epsilon) pos = true; else if(dot1 < -nape_Config.epsilon) neg = true;
							if(pos && neg) {
								cx_cont = false;
								break;
							}
						} while(false);
						if(cx_cont) {
							u = v;
							v = w1;
							cx_ite = cx_ite.next;
							var w2 = cx_ite;
							do {
								var ax2 = 0.0;
								var ay2 = 0.0;
								ax2 = w2.x - v.x;
								ay2 = w2.y - v.y;
								var bx2 = 0.0;
								var by2 = 0.0;
								bx2 = v.x - u.x;
								by2 = v.y - u.y;
								var dot2 = by2 * ax2 - bx2 * ay2;
								if(dot2 > nape_Config.epsilon) pos = true; else if(dot2 < -nape_Config.epsilon) neg = true;
								if(pos && neg) break;
							} while(false);
						}
					}
					if(pos && neg) return (function($this) {
						var $r;
						if(zpp_$nape_util_ZPP_$Flags.ValidationResult_CONCAVE == null) {
							zpp_$nape_util_ZPP_$Flags.internal = true;
							zpp_$nape_util_ZPP_$Flags.ValidationResult_CONCAVE = new nape_shape_ValidationResult();
							zpp_$nape_util_ZPP_$Flags.internal = false;
						}
						$r = $this.validation = zpp_$nape_util_ZPP_$Flags.ValidationResult_CONCAVE;
						return $r;
					}(this)); else {
						var cont = true;
						var cx_cont1 = true;
						var cx_ite1 = this.lverts.next;
						var u1 = cx_ite1;
						cx_ite1 = cx_ite1.next;
						while(cx_ite1 != null) {
							var v1 = cx_ite1;
							if(!cont) {
								cx_cont1 = false;
								break;
							}
							var cx_cont2 = true;
							var cx_ite2 = this.lverts.next;
							var a = cx_ite2;
							cx_ite2 = cx_ite2.next;
							while(cx_ite2 != null) {
								var b = cx_ite2;
								if(u1 == a || u1 == b || v1 == a || v1 == b) {
									a = b;
									cx_ite2 = cx_ite2.next;
									continue;
								}
								var sx = 0.0;
								var sy = 0.0;
								sx = u1.x - a.x;
								sy = u1.y - a.y;
								var vx = 0.0;
								var vy = 0.0;
								vx = v1.x - u1.x;
								vy = v1.y - u1.y;
								var qx = 0.0;
								var qy = 0.0;
								qx = b.x - a.x;
								qy = b.y - a.y;
								var den = vy * qx - vx * qy;
								if(den * den > nape_Config.epsilon) {
									den = 1 / den;
									var t = (qy * sx - qx * sy) * den;
									if(t > nape_Config.epsilon && t < 1 - nape_Config.epsilon) {
										var s = (vy * sx - vx * sy) * den;
										if(s > nape_Config.epsilon && s < 1 - nape_Config.epsilon) {
											cont = false;
											cx_cont2 = false;
											break;
										}
									}
								}
								a = b;
								cx_ite2 = cx_ite2.next;
							}
							if(cx_cont2) do {
								var b1 = this.lverts.next;
								if(u1 == a || u1 == b1 || v1 == a || v1 == b1) break;
								var sx1 = 0.0;
								var sy1 = 0.0;
								sx1 = u1.x - a.x;
								sy1 = u1.y - a.y;
								var vx1 = 0.0;
								var vy1 = 0.0;
								vx1 = v1.x - u1.x;
								vy1 = v1.y - u1.y;
								var qx1 = 0.0;
								var qy1 = 0.0;
								qx1 = b1.x - a.x;
								qy1 = b1.y - a.y;
								var den1 = vy1 * qx1 - vx1 * qy1;
								if(den1 * den1 > nape_Config.epsilon) {
									den1 = 1 / den1;
									var t1 = (qy1 * sx1 - qx1 * sy1) * den1;
									if(t1 > nape_Config.epsilon && t1 < 1 - nape_Config.epsilon) {
										var s1 = (vy1 * sx1 - vx1 * sy1) * den1;
										if(s1 > nape_Config.epsilon && s1 < 1 - nape_Config.epsilon) {
											cont = false;
											break;
										}
									}
								}
							} while(false);
							u1 = v1;
							cx_ite1 = cx_ite1.next;
						}
						if(cx_cont1) do {
							var v2 = this.lverts.next;
							if(!cont) break;
							var cx_cont3 = true;
							var cx_ite3 = this.lverts.next;
							var a1 = cx_ite3;
							cx_ite3 = cx_ite3.next;
							while(cx_ite3 != null) {
								var b2 = cx_ite3;
								if(u1 == a1 || u1 == b2 || v2 == a1 || v2 == b2) {
									a1 = b2;
									cx_ite3 = cx_ite3.next;
									continue;
								}
								var sx2 = 0.0;
								var sy2 = 0.0;
								sx2 = u1.x - a1.x;
								sy2 = u1.y - a1.y;
								var vx2 = 0.0;
								var vy2 = 0.0;
								vx2 = v2.x - u1.x;
								vy2 = v2.y - u1.y;
								var qx2 = 0.0;
								var qy2 = 0.0;
								qx2 = b2.x - a1.x;
								qy2 = b2.y - a1.y;
								var den2 = vy2 * qx2 - vx2 * qy2;
								if(den2 * den2 > nape_Config.epsilon) {
									den2 = 1 / den2;
									var t2 = (qy2 * sx2 - qx2 * sy2) * den2;
									if(t2 > nape_Config.epsilon && t2 < 1 - nape_Config.epsilon) {
										var s2 = (vy2 * sx2 - vx2 * sy2) * den2;
										if(s2 > nape_Config.epsilon && s2 < 1 - nape_Config.epsilon) {
											cont = false;
											cx_cont3 = false;
											break;
										}
									}
								}
								a1 = b2;
								cx_ite3 = cx_ite3.next;
							}
							if(cx_cont3) do {
								var b3 = this.lverts.next;
								if(u1 == a1 || u1 == b3 || v2 == a1 || v2 == b3) break;
								var sx3 = 0.0;
								var sy3 = 0.0;
								sx3 = u1.x - a1.x;
								sy3 = u1.y - a1.y;
								var vx3 = 0.0;
								var vy3 = 0.0;
								vx3 = v2.x - u1.x;
								vy3 = v2.y - u1.y;
								var qx3 = 0.0;
								var qy3 = 0.0;
								qx3 = b3.x - a1.x;
								qy3 = b3.y - a1.y;
								var den3 = vy3 * qx3 - vx3 * qy3;
								if(den3 * den3 > nape_Config.epsilon) {
									den3 = 1 / den3;
									var t3 = (qy3 * sx3 - qx3 * sy3) * den3;
									if(t3 > nape_Config.epsilon && t3 < 1 - nape_Config.epsilon) {
										var s3 = (vy3 * sx3 - vx3 * sy3) * den3;
										if(s3 > nape_Config.epsilon && s3 < 1 - nape_Config.epsilon) {
											cont = false;
											break;
										}
									}
								}
							} while(false);
						} while(false);
						if(!cont) return (function($this) {
							var $r;
							if(zpp_$nape_util_ZPP_$Flags.ValidationResult_SELF_INTERSECTING == null) {
								zpp_$nape_util_ZPP_$Flags.internal = true;
								zpp_$nape_util_ZPP_$Flags.ValidationResult_SELF_INTERSECTING = new nape_shape_ValidationResult();
								zpp_$nape_util_ZPP_$Flags.internal = false;
							}
							$r = $this.validation = zpp_$nape_util_ZPP_$Flags.ValidationResult_SELF_INTERSECTING;
							return $r;
						}(this)); else return (function($this) {
							var $r;
							if(zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID == null) {
								zpp_$nape_util_ZPP_$Flags.internal = true;
								zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID = new nape_shape_ValidationResult();
								zpp_$nape_util_ZPP_$Flags.internal = false;
							}
							$r = $this.validation = zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID;
							return $r;
						}(this));
					}
				}
			}
		} else return this.validation;
	}
	,validate_lverts: function() {
		if(this.zip_lverts) {
			this.zip_lverts = false;
			if(this.lverts.length > 2) {
				this.validate_area_inertia();
				if(this.area < 0) {
					this.reverse_vertices();
					this.area = -this.area;
				}
			}
		}
	}
	,cleanup_lvert: function(x) {
		var ite = null;
		var ite2 = null;
		var cx_ite = this.lverts.next;
		while(cx_ite != null) {
			var i = cx_ite;
			if(i == x) break; else {
				if(ite == null) ite = this.gverts.next; else ite = ite.next;
				if(ite2 == null) ite2 = this.edges.head; else ite2 = ite2.next;
			}
			cx_ite = cx_ite.next;
		}
		var rem;
		if(ite == null) rem = this.gverts.next; else rem = ite.next;
		this.gverts.erase(ite);
		var o = rem;
		if(o.outer != null) {
			o.outer.zpp_inner = null;
			o.outer = null;
		}
		o._isimmutable = null;
		o._validate = null;
		o._invalidate = null;
		o.next = zpp_$nape_geom_ZPP_$Vec2.zpp_pool;
		zpp_$nape_geom_ZPP_$Vec2.zpp_pool = o;
		if(this.edgeCnt == 2) {
			var rem1 = this.edges.pop_unsafe();
			var o1 = rem1;
			o1.polygon = null;
			o1.next = zpp_$nape_shape_ZPP_$Edge.zpp_pool;
			zpp_$nape_shape_ZPP_$Edge.zpp_pool = o1;
			rem1 = this.edges.pop_unsafe();
			var o2 = rem1;
			o2.polygon = null;
			o2.next = zpp_$nape_shape_ZPP_$Edge.zpp_pool;
			zpp_$nape_shape_ZPP_$Edge.zpp_pool = o2;
			this.edgeCnt = 0;
		} else if(this.edgeCnt != 0) {
			var rem2;
			if(ite2 == null) rem2 = this.edges.head.elt; else rem2 = ite2.next.elt;
			this.edges.erase(ite2);
			var o3 = rem2;
			o3.polygon = null;
			o3.next = zpp_$nape_shape_ZPP_$Edge.zpp_pool;
			zpp_$nape_shape_ZPP_$Edge.zpp_pool = o3;
			this.edgeCnt--;
		}
	}
	,splice_collinear: function() {
		if(this.zip_sanitation) {
			this.zip_sanitation = false;
			this.splice_collinear_real();
		}
	}
	,splice_collinear_real: function() {
		if(this.lverts.next == null) return;
		if(this.lverts.next.next == null) return;
		if(this.lverts.next.next.next == null) return;
		var pre = null;
		var cur = this.lverts.next;
		while(cur != null) {
			var nxt;
			if(cur.next == null) nxt = this.lverts.next; else nxt = cur.next;
			var u = cur;
			var v = nxt;
			if(zpp_$nape_geom_ZPP_$VecMath.vec_dsq(u.x,u.y,v.x,v.y) < nape_Config.epsilon * nape_Config.epsilon) {
				this.cleanup_lvert(cur);
				cur = this.lverts.erase(pre);
			} else {
				pre = cur;
				cur = cur.next;
			}
		}
		if(this.lverts.next == null) return;
		var removed;
		do {
			removed = false;
			var pre1 = this.lverts.next;
			while(pre1 != null) {
				var cur1;
				if(pre1.next == null) cur1 = this.lverts.next; else cur1 = pre1.next;
				var nxt1;
				if(cur1.next == null) nxt1 = this.lverts.next; else nxt1 = cur1.next;
				var u1 = pre1;
				var v1 = cur1;
				var w = nxt1;
				var ax = 0.0;
				var ay = 0.0;
				ax = v1.x - u1.x;
				ay = v1.y - u1.y;
				var bx = 0.0;
				var by = 0.0;
				bx = w.x - v1.x;
				by = w.y - v1.y;
				var crs = by * ax - bx * ay;
				if(crs * crs >= nape_Config.epsilon * nape_Config.epsilon) pre1 = pre1.next; else {
					this.cleanup_lvert(cur1);
					this.lverts.erase(pre1.next == null?null:pre1);
					removed = true;
					pre1 = pre1.next;
				}
			}
		} while(removed);
	}
	,reverse_vertices: function() {
		this.lverts.reverse();
		this.gverts.reverse();
		this.edges.reverse();
		var ite = this.edges.iterator_at(this.edgeCnt - 1);
		var elem = this.edges.pop_unsafe();
		this.edges.insert(ite,elem);
		this.reverse_flag = !this.reverse_flag;
		if(this.wrap_lverts != null) this.wrap_lverts.zpp_inner.reverse_flag = this.reverse_flag;
		if(this.wrap_gverts != null) this.wrap_gverts.zpp_inner.reverse_flag = this.reverse_flag;
		if(this.wrap_edges != null) this.wrap_edges.zpp_inner.reverse_flag = this.reverse_flag;
	}
	,validate_laxi: function() {
		if(this.zip_laxi) {
			this.zip_laxi = false;
			this.validate_lverts();
			var ite = this.edges.head;
			var cx_ite = this.lverts.next;
			var u = cx_ite;
			cx_ite = cx_ite.next;
			while(cx_ite != null) {
				var v1 = cx_ite;
				var edge = ite.elt;
				ite = ite.next;
				edge.lp0 = u;
				edge.lp1 = v1;
				var dx = 0.0;
				var dy = 0.0;
				dx = u.x - v1.x;
				dy = u.y - v1.y;
				var l = Math.sqrt(dx * dx + dy * dy);
				edge.length = l;
				var t = 1.0 / l;
				dx *= t;
				dy *= t;
				var t1 = dx;
				dx = -dy;
				dy = t1;
				edge.lprojection = dx * u.x + dy * u.y;
				edge.lnormx = dx;
				edge.lnormy = dy;
				if(edge.wrap_lnorm != null) {
					edge.wrap_lnorm.zpp_inner.x = dx;
					edge.wrap_lnorm.zpp_inner.y = dy;
				}
				u = v1;
				cx_ite = cx_ite.next;
			}
			var v = this.lverts.next;
			var edge1 = ite.elt;
			ite = ite.next;
			edge1.lp0 = u;
			edge1.lp1 = v;
			var dx1 = 0.0;
			var dy1 = 0.0;
			dx1 = u.x - v.x;
			dy1 = u.y - v.y;
			var l1 = Math.sqrt(dx1 * dx1 + dy1 * dy1);
			edge1.length = l1;
			var t2 = 1.0 / l1;
			dx1 *= t2;
			dy1 *= t2;
			var t3 = dx1;
			dx1 = -dy1;
			dy1 = t3;
			edge1.lprojection = dx1 * u.x + dy1 * u.y;
			edge1.lnormx = dx1;
			edge1.lnormy = dy1;
			if(edge1.wrap_lnorm != null) {
				edge1.wrap_lnorm.zpp_inner.x = dx1;
				edge1.wrap_lnorm.zpp_inner.y = dy1;
			}
		}
	}
	,validate_gverts: function() {
		if(this.zip_gverts) {
			if(this.body != null) {
				this.zip_gverts = false;
				this.validate_lverts();
				this.body.validate_axis();
				var li = this.lverts.next;
				var cx_ite = this.gverts.next;
				while(cx_ite != null) {
					var g = cx_ite;
					var l = li;
					li = li.next;
					g.x = this.body.posx + (this.body.axisy * l.x - this.body.axisx * l.y);
					g.y = this.body.posy + (l.x * this.body.axisx + l.y * this.body.axisy);
					cx_ite = cx_ite.next;
				}
			}
		}
	}
	,validate_gaxi: function() {
		if(this.zip_gaxi) {
			if(this.body != null) {
				this.zip_gaxi = false;
				this.validate_laxi();
				this.body.validate_axis();
				this.validate_gverts();
				var ite = this.edges.head;
				var cx_ite = this.gverts.next;
				var u = cx_ite;
				cx_ite = cx_ite.next;
				while(cx_ite != null) {
					var v1 = cx_ite;
					var e = ite.elt;
					ite = ite.next;
					e.gp0 = u;
					e.gp1 = v1;
					e.gnormx = this.body.axisy * e.lnormx - this.body.axisx * e.lnormy;
					e.gnormy = e.lnormx * this.body.axisx + e.lnormy * this.body.axisy;
					e.gprojection = this.body.posx * e.gnormx + this.body.posy * e.gnormy + e.lprojection;
					if(e.wrap_gnorm != null) {
						e.wrap_gnorm.zpp_inner.x = e.gnormx;
						e.wrap_gnorm.zpp_inner.y = e.gnormy;
					}
					e.tp0 = e.gp0.y * e.gnormx - e.gp0.x * e.gnormy;
					e.tp1 = e.gp1.y * e.gnormx - e.gp1.x * e.gnormy;
					u = v1;
					cx_ite = cx_ite.next;
				}
				var v = this.gverts.next;
				var e1 = ite.elt;
				ite = ite.next;
				e1.gp0 = u;
				e1.gp1 = v;
				e1.gnormx = this.body.axisy * e1.lnormx - this.body.axisx * e1.lnormy;
				e1.gnormy = e1.lnormx * this.body.axisx + e1.lnormy * this.body.axisy;
				e1.gprojection = this.body.posx * e1.gnormx + this.body.posy * e1.gnormy + e1.lprojection;
				if(e1.wrap_gnorm != null) {
					e1.wrap_gnorm.zpp_inner.x = e1.gnormx;
					e1.wrap_gnorm.zpp_inner.y = e1.gnormy;
				}
				e1.tp0 = e1.gp0.y * e1.gnormx - e1.gp0.x * e1.gnormy;
				e1.tp1 = e1.gp1.y * e1.gnormx - e1.gp1.x * e1.gnormy;
			}
		}
	}
	,__validate_aabb: function() {
		this.validate_gverts();
		if(this.lverts.next == null) throw new js__$Boot_HaxeError("Error: An empty polygon has no meaningful bounds");
		var p0 = this.gverts.next;
		this.aabb.minx = p0.x;
		this.aabb.miny = p0.y;
		this.aabb.maxx = p0.x;
		this.aabb.maxy = p0.y;
		var cx_ite = this.gverts.next.next;
		while(cx_ite != null) {
			var p = cx_ite;
			if(p.x < this.aabb.minx) this.aabb.minx = p.x;
			if(p.x > this.aabb.maxx) this.aabb.maxx = p.x;
			if(p.y < this.aabb.miny) this.aabb.miny = p.y;
			if(p.y > this.aabb.maxy) this.aabb.maxy = p.y;
			cx_ite = cx_ite.next;
		}
	}
	,_force_validate_aabb: function() {
		var li = this.lverts.next;
		var p0 = this.gverts.next;
		var l = li;
		li = li.next;
		p0.x = this.body.posx + (this.body.axisy * l.x - this.body.axisx * l.y);
		p0.y = this.body.posy + (l.x * this.body.axisx + l.y * this.body.axisy);
		this.aabb.minx = p0.x;
		this.aabb.miny = p0.y;
		this.aabb.maxx = p0.x;
		this.aabb.maxy = p0.y;
		var cx_ite = this.gverts.next.next;
		while(cx_ite != null) {
			var p = cx_ite;
			var l1 = li;
			li = li.next;
			p.x = this.body.posx + (this.body.axisy * l1.x - this.body.axisx * l1.y);
			p.y = this.body.posy + (l1.x * this.body.axisx + l1.y * this.body.axisy);
			if(p.x < this.aabb.minx) this.aabb.minx = p.x;
			if(p.x > this.aabb.maxx) this.aabb.maxx = p.x;
			if(p.y < this.aabb.miny) this.aabb.miny = p.y;
			if(p.y > this.aabb.maxy) this.aabb.maxy = p.y;
			cx_ite = cx_ite.next;
		}
	}
	,__validate_sweepRadius: function() {
		var maxRadius = 0.0;
		var minRadius = 0.0;
		this.validate_laxi();
		var cx_ite = this.lverts.next;
		while(cx_ite != null) {
			var x = cx_ite;
			var r = x.x * x.x + x.y * x.y;
			if(r > maxRadius) maxRadius = r;
			cx_ite = cx_ite.next;
		}
		var cx_ite1 = this.edges.head;
		while(cx_ite1 != null) {
			var e = cx_ite1.elt;
			if(e.lprojection < minRadius) {
				minRadius = e.lprojection;
				if(minRadius < 0) break;
			}
			cx_ite1 = cx_ite1.next;
		}
		if(minRadius < 0) minRadius = 0;
		this.sweepRadius = Math.sqrt(maxRadius);
		this.sweepCoef = this.sweepRadius - minRadius;
	}
	,__validate_area_inertia: function() {
		if(this.lverts.next == null || this.lverts.next.next == null || this.lverts.next.next.next == null) {
			this.area = 0;
			this.inertia = 0;
		} else {
			this.area = 0.0;
			var s1 = 0.0;
			var s2 = 0.0;
			var cx_ite = this.lverts.next;
			var u = cx_ite;
			cx_ite = cx_ite.next;
			var v = cx_ite;
			cx_ite = cx_ite.next;
			while(cx_ite != null) {
				var w2 = cx_ite;
				var a = v.y * u.x - v.x * u.y;
				var b = v.x * v.x + v.y * v.y + (v.x * u.x + v.y * u.y) + (u.x * u.x + u.y * u.y);
				s1 += a * b;
				s2 += a;
				this.area += v.x * (w2.y - u.y);
				u = v;
				v = w2;
				cx_ite = cx_ite.next;
			}
			cx_ite = this.lverts.next;
			var w = cx_ite;
			var a1 = v.y * u.x - v.x * u.y;
			var b1 = v.x * v.x + v.y * v.y + (v.x * u.x + v.y * u.y) + (u.x * u.x + u.y * u.y);
			s1 += a1 * b1;
			s2 += a1;
			this.area += v.x * (w.y - u.y);
			u = v;
			v = w;
			cx_ite = cx_ite.next;
			var w1 = cx_ite;
			var a2 = v.y * u.x - v.x * u.y;
			var b2 = v.x * v.x + v.y * v.y + (v.x * u.x + v.y * u.y) + (u.x * u.x + u.y * u.y);
			s1 += a2 * b2;
			s2 += a2;
			this.area += v.x * (w1.y - u.y);
			this.inertia = s1 / (6 * s2);
			this.area *= 0.5;
			if(this.area < 0) {
				this.area = -this.area;
				this.reverse_vertices();
			}
		}
	}
	,__validate_angDrag: function() {
		if(this.lverts.length < 3) throw new js__$Boot_HaxeError("Error: Polygon's with less than 3 vertices have no meaningful angDrag");
		this.validate_area_inertia();
		this.validate_laxi();
		var accum = 0.0;
		var ei = this.edges.head;
		var perim = 0.0;
		var cx_cont = true;
		var cx_itei = this.lverts.next;
		var u = cx_itei;
		var cx_itej = cx_itei.next;
		while(cx_itej != null) {
			var v = cx_itej;
			var edge = ei.elt;
			ei = ei.next;
			perim += edge.length;
			var dx = 0.0;
			var dy = 0.0;
			dx = v.x - u.x;
			dy = v.y - u.y;
			accum += edge.length * nape_Config.fluidAngularDragFriction * this.material.dynamicFriction * edge.lprojection * edge.lprojection;
			var t = -(u.y * edge.lnormx - u.x * edge.lnormy) / (dy * edge.lnormx - dx * edge.lnormy);
			if(t > 0) {
				var ta;
				if(t > 1) ta = 1; else ta = t;
				var cx = 0.0;
				var cy = 0.0;
				cx = u.x;
				cy = u.y;
				var t1 = ta;
				cx += dx * t1;
				cy += dy * t1;
				var dota = edge.lnormy * u.x - edge.lnormx * u.y;
				var dotb = edge.lnormy * cx - edge.lnormx * cy;
				var dots = (dotb * dotb * dotb - dota * dota * dota) / (3 * (dotb - dota));
				accum += dots * ta * edge.length * nape_Config.fluidAngularDrag;
			}
			if(t < 1) {
				var tb;
				if(t < 0) tb = 0; else tb = t;
				var cx1 = 0.0;
				var cy1 = 0.0;
				cx1 = u.x;
				cy1 = u.y;
				var t2 = tb;
				cx1 += dx * t2;
				cy1 += dy * t2;
				var dota1 = edge.lnormy * cx1 - edge.lnormx * cy1;
				var dotb1 = edge.lnormy * v.x - edge.lnormx * v.y;
				var dots1 = (dotb1 * dotb1 * dotb1 - dota1 * dota1 * dota1) / (3 * (dotb1 - dota1));
				accum += dots1 * nape_Config.fluidVacuumDrag * (1 - tb) * edge.length * nape_Config.fluidAngularDrag;
			}
			cx_itei = cx_itej;
			u = v;
			cx_itej = cx_itej.next;
		}
		if(cx_cont) do {
			cx_itej = this.lverts.next;
			var v1 = cx_itej;
			var edge1 = ei.elt;
			ei = ei.next;
			perim += edge1.length;
			var dx1 = 0.0;
			var dy1 = 0.0;
			dx1 = v1.x - u.x;
			dy1 = v1.y - u.y;
			accum += edge1.length * nape_Config.fluidAngularDragFriction * this.material.dynamicFriction * edge1.lprojection * edge1.lprojection;
			var t3 = -(u.y * edge1.lnormx - u.x * edge1.lnormy) / (dy1 * edge1.lnormx - dx1 * edge1.lnormy);
			if(t3 > 0) {
				var ta1;
				if(t3 > 1) ta1 = 1; else ta1 = t3;
				var cx2 = 0.0;
				var cy2 = 0.0;
				cx2 = u.x;
				cy2 = u.y;
				var t4 = ta1;
				cx2 += dx1 * t4;
				cy2 += dy1 * t4;
				var dota2 = edge1.lnormy * u.x - edge1.lnormx * u.y;
				var dotb2 = edge1.lnormy * cx2 - edge1.lnormx * cy2;
				var dots2 = (dotb2 * dotb2 * dotb2 - dota2 * dota2 * dota2) / (3 * (dotb2 - dota2));
				accum += dots2 * ta1 * edge1.length * nape_Config.fluidAngularDrag;
			}
			if(t3 < 1) {
				var tb1;
				if(t3 < 0) tb1 = 0; else tb1 = t3;
				var cx3 = 0.0;
				var cy3 = 0.0;
				cx3 = u.x;
				cy3 = u.y;
				var t5 = tb1;
				cx3 += dx1 * t5;
				cy3 += dy1 * t5;
				var dota3 = edge1.lnormy * cx3 - edge1.lnormx * cy3;
				var dotb3 = edge1.lnormy * v1.x - edge1.lnormx * v1.y;
				var dots3 = (dotb3 * dotb3 * dotb3 - dota3 * dota3 * dota3) / (3 * (dotb3 - dota3));
				accum += dots3 * nape_Config.fluidVacuumDrag * (1 - tb1) * edge1.length * nape_Config.fluidAngularDrag;
			}
		} while(false);
		this.angDrag = accum / (this.inertia * perim);
	}
	,__validate_localCOM: function() {
		if(this.lverts.next == null) throw new js__$Boot_HaxeError("Error: An empty polygon has no meaningful localCOM");
		if(this.lverts.next.next == null) {
			this.localCOMx = this.lverts.next.x;
			this.localCOMy = this.lverts.next.y;
		} else if(this.lverts.next.next.next == null) {
			this.localCOMx = this.lverts.next.x;
			this.localCOMy = this.lverts.next.y;
			var t = 1.0;
			this.localCOMx += this.lverts.next.next.x * t;
			this.localCOMy += this.lverts.next.next.y * t;
			var t1 = 0.5;
			this.localCOMx *= t1;
			this.localCOMy *= t1;
		} else {
			this.localCOMx = 0;
			this.localCOMy = 0;
			var area = 0.0;
			var cx_ite = this.lverts.next;
			var u = cx_ite;
			cx_ite = cx_ite.next;
			var v = cx_ite;
			cx_ite = cx_ite.next;
			while(cx_ite != null) {
				var w2 = cx_ite;
				area += v.x * (w2.y - u.y);
				var cf = w2.y * v.x - w2.x * v.y;
				this.localCOMx += (v.x + w2.x) * cf;
				this.localCOMy += (v.y + w2.y) * cf;
				u = v;
				v = w2;
				cx_ite = cx_ite.next;
			}
			cx_ite = this.lverts.next;
			var w = cx_ite;
			area += v.x * (w.y - u.y);
			var cf1 = w.y * v.x - w.x * v.y;
			this.localCOMx += (v.x + w.x) * cf1;
			this.localCOMy += (v.y + w.y) * cf1;
			u = v;
			v = w;
			cx_ite = cx_ite.next;
			var w1 = cx_ite;
			area += v.x * (w1.y - u.y);
			var cf2 = w1.y * v.x - w1.x * v.y;
			this.localCOMx += (v.x + w1.x) * cf2;
			this.localCOMy += (v.y + w1.y) * cf2;
			area = 1 / (3 * area);
			var t2 = area;
			this.localCOMx *= t2;
			this.localCOMy *= t2;
		}
	}
	,__class__: zpp_$nape_shape_ZPP_$Polygon
});
var zpp_$nape_space_ZPP_$Broadphase = function() {
	this.dynab = null;
	this.sweep = null;
	this.is_sweep = false;
	this.space = null;
};
zpp_$nape_space_ZPP_$Broadphase.__name__ = true;
zpp_$nape_space_ZPP_$Broadphase.prototype = {
	insert: function(shape) {
		if(this.is_sweep) this.sweep.__insert(shape); else this.dynab.__insert(shape);
	}
	,remove: function(shape) {
		if(this.is_sweep) this.sweep.__remove(shape); else this.dynab.__remove(shape);
	}
	,sync: function(shape) {
		if(this.is_sweep) {
			if(!this.sweep.space.continuous) {
				if(shape.zip_aabb) {
					if(shape.body != null) {
						shape.zip_aabb = false;
						if(shape.type == 0) shape.circle.__validate_aabb(); else shape.polygon.__validate_aabb();
					}
				}
			}
		} else this.dynab.__sync(shape);
	}
	,broadphase: function(space,discrete) {
	}
	,__class__: zpp_$nape_space_ZPP_$Broadphase
};
var zpp_$nape_space_ZPP_$AABBNode = function() {
	this.first_sync = false;
	this.synced = false;
	this.snext = null;
	this.moved = false;
	this.mnext = null;
	this.next = null;
	this.height = 0;
	this.child2 = null;
	this.child1 = null;
	this.parent = null;
	this.dyn = false;
	this.shape = null;
	this.aabb = null;
	this.height = -1;
};
zpp_$nape_space_ZPP_$AABBNode.__name__ = true;
zpp_$nape_space_ZPP_$AABBNode.prototype = {
	free: function() {
		this.height = -1;
		var o = this.aabb;
		if(o.outer != null) {
			o.outer.zpp_inner = null;
			o.outer = null;
		}
		o.wrap_min = o.wrap_max = null;
		o._invalidate = null;
		o._validate = null;
		o.next = zpp_$nape_geom_ZPP_$AABB.zpp_pool;
		zpp_$nape_geom_ZPP_$AABB.zpp_pool = o;
		this.child1 = this.child2 = this.parent = null;
		this.next = null;
		this.snext = null;
		this.mnext = null;
	}
	,__class__: zpp_$nape_space_ZPP_$AABBNode
};
var zpp_$nape_space_ZPP_$AABBPair = function() {
	this.next = null;
	this.arb = null;
	this.di = 0;
	this.id = 0;
	this.sleeping = false;
	this.first = false;
	this.n2 = null;
	this.n1 = null;
};
zpp_$nape_space_ZPP_$AABBPair.__name__ = true;
zpp_$nape_space_ZPP_$AABBPair.prototype = {
	__class__: zpp_$nape_space_ZPP_$AABBPair
};
var zpp_$nape_space_ZPP_$AABBTree = function() {
	this.root = null;
};
zpp_$nape_space_ZPP_$AABBTree.__name__ = true;
zpp_$nape_space_ZPP_$AABBTree.prototype = {
	inlined_insertLeaf: function(leaf) {
		if(this.root == null) {
			this.root = leaf;
			this.root.parent = null;
		} else {
			var leafaabb = leaf.aabb;
			var node = this.root;
			while(!(node.child1 == null)) {
				var child1 = node.child1;
				var child2 = node.child2;
				var area = node.aabb.perimeter();
				zpp_$nape_space_ZPP_$AABBTree.tmpaabb.setCombine(node.aabb,leafaabb);
				var carea = zpp_$nape_space_ZPP_$AABBTree.tmpaabb.perimeter();
				var cost = 2 * carea;
				var icost = 2 * (carea - area);
				var cost1;
				zpp_$nape_space_ZPP_$AABBTree.tmpaabb.setCombine(leafaabb,child1.aabb);
				if(child1.child1 == null) cost1 = zpp_$nape_space_ZPP_$AABBTree.tmpaabb.perimeter() + icost; else {
					var oarea = child1.aabb.perimeter();
					var narea = zpp_$nape_space_ZPP_$AABBTree.tmpaabb.perimeter();
					cost1 = narea - oarea + icost;
				}
				var cost2;
				zpp_$nape_space_ZPP_$AABBTree.tmpaabb.setCombine(leafaabb,child2.aabb);
				if(child2.child1 == null) cost2 = zpp_$nape_space_ZPP_$AABBTree.tmpaabb.perimeter() + icost; else {
					var oarea1 = child2.aabb.perimeter();
					var narea1 = zpp_$nape_space_ZPP_$AABBTree.tmpaabb.perimeter();
					cost2 = narea1 - oarea1 + icost;
				}
				if(cost < cost1 && cost < cost2) break; else if(cost1 < cost2) node = child1; else node = child2;
			}
			var sibling = node;
			var oparent = sibling.parent;
			var nparent;
			if(zpp_$nape_space_ZPP_$AABBNode.zpp_pool == null) nparent = new zpp_$nape_space_ZPP_$AABBNode(); else {
				nparent = zpp_$nape_space_ZPP_$AABBNode.zpp_pool;
				zpp_$nape_space_ZPP_$AABBNode.zpp_pool = nparent.next;
				nparent.next = null;
			}
			if(zpp_$nape_geom_ZPP_$AABB.zpp_pool == null) nparent.aabb = new zpp_$nape_geom_ZPP_$AABB(); else {
				nparent.aabb = zpp_$nape_geom_ZPP_$AABB.zpp_pool;
				zpp_$nape_geom_ZPP_$AABB.zpp_pool = nparent.aabb.next;
				nparent.aabb.next = null;
			}
			null;
			nparent.moved = false;
			nparent.synced = false;
			nparent.first_sync = false;
			nparent.parent = oparent;
			nparent.aabb.setCombine(leafaabb,sibling.aabb);
			nparent.height = sibling.height + 1;
			if(oparent != null) {
				if(oparent.child1 == sibling) oparent.child1 = nparent; else oparent.child2 = nparent;
				nparent.child1 = sibling;
				nparent.child2 = leaf;
				sibling.parent = nparent;
				leaf.parent = nparent;
			} else {
				nparent.child1 = sibling;
				nparent.child2 = leaf;
				sibling.parent = nparent;
				leaf.parent = nparent;
				this.root = nparent;
			}
			node = leaf.parent;
			while(node != null) {
				node = this.balance(node);
				var child11 = node.child1;
				var child21 = node.child2;
				node.height = 1 + (function($this) {
					var $r;
					var x = child11.height;
					var y = child21.height;
					$r = x > y?x:y;
					return $r;
				}(this));
				node.aabb.setCombine(child11.aabb,child21.aabb);
				node = node.parent;
			}
		}
	}
	,removeLeaf: function(leaf) {
		this.inlined_removeLeaf(leaf);
	}
	,inlined_removeLeaf: function(leaf) {
		if(leaf == this.root) {
			this.root = null;
			return;
		} else {
			var parent = leaf.parent;
			var gparent = parent.parent;
			var sibling;
			if(parent.child1 == leaf) sibling = parent.child2; else sibling = parent.child1;
			if(gparent != null) {
				if(gparent.child1 == parent) gparent.child1 = sibling; else gparent.child2 = sibling;
				sibling.parent = gparent;
				var o = parent;
				o.free();
				o.next = zpp_$nape_space_ZPP_$AABBNode.zpp_pool;
				zpp_$nape_space_ZPP_$AABBNode.zpp_pool = o;
				var node = gparent;
				while(node != null) {
					node = this.balance(node);
					var child1 = node.child1;
					var child2 = node.child2;
					node.aabb.setCombine(child1.aabb,child2.aabb);
					node.height = 1 + (function($this) {
						var $r;
						var x = child1.height;
						var y = child2.height;
						$r = x > y?x:y;
						return $r;
					}(this));
					node = node.parent;
				}
			} else {
				this.root = sibling;
				sibling.parent = null;
				var o1 = parent;
				o1.free();
				o1.next = zpp_$nape_space_ZPP_$AABBNode.zpp_pool;
				zpp_$nape_space_ZPP_$AABBNode.zpp_pool = o1;
			}
		}
	}
	,balance: function(a) {
		if(a.child1 == null || a.height < 2) return a; else {
			var b = a.child1;
			var c = a.child2;
			var balance = c.height - b.height;
			if(balance > 1) {
				var f = c.child1;
				var g = c.child2;
				c.child1 = a;
				c.parent = a.parent;
				a.parent = c;
				if(c.parent != null) {
					if(c.parent.child1 == a) c.parent.child1 = c; else c.parent.child2 = c;
				} else this.root = c;
				if(f.height > g.height) {
					c.child2 = f;
					a.child2 = g;
					g.parent = a;
					a.aabb.setCombine(b.aabb,g.aabb);
					c.aabb.setCombine(a.aabb,f.aabb);
					a.height = 1 + (function($this) {
						var $r;
						var x = b.height;
						var y = g.height;
						$r = x > y?x:y;
						return $r;
					}(this));
					c.height = 1 + (function($this) {
						var $r;
						var x1 = a.height;
						var y1 = f.height;
						$r = x1 > y1?x1:y1;
						return $r;
					}(this));
				} else {
					c.child2 = g;
					a.child2 = f;
					f.parent = a;
					a.aabb.setCombine(b.aabb,f.aabb);
					c.aabb.setCombine(a.aabb,g.aabb);
					a.height = 1 + (function($this) {
						var $r;
						var x2 = b.height;
						var y2 = f.height;
						$r = x2 > y2?x2:y2;
						return $r;
					}(this));
					c.height = 1 + (function($this) {
						var $r;
						var x3 = a.height;
						var y3 = g.height;
						$r = x3 > y3?x3:y3;
						return $r;
					}(this));
				}
				return c;
			} else if(balance < -1) {
				var f1 = b.child1;
				var g1 = b.child2;
				b.child1 = a;
				b.parent = a.parent;
				a.parent = b;
				if(b.parent != null) {
					if(b.parent.child1 == a) b.parent.child1 = b; else b.parent.child2 = b;
				} else this.root = b;
				if(f1.height > g1.height) {
					b.child2 = f1;
					a.child1 = g1;
					g1.parent = a;
					a.aabb.setCombine(c.aabb,g1.aabb);
					b.aabb.setCombine(a.aabb,f1.aabb);
					a.height = 1 + (function($this) {
						var $r;
						var x4 = c.height;
						var y4 = g1.height;
						$r = x4 > y4?x4:y4;
						return $r;
					}(this));
					b.height = 1 + (function($this) {
						var $r;
						var x5 = a.height;
						var y5 = f1.height;
						$r = x5 > y5?x5:y5;
						return $r;
					}(this));
				} else {
					b.child2 = g1;
					a.child1 = f1;
					f1.parent = a;
					a.aabb.setCombine(c.aabb,f1.aabb);
					b.aabb.setCombine(a.aabb,g1.aabb);
					a.height = 1 + (function($this) {
						var $r;
						var x6 = c.height;
						var y6 = f1.height;
						$r = x6 > y6?x6:y6;
						return $r;
					}(this));
					b.height = 1 + (function($this) {
						var $r;
						var x7 = a.height;
						var y7 = g1.height;
						$r = x7 > y7?x7:y7;
						return $r;
					}(this));
				}
				return b;
			} else return a;
		}
	}
	,__class__: zpp_$nape_space_ZPP_$AABBTree
};
var zpp_$nape_space_ZPP_$DynAABBPhase = function(space) {
	this.moves = null;
	this.syncs = null;
	this.pairs = null;
	this.dtree = null;
	this.stree = null;
	zpp_$nape_space_ZPP_$Broadphase.call(this);
	this.space = space;
	this.is_sweep = false;
	this.dynab = this;
	this.stree = new zpp_$nape_space_ZPP_$AABBTree();
	this.dtree = new zpp_$nape_space_ZPP_$AABBTree();
};
zpp_$nape_space_ZPP_$DynAABBPhase.__name__ = true;
zpp_$nape_space_ZPP_$DynAABBPhase.__super__ = zpp_$nape_space_ZPP_$Broadphase;
zpp_$nape_space_ZPP_$DynAABBPhase.prototype = $extend(zpp_$nape_space_ZPP_$Broadphase.prototype,{
	__insert: function(shape) {
		var node;
		if(zpp_$nape_space_ZPP_$AABBNode.zpp_pool == null) node = new zpp_$nape_space_ZPP_$AABBNode(); else {
			node = zpp_$nape_space_ZPP_$AABBNode.zpp_pool;
			zpp_$nape_space_ZPP_$AABBNode.zpp_pool = node.next;
			node.next = null;
		}
		if(zpp_$nape_geom_ZPP_$AABB.zpp_pool == null) node.aabb = new zpp_$nape_geom_ZPP_$AABB(); else {
			node.aabb = zpp_$nape_geom_ZPP_$AABB.zpp_pool;
			zpp_$nape_geom_ZPP_$AABB.zpp_pool = node.aabb.next;
			node.aabb.next = null;
		}
		null;
		node.moved = false;
		node.synced = false;
		node.first_sync = false;
		node.shape = shape;
		shape.node = node;
		node.synced = true;
		node.first_sync = true;
		node.snext = this.syncs;
		this.syncs = node;
	}
	,__remove: function(shape) {
		var node = shape.node;
		if(!node.first_sync) {
			if(node.dyn) this.dtree.removeLeaf(node); else this.stree.removeLeaf(node);
		}
		shape.node = null;
		if(node.synced) {
			var pre1 = null;
			var cur1 = this.syncs;
			while(cur1 != null) {
				if(cur1 == node) break;
				pre1 = cur1;
				cur1 = cur1.snext;
			}
			if(pre1 == null) this.syncs = cur1.snext; else pre1.snext = cur1.snext;
			cur1.snext = null;
			node.synced = false;
		}
		if(node.moved) {
			var pre2 = null;
			var cur2 = this.moves;
			while(cur2 != null) {
				if(cur2 == node) break;
				pre2 = cur2;
				cur2 = cur2.mnext;
			}
			if(pre2 == null) this.moves = cur2.mnext; else pre2.mnext = cur2.mnext;
			cur2.mnext = null;
			node.moved = false;
		}
		var pre = null;
		var cur = this.pairs;
		while(cur != null) {
			var nxt = cur.next;
			if(cur.n1 == node || cur.n2 == node) {
				if(pre == null) this.pairs = nxt; else pre.next = nxt;
				if(cur.arb != null) cur.arb.pair = null;
				cur.arb = null;
				cur.n1.shape.pairs.remove(cur);
				cur.n2.shape.pairs.remove(cur);
				var o = cur;
				o.n1 = o.n2 = null;
				o.sleeping = false;
				o.next = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
				zpp_$nape_space_ZPP_$AABBPair.zpp_pool = o;
				cur = nxt;
				continue;
			}
			pre = cur;
			cur = nxt;
		}
		while(!(shape.pairs.head == null)) {
			var cur3 = shape.pairs.pop_unsafe();
			if(cur3.n1 == node) cur3.n2.shape.pairs.remove(cur3); else cur3.n1.shape.pairs.remove(cur3);
			if(cur3.arb != null) cur3.arb.pair = null;
			cur3.arb = null;
			var o1 = cur3;
			o1.n1 = o1.n2 = null;
			o1.sleeping = false;
			o1.next = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
			zpp_$nape_space_ZPP_$AABBPair.zpp_pool = o1;
		}
		var o2 = node;
		o2.free();
		o2.next = zpp_$nape_space_ZPP_$AABBNode.zpp_pool;
		zpp_$nape_space_ZPP_$AABBNode.zpp_pool = o2;
	}
	,__sync: function(shape) {
		var node = shape.node;
		if(!node.synced) {
			if(!this.space.continuous) {
				if(shape.zip_aabb) {
					if(shape.body != null) {
						shape.zip_aabb = false;
						if(shape.type == 0) shape.circle.__validate_aabb(); else shape.polygon.__validate_aabb();
					}
				}
			}
			var sync;
			sync = node.dyn != (shape.body.type == 1?false:!shape.body.component.sleeping) || !node.aabb.contains(shape.aabb);
			if(sync) {
				node.synced = true;
				node.snext = this.syncs;
				this.syncs = node;
			}
		}
	}
	,broadphase: function(space,discrete) {
		var node = this.syncs;
		while(node != null) {
			var shape = node.shape;
			if(!node.first_sync) {
				var tree1;
				if(node.dyn) tree1 = this.dtree; else tree1 = this.stree;
				tree1.inlined_removeLeaf(node);
			} else node.first_sync = false;
			var aabb = node.aabb;
			if(!space.continuous) {
				if(shape.zip_aabb) {
					if(shape.body != null) {
						shape.zip_aabb = false;
						if(shape.type == 0) shape.circle.__validate_aabb(); else shape.polygon.__validate_aabb();
					}
				}
			}
			aabb.setExpand(shape.aabb,3.0);
			var tree;
			if(shape.body.type == 1?node.dyn = false:node.dyn = !shape.body.component.sleeping) tree = this.dtree; else tree = this.stree;
			tree.inlined_insertLeaf(node);
			node.synced = false;
			node = node.snext;
		}
		while(this.syncs != null) {
			var leaf;
			var ret = this.syncs;
			this.syncs = ret.snext;
			ret.snext = null;
			leaf = ret;
			if(leaf.moved) continue;
			leaf.moved = false;
			var lshape = leaf.shape;
			var lbody = lshape.body;
			if(lbody.component.sleeping) continue;
			var ab = leaf.aabb;
			var stack = null;
			if(this.dtree.root != null) {
				this.dtree.root.next = stack;
				stack = this.dtree.root;
			}
			while(stack != null) {
				var node1;
				var ret1 = stack;
				stack = ret1.next;
				ret1.next = null;
				node1 = ret1;
				if(node1 == leaf) continue;
				if(node1.child1 == null) {
					var shape1 = node1.shape;
					if(shape1.body != lshape.body && !(shape1.body.type == 1 && lshape.body.type == 1)) {
						if(ab.intersect(node1.aabb)) {
							var id;
							var di;
							if(lshape.id < shape1.id) {
								id = lshape.id;
								di = shape1.id;
							} else {
								id = shape1.id;
								di = lshape.id;
							}
							var s;
							if(lshape.pairs.length < shape1.pairs.length) s = lshape; else s = shape1;
							var p = null;
							var cx_ite = s.pairs.head;
							while(cx_ite != null) {
								var px = cx_ite.elt;
								if(px.id == id && px.di == di) {
									p = px;
									break;
								}
								cx_ite = cx_ite.next;
							}
							if(p != null) {
								if(p.sleeping) {
									p.sleeping = false;
									p.next = this.pairs;
									this.pairs = p;
									p.first = true;
								}
								continue;
							}
							if(zpp_$nape_space_ZPP_$AABBPair.zpp_pool == null) p = new zpp_$nape_space_ZPP_$AABBPair(); else {
								p = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
								zpp_$nape_space_ZPP_$AABBPair.zpp_pool = p.next;
								p.next = null;
							}
							null;
							p.n1 = leaf;
							p.n2 = node1;
							p.id = id;
							p.di = di;
							p.next = this.pairs;
							this.pairs = p;
							p.first = true;
							lshape.pairs.inlined_add(p);
							shape1.pairs.inlined_add(p);
						}
					}
				} else if(ab.intersect(node1.aabb)) {
					if(node1.child1 != null) {
						node1.child1.next = stack;
						stack = node1.child1;
					}
					if(node1.child2 != null) {
						node1.child2.next = stack;
						stack = node1.child2;
					}
				}
			}
			if(this.stree.root != null) {
				this.stree.root.next = stack;
				stack = this.stree.root;
			}
			while(stack != null) {
				var node2;
				var ret2 = stack;
				stack = ret2.next;
				ret2.next = null;
				node2 = ret2;
				if(node2 == leaf) continue;
				if(node2.child1 == null) {
					var shape2 = node2.shape;
					if(shape2.body != lshape.body && !(shape2.body.type == 1 && lshape.body.type == 1)) {
						if(ab.intersect(node2.aabb)) {
							var id1;
							var di1;
							if(lshape.id < shape2.id) {
								id1 = lshape.id;
								di1 = shape2.id;
							} else {
								id1 = shape2.id;
								di1 = lshape.id;
							}
							var s1;
							if(lshape.pairs.length < shape2.pairs.length) s1 = lshape; else s1 = shape2;
							var p1 = null;
							var cx_ite1 = s1.pairs.head;
							while(cx_ite1 != null) {
								var px1 = cx_ite1.elt;
								if(px1.id == id1 && px1.di == di1) {
									p1 = px1;
									break;
								}
								cx_ite1 = cx_ite1.next;
							}
							if(p1 != null) {
								if(p1.sleeping) {
									p1.sleeping = false;
									p1.next = this.pairs;
									this.pairs = p1;
									p1.first = true;
								}
								continue;
							}
							if(zpp_$nape_space_ZPP_$AABBPair.zpp_pool == null) p1 = new zpp_$nape_space_ZPP_$AABBPair(); else {
								p1 = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
								zpp_$nape_space_ZPP_$AABBPair.zpp_pool = p1.next;
								p1.next = null;
							}
							null;
							p1.n1 = leaf;
							p1.n2 = node2;
							p1.id = id1;
							p1.di = di1;
							p1.next = this.pairs;
							this.pairs = p1;
							p1.first = true;
							lshape.pairs.inlined_add(p1);
							shape2.pairs.inlined_add(p1);
						}
					}
				} else if(ab.intersect(node2.aabb)) {
					if(node2.child1 != null) {
						node2.child1.next = stack;
						stack = node2.child1;
					}
					if(node2.child2 != null) {
						node2.child2.next = stack;
						stack = node2.child2;
					}
				}
			}
		}
		while(this.moves != null) {
			var leaf1;
			var ret3 = this.moves;
			this.moves = ret3.mnext;
			ret3.mnext = null;
			leaf1 = ret3;
			leaf1.moved = false;
			var lshape1 = leaf1.shape;
			var lbody1 = lshape1.body;
			if(lbody1.component.sleeping) continue;
			var ab1 = leaf1.aabb;
			var stack1 = null;
			if(this.dtree.root != null) {
				this.dtree.root.next = stack1;
				stack1 = this.dtree.root;
			}
			while(stack1 != null) {
				var node3;
				var ret4 = stack1;
				stack1 = ret4.next;
				ret4.next = null;
				node3 = ret4;
				if(node3 == leaf1) continue;
				if(node3.child1 == null) {
					var shape3 = node3.shape;
					if(shape3.body != lshape1.body && !(shape3.body.type == 1 && lshape1.body.type == 1)) {
						if(ab1.intersect(node3.aabb)) {
							var id2;
							var di2;
							if(lshape1.id < shape3.id) {
								id2 = lshape1.id;
								di2 = shape3.id;
							} else {
								id2 = shape3.id;
								di2 = lshape1.id;
							}
							var s2;
							if(lshape1.pairs.length < shape3.pairs.length) s2 = lshape1; else s2 = shape3;
							var p2 = null;
							var cx_ite2 = s2.pairs.head;
							while(cx_ite2 != null) {
								var px2 = cx_ite2.elt;
								if(px2.id == id2 && px2.di == di2) {
									p2 = px2;
									break;
								}
								cx_ite2 = cx_ite2.next;
							}
							if(p2 != null) {
								if(p2.sleeping) {
									p2.sleeping = false;
									p2.next = this.pairs;
									this.pairs = p2;
									p2.first = true;
								}
								continue;
							}
							if(zpp_$nape_space_ZPP_$AABBPair.zpp_pool == null) p2 = new zpp_$nape_space_ZPP_$AABBPair(); else {
								p2 = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
								zpp_$nape_space_ZPP_$AABBPair.zpp_pool = p2.next;
								p2.next = null;
							}
							null;
							p2.n1 = leaf1;
							p2.n2 = node3;
							p2.id = id2;
							p2.di = di2;
							p2.next = this.pairs;
							this.pairs = p2;
							p2.first = true;
							lshape1.pairs.inlined_add(p2);
							shape3.pairs.inlined_add(p2);
						}
					}
				} else if(ab1.intersect(node3.aabb)) {
					if(node3.child1 != null) {
						node3.child1.next = stack1;
						stack1 = node3.child1;
					}
					if(node3.child2 != null) {
						node3.child2.next = stack1;
						stack1 = node3.child2;
					}
				}
			}
			if(this.stree.root != null) {
				this.stree.root.next = stack1;
				stack1 = this.stree.root;
			}
			while(stack1 != null) {
				var node4;
				var ret5 = stack1;
				stack1 = ret5.next;
				ret5.next = null;
				node4 = ret5;
				if(node4 == leaf1) continue;
				if(node4.child1 == null) {
					var shape4 = node4.shape;
					if(shape4.body != lshape1.body && !(shape4.body.type == 1 && lshape1.body.type == 1)) {
						if(ab1.intersect(node4.aabb)) {
							var id3;
							var di3;
							if(lshape1.id < shape4.id) {
								id3 = lshape1.id;
								di3 = shape4.id;
							} else {
								id3 = shape4.id;
								di3 = lshape1.id;
							}
							var s3;
							if(lshape1.pairs.length < shape4.pairs.length) s3 = lshape1; else s3 = shape4;
							var p3 = null;
							var cx_ite3 = s3.pairs.head;
							while(cx_ite3 != null) {
								var px3 = cx_ite3.elt;
								if(px3.id == id3 && px3.di == di3) {
									p3 = px3;
									break;
								}
								cx_ite3 = cx_ite3.next;
							}
							if(p3 != null) {
								if(p3.sleeping) {
									p3.sleeping = false;
									p3.next = this.pairs;
									this.pairs = p3;
									p3.first = true;
								}
								continue;
							}
							if(zpp_$nape_space_ZPP_$AABBPair.zpp_pool == null) p3 = new zpp_$nape_space_ZPP_$AABBPair(); else {
								p3 = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
								zpp_$nape_space_ZPP_$AABBPair.zpp_pool = p3.next;
								p3.next = null;
							}
							null;
							p3.n1 = leaf1;
							p3.n2 = node4;
							p3.id = id3;
							p3.di = di3;
							p3.next = this.pairs;
							this.pairs = p3;
							p3.first = true;
							lshape1.pairs.inlined_add(p3);
							shape4.pairs.inlined_add(p3);
						}
					}
				} else if(ab1.intersect(node4.aabb)) {
					if(node4.child1 != null) {
						node4.child1.next = stack1;
						stack1 = node4.child1;
					}
					if(node4.child2 != null) {
						node4.child2.next = stack1;
						stack1 = node4.child2;
					}
				}
			}
		}
		var pre = null;
		var cur = this.pairs;
		while(cur != null) {
			if(!cur.first && !cur.n1.aabb.intersect(cur.n2.aabb)) {
				if(pre == null) this.pairs = cur.next; else pre.next = cur.next;
				cur.n1.shape.pairs.inlined_try_remove(cur);
				cur.n2.shape.pairs.inlined_try_remove(cur);
				var nxt = cur.next;
				if(cur.arb != null) cur.arb.pair = null;
				cur.arb = null;
				var o = cur;
				o.n1 = o.n2 = null;
				o.sleeping = false;
				o.next = zpp_$nape_space_ZPP_$AABBPair.zpp_pool;
				zpp_$nape_space_ZPP_$AABBPair.zpp_pool = o;
				cur = nxt;
				continue;
			}
			var s11 = cur.n1.shape;
			var b1 = s11.body;
			var s21 = cur.n2.shape;
			var b2 = s21.body;
			if(!cur.first) {
				if((b1.component.sleeping || b1.type == 1) && (b2.component.sleeping || b2.type == 1)) {
					cur.sleeping = true;
					if(pre == null) this.pairs = cur.next; else pre.next = cur.next;
					cur = cur.next;
					continue;
				}
			}
			cur.first = false;
			if(s11.aabb.intersect(s21.aabb)) {
				var oarb = cur.arb;
				if(discrete) cur.arb = space.narrowPhase(s11,s21,!(b1.type == 2) || !(b2.type == 2),cur.arb,false); else cur.arb = space.continuousEvent(s11,s21,!(b1.type == 2) || !(b2.type == 2),cur.arb,false);
				if(cur.arb == null) {
					if(oarb != null) oarb.pair = null;
				} else cur.arb.pair = cur;
			}
			pre = cur;
			cur = cur.next;
		}
	}
	,__class__: zpp_$nape_space_ZPP_$DynAABBPhase
});
var zpp_$nape_space_ZPP_$Island = function() {
	this.waket = 0;
	this.sleep = false;
	this.comps = null;
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this._inuse = false;
	this.next = null;
	this.comps = new zpp_$nape_util_ZNPList_$ZPP_$Component();
};
zpp_$nape_space_ZPP_$Island.__name__ = true;
zpp_$nape_space_ZPP_$Island.prototype = {
	inlined_add: function(o) {
		var temp;
		o._inuse = true;
		temp = o;
		temp.next = this.next;
		this.next = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.next;
		this.next = ret.next;
		ret._inuse = false;
		if(this.next == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,inlined_pop_unsafe: function() {
		var ret = this.next;
		this.pop();
		return ret;
	}
	,__class__: zpp_$nape_space_ZPP_$Island
};
var zpp_$nape_space_ZPP_$Component = function() {
	this.woken = false;
	this.waket = 0;
	this.sleeping = false;
	this.island = null;
	this.constraint = null;
	this.body = null;
	this.isBody = false;
	this.rank = 0;
	this.parent = null;
	this.next = null;
	this.sleeping = false;
	this.island = null;
	this.parent = this;
	this.rank = 0;
	this.woken = false;
};
zpp_$nape_space_ZPP_$Component.__name__ = true;
zpp_$nape_space_ZPP_$Component.prototype = {
	__class__: zpp_$nape_space_ZPP_$Component
};
var zpp_$nape_space_ZPP_$CallbackSet = function() {
	this.lazydel = false;
	this.freed = false;
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this._inuse = false;
	this.next = null;
	this.int2 = null;
	this.int1 = null;
	this.di = 0;
	this.id = 0;
	this.arbiters = new zpp_$nape_util_ZNPList_$ZPP_$Arbiter();
};
zpp_$nape_space_ZPP_$CallbackSet.__name__ = true;
zpp_$nape_space_ZPP_$CallbackSet.get = function(i1,i2) {
	var ret;
	if(zpp_$nape_space_ZPP_$CallbackSet.zpp_pool == null) ret = new zpp_$nape_space_ZPP_$CallbackSet(); else {
		ret = zpp_$nape_space_ZPP_$CallbackSet.zpp_pool;
		zpp_$nape_space_ZPP_$CallbackSet.zpp_pool = ret.next;
		ret.next = null;
	}
	ret.freed = false;
	ret.lazydel = false;
	ret.COLLISIONstate = 1;
	ret.COLLISIONstamp = 0;
	ret.SENSORstate = 1;
	ret.SENSORstamp = 0;
	ret.FLUIDstate = 1;
	ret.FLUIDstamp = 0;
	if(i1.id < i2.id) {
		ret.int1 = i1;
		ret.int2 = i2;
	} else {
		ret.int1 = i2;
		ret.int2 = i1;
	}
	ret.id = ret.int1.id;
	ret.di = ret.int2.id;
	return ret;
};
zpp_$nape_space_ZPP_$CallbackSet.prototype = {
	inlined_add: function(o) {
		var temp;
		o._inuse = true;
		temp = o;
		temp.next = this.next;
		this.next = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.next;
			ret = old.next;
			this.next = ret;
			if(this.next == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		old._inuse = false;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,remove_arb: function(x) {
		this.arbiters.inlined_try_remove(x);
	}
	,empty_arb: function(type) {
		var retvar;
		retvar = true;
		var cx_ite = this.arbiters.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if((x.type & type) == 0) {
				cx_ite = cx_ite.next;
				continue;
			} else {
				retvar = false;
				break;
			}
			cx_ite = cx_ite.next;
		}
		return retvar;
	}
	,sleeping: function() {
		var ret;
		ret = true;
		var cx_ite = this.arbiters.head;
		while(cx_ite != null) {
			var x = cx_ite.elt;
			if(x.sleeping) {
				cx_ite = cx_ite.next;
				continue;
			} else {
				ret = false;
				break;
			}
			cx_ite = cx_ite.next;
		}
		return ret;
	}
	,__class__: zpp_$nape_space_ZPP_$CallbackSet
};
var zpp_$nape_space_ZPP_$CbSetManager = function(space) {
	this.space = null;
	this.cbsets = null;
	if(zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool == null) this.cbsets = new zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet(); else {
		this.cbsets = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool;
		zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool = this.cbsets.next;
		this.cbsets.next = null;
	}
	null;
	this.cbsets.lt = zpp_$nape_callbacks_ZPP_$CbSet.setlt;
	this.space = space;
};
zpp_$nape_space_ZPP_$CbSetManager.__name__ = true;
zpp_$nape_space_ZPP_$CbSetManager.prototype = {
	get: function(cbTypes) {
		if(cbTypes.head == null) return null;
		var fake;
		if(zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool == null) fake = new zpp_$nape_callbacks_ZPP_$CbSet(); else {
			fake = zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool;
			zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool = fake.next;
			fake.next = null;
		}
		null;
		var faketypes = fake.cbTypes;
		fake.cbTypes = cbTypes;
		var res = this.cbsets.find_weak(fake);
		var ret;
		if(res != null) ret = res.data; else {
			var set = zpp_$nape_callbacks_ZPP_$CbSet.get(cbTypes);
			this.cbsets.insert(set);
			set.manager = this;
			ret = set;
		}
		fake.cbTypes = faketypes;
		var o = fake;
		o.free();
		o.next = zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool;
		zpp_$nape_callbacks_ZPP_$CbSet.zpp_pool = o;
		return ret;
	}
	,remove: function(set) {
		this.cbsets.remove(set);
		while(!(set.cbpairs.head == null)) {
			var pair = set.cbpairs.pop_unsafe();
			if(pair.a != pair.b) {
				if(set == pair.a) pair.b.cbpairs.remove(pair); else pair.a.cbpairs.remove(pair);
			}
			var o = pair;
			o.a = o.b = null;
			o.listeners.clear();
			o.next = zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool;
			zpp_$nape_callbacks_ZPP_$CbSetPair.zpp_pool = o;
		}
		set.manager = null;
	}
	,validate: function() {
		if(!this.cbsets.empty()) {
			var set_ite = this.cbsets.parent;
			while(set_ite.prev != null) set_ite = set_ite.prev;
			while(set_ite != null) {
				var cb = set_ite.data;
				cb.validate();
				if(set_ite.next != null) {
					set_ite = set_ite.next;
					while(set_ite.prev != null) set_ite = set_ite.prev;
				} else {
					while(set_ite.parent != null && set_ite == set_ite.parent.next) set_ite = set_ite.parent;
					set_ite = set_ite.parent;
				}
			}
		}
	}
	,pair: function(a,b) {
		var ret = null;
		var pairs;
		if(a.cbpairs.length < b.cbpairs.length) pairs = a.cbpairs; else pairs = b.cbpairs;
		var cx_ite = pairs.head;
		while(cx_ite != null) {
			var p = cx_ite.elt;
			if(p.a == a && p.b == b || p.a == b && p.b == a) {
				ret = p;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(ret == null) {
			ret = zpp_$nape_callbacks_ZPP_$CbSetPair.get(a,b);
			a.cbpairs.add(ret);
			if(b != a) b.cbpairs.add(ret);
		}
		if(ret.zip_listeners) {
			ret.zip_listeners = false;
			ret.__validate();
		}
		return ret;
	}
	,__class__: zpp_$nape_space_ZPP_$CbSetManager
};
var zpp_$nape_space_ZPP_$Space = function(gravity,broadphase) {
	this.prelisteners = null;
	this.precb = null;
	this.continuous = false;
	this.toiEvents = null;
	this.pre_dt = 0.0;
	this.cbsets = null;
	this.callbackset_list = null;
	this.callbacks = null;
	this.wrap_listeners = null;
	this.listeners = null;
	this.islands = null;
	this.staticsleep = null;
	this.wrap_livecon = null;
	this.live_constraints = null;
	this.wrap_live = null;
	this.live = null;
	this.s_arbiters = null;
	this.f_arbiters = null;
	this.c_arbiters_false = null;
	this.c_arbiters_true = null;
	this.sortcontacts = false;
	this.time = 0.0;
	this.midstep = false;
	this.stamp = 0;
	this.global_ang_drag = 0.0;
	this.global_lin_drag = 0.0;
	this.__static = null;
	this.bphase = null;
	this.kinematics = null;
	this.wrap_constraints = null;
	this.constraints = null;
	this.wrap_compounds = null;
	this.compounds = null;
	this.wrap_bodies = null;
	this.bodies = null;
	this.gravityy = 0.0;
	this.gravityx = 0.0;
	this.outer = null;
	this.toiEvents = new zpp_$nape_util_ZNPList_$ZPP_$ToiEvent();
	this.global_lin_drag = 0.015;
	this.global_ang_drag = 0.015;
	zpp_$nape_callbacks_ZPP_$Callback.internal = true;
	this.precb = new nape_callbacks_PreCallback();
	this.precb.zpp_inner = new zpp_$nape_callbacks_ZPP_$Callback();
	zpp_$nape_callbacks_ZPP_$Callback.internal = false;
	this.sortcontacts = true;
	this.pre_dt = 0.0;
	if(broadphase == null || broadphase == (function($this) {
		var $r;
		if(zpp_$nape_util_ZPP_$Flags.Broadphase_DYNAMIC_AABB_TREE == null) {
			zpp_$nape_util_ZPP_$Flags.internal = true;
			zpp_$nape_util_ZPP_$Flags.Broadphase_DYNAMIC_AABB_TREE = new nape_space_Broadphase();
			zpp_$nape_util_ZPP_$Flags.internal = false;
		}
		$r = zpp_$nape_util_ZPP_$Flags.Broadphase_DYNAMIC_AABB_TREE;
		return $r;
	}(this))) this.bphase = new zpp_$nape_space_ZPP_$DynAABBPhase(this); else if(broadphase == (function($this) {
		var $r;
		if(zpp_$nape_util_ZPP_$Flags.Broadphase_SWEEP_AND_PRUNE == null) {
			zpp_$nape_util_ZPP_$Flags.internal = true;
			zpp_$nape_util_ZPP_$Flags.Broadphase_SWEEP_AND_PRUNE = new nape_space_Broadphase();
			zpp_$nape_util_ZPP_$Flags.internal = false;
		}
		$r = zpp_$nape_util_ZPP_$Flags.Broadphase_SWEEP_AND_PRUNE;
		return $r;
	}(this))) this.bphase = new zpp_$nape_space_ZPP_$SweepPhase(this);
	this.time = 0.0;
	var me = this;
	if(gravity != null) {
		this.gravityx = gravity.x;
		this.gravityy = gravity.y;
	} else {
		this.gravityx = 0;
		this.gravityy = 0;
	}
	this.bodies = new zpp_$nape_util_ZNPList_$ZPP_$Body();
	this.wrap_bodies = zpp_$nape_util_ZPP_$BodyList.get(this.bodies);
	this.wrap_bodies.zpp_inner.adder = $bind(this,this.bodies_adder);
	this.wrap_bodies.zpp_inner.subber = $bind(this,this.bodies_subber);
	this.wrap_bodies.zpp_inner._modifiable = $bind(this,this.bodies_modifiable);
	this.compounds = new zpp_$nape_util_ZNPList_$ZPP_$Compound();
	this.wrap_compounds = zpp_$nape_util_ZPP_$CompoundList.get(this.compounds);
	this.wrap_compounds.zpp_inner.adder = $bind(this,this.compounds_adder);
	this.wrap_compounds.zpp_inner.subber = $bind(this,this.compounds_subber);
	this.wrap_compounds.zpp_inner._modifiable = $bind(this,this.compounds_modifiable);
	this.kinematics = new zpp_$nape_util_ZNPList_$ZPP_$Body();
	this.c_arbiters_true = new zpp_$nape_util_ZNPList_$ZPP_$ColArbiter();
	this.c_arbiters_false = new zpp_$nape_util_ZNPList_$ZPP_$ColArbiter();
	this.f_arbiters = new zpp_$nape_util_ZNPList_$ZPP_$FluidArbiter();
	this.s_arbiters = new zpp_$nape_util_ZNPList_$ZPP_$SensorArbiter();
	this.islands = new zpp_$nape_space_ZPP_$Island();
	this.live = new zpp_$nape_util_ZNPList_$ZPP_$Body();
	this.wrap_live = zpp_$nape_util_ZPP_$BodyList.get(this.live,true);
	this.staticsleep = new zpp_$nape_util_ZNPList_$ZPP_$Body();
	this.constraints = new zpp_$nape_util_ZNPList_$ZPP_$Constraint();
	this.wrap_constraints = zpp_$nape_util_ZPP_$ConstraintList.get(this.constraints);
	this.wrap_constraints.zpp_inner.adder = $bind(this,this.constraints_adder);
	this.wrap_constraints.zpp_inner.subber = $bind(this,this.constraints_subber);
	this.wrap_constraints.zpp_inner._modifiable = $bind(this,this.constraints_modifiable);
	this.live_constraints = new zpp_$nape_util_ZNPList_$ZPP_$Constraint();
	this.wrap_livecon = zpp_$nape_util_ZPP_$ConstraintList.get(this.live_constraints,true);
	this.__static = zpp_$nape_phys_ZPP_$Body.__static();
	this.__static.zpp_inner.space = this;
	this.callbacks = new zpp_$nape_callbacks_ZPP_$Callback();
	this.midstep = false;
	this.listeners = new zpp_$nape_util_ZNPList_$ZPP_$Listener();
	this.wrap_listeners = zpp_$nape_util_ZPP_$ListenerList.get(this.listeners);
	this.wrap_listeners.zpp_inner.adder = $bind(this,this.listeners_adder);
	this.wrap_listeners.zpp_inner.subber = $bind(this,this.listeners_subber);
	this.wrap_listeners.zpp_inner._modifiable = $bind(this,this.listeners_modifiable);
	this.callbackset_list = new zpp_$nape_space_ZPP_$CallbackSet();
	this.mrca1 = new zpp_$nape_util_ZNPList_$ZPP_$Interactor();
	this.mrca2 = new zpp_$nape_util_ZNPList_$ZPP_$Interactor();
	this.prelisteners = new zpp_$nape_util_ZNPList_$ZPP_$InteractionListener();
	this.cbsets = new zpp_$nape_space_ZPP_$CbSetManager(this);
};
zpp_$nape_space_ZPP_$Space.__name__ = true;
zpp_$nape_space_ZPP_$Space.prototype = {
	bodies_adder: function(x) {
		if(x.zpp_inner.compound != null) throw new js__$Boot_HaxeError("Error: Cannot set the space of a Body belonging to a Compound, only the root Compound space can be set");
		if(x.zpp_inner.space != this) {
			if(x.zpp_inner.space != null) x.zpp_inner.space.outer.zpp_inner.wrap_bodies.remove(x);
			this.addBody(x.zpp_inner);
			return true;
		} else return false;
	}
	,bodies_subber: function(x) {
		this.remBody(x.zpp_inner);
	}
	,bodies_modifiable: function() {
		if(this.midstep) throw new js__$Boot_HaxeError("Error: Space::bodies cannot be set during space step()");
	}
	,compounds_adder: function(x) {
		if(x.zpp_inner.compound != null) throw new js__$Boot_HaxeError("Error: Cannot set the space of an inner Compound, only the root Compound space can be set");
		if(x.zpp_inner.space != this) {
			if(x.zpp_inner.space != null) x.zpp_inner.space.wrap_compounds.remove(x);
			this.addCompound(x.zpp_inner);
			return true;
		} else return false;
	}
	,compounds_subber: function(x) {
		this.remCompound(x.zpp_inner);
	}
	,compounds_modifiable: function() {
		if(this.midstep) throw new js__$Boot_HaxeError("Error: Space::compounds cannot be set during space step()");
	}
	,constraints_adder: function(x) {
		if(x.zpp_inner.compound != null) throw new js__$Boot_HaxeError("Error: Cannot set the space of a Constraint belonging to a Compound, only the root Compound space can be set");
		if(x.zpp_inner.space != this) {
			if(x.zpp_inner.space != null) x.zpp_inner.space.outer.zpp_inner.wrap_constraints.remove(x);
			this.addConstraint(x.zpp_inner);
			return true;
		} else return false;
	}
	,constraints_subber: function(x) {
		this.remConstraint(x.zpp_inner);
	}
	,constraints_modifiable: function() {
		if(this.midstep) throw new js__$Boot_HaxeError("Error: Space::constraints cannot be set during space step()");
	}
	,listeners_adder: function(x) {
		if(x.zpp_inner.space != this) {
			if(x.zpp_inner.space != null) x.zpp_inner.space.outer.zpp_inner.wrap_listeners.remove(x);
			this.addListener(x.zpp_inner);
			return true;
		} else return false;
	}
	,listeners_subber: function(x) {
		this.remListener(x.zpp_inner);
	}
	,listeners_modifiable: function() {
		if(this.midstep) throw new js__$Boot_HaxeError("Error: Space::listeners cannot be set during space step()");
	}
	,addListener: function(x) {
		x.space = this;
		x.addedToSpace();
		if(x.interaction != null) null;
	}
	,remListener: function(x) {
		if(x.interaction != null) null;
		x.removedFromSpace();
		x.space = null;
	}
	,add_callbackset: function(cb) {
		cb.int1.cbsets.inlined_add(cb);
		cb.int2.cbsets.inlined_add(cb);
		this.callbackset_list.inlined_add(cb);
	}
	,remove_callbackset: function(cb) {
		cb.lazydel = true;
		cb.int1.cbsets.inlined_try_remove(cb);
		cb.int2.cbsets.inlined_try_remove(cb);
	}
	,transmitType: function(p,new_type) {
		var o = p;
		if(!o.world) {
			o.component.waket = this.stamp + (this.midstep?0:1);
			if(o.type == 3) o.kinematicDelaySleep = true;
			if(o.component.sleeping) this.really_wake(o,false);
		}
		if(p.type == 2) this.live.remove(p); else if(p.type == 3) {
			this.kinematics.remove(p);
			this.staticsleep.remove(p);
		} else if(p.type == 1) this.staticsleep.remove(p);
		p.type = new_type;
		if(p.type == 3) this.kinematics.add(p);
		if(p.type == 1) this.static_validation(p);
		p.component.sleeping = true;
		var o1 = p;
		if(!o1.world) {
			o1.component.waket = this.stamp + (this.midstep?0:1);
			if(o1.type == 3) o1.kinematicDelaySleep = true;
			if(o1.component.sleeping) this.really_wake(o1,true);
		}
	}
	,added_shape: function(s,dontwake) {
		if(dontwake == null) dontwake = false;
		if(!dontwake) {
			var o = s.body;
			if(!o.world) {
				o.component.waket = this.stamp + (this.midstep?0:1);
				if(o.type == 3) o.kinematicDelaySleep = true;
				if(o.component.sleeping) this.really_wake(o,false);
			}
		}
		this.bphase.insert(s);
		s.addedToSpace();
	}
	,removed_shape: function(s,deleting) {
		if(deleting == null) deleting = false;
		var _g = this;
		var body = s.body;
		if(!deleting) body.wake();
		var pre = null;
		var cx_ite = body.arbiters.head;
		while(cx_ite != null) {
			var xarb = [cx_ite.elt];
			var rem = xarb[0].ws1 == s || xarb[0].ws2 == s;
			if(rem) {
				if(xarb[0].present != 0) {
					this.MRCA_chains(xarb[0].ws1,xarb[0].ws2);
					var cx_ite1 = this.mrca1.head;
					while(cx_ite1 != null) {
						var i1 = cx_ite1.elt;
						var cx_ite2 = this.mrca2.head;
						while(cx_ite2 != null) {
							var i2 = cx_ite2.elt;
							var cb1 = i1.cbSet;
							var cb2 = i2.cbSet;
							cb1.validate();
							cb2.validate();
							if(cb1.manager.pair(cb1,cb2).empty_intersection()) {
								cx_ite2 = cx_ite2.next;
								continue;
							}
							var callbackset = [zpp_$nape_phys_ZPP_$Interactor.get(i1,i2)];
							callbackset[0].remove_arb(xarb[0]);
							xarb[0].present--;
							cb1.manager.pair(cb1,cb2).forall(1,(function(callbackset,xarb) {
								return function(listener) {
									if((listener.itype & xarb[0].type) != 0 && callbackset[0].empty_arb(listener.itype)) {
										var cb = _g.push_callback(listener);
										cb.event = 1;
										zpp_$nape_phys_ZPP_$Interactor.int_callback(callbackset[0],listener,cb);
										cb.set = callbackset[0];
									}
								};
							})(callbackset,xarb));
							if(callbackset[0].arbiters.head == null) this.remove_callbackset(callbackset[0]);
							cx_ite2 = cx_ite2.next;
						}
						cx_ite1 = cx_ite1.next;
					}
				}
				if(xarb[0].b1 != body && xarb[0].b1.type == 2) {
					var o = xarb[0].b1;
					if(!o.world) {
						o.component.waket = this.stamp + (this.midstep?0:1);
						if(o.type == 3) o.kinematicDelaySleep = true;
						if(o.component.sleeping) this.really_wake(o,false);
					}
				}
				if(xarb[0].b2 != body && xarb[0].b2.type == 2) {
					var o1 = xarb[0].b2;
					if(!o1.world) {
						o1.component.waket = this.stamp + (this.midstep?0:1);
						if(o1.type == 3) o1.kinematicDelaySleep = true;
						if(o1.component.sleeping) this.really_wake(o1,false);
					}
				}
				xarb[0].cleared = true;
				if(body == null || xarb[0].b2 == body) xarb[0].b1.arbiters.inlined_try_remove(xarb[0]);
				if(body == null || xarb[0].b1 == body) xarb[0].b2.arbiters.inlined_try_remove(xarb[0]);
				if(xarb[0].pair != null) {
					xarb[0].pair.arb = null;
					xarb[0].pair = null;
				}
				xarb[0].active = false;
				this.f_arbiters.modified = true;
				cx_ite = body.arbiters.erase(pre);
				continue;
			}
			pre = cx_ite;
			cx_ite = cx_ite.next;
		}
		this.bphase.remove(s);
		s.removedFromSpace();
	}
	,addConstraint: function(con) {
		con.space = this;
		con.addedToSpace();
		if(con.active) {
			con.component.sleeping = true;
			this.wake_constraint(con,true);
		}
	}
	,remConstraint: function(con) {
		if(con.active) {
			this.wake_constraint(con,true);
			this.live_constraints.remove(con);
		}
		con.removedFromSpace();
		con.space = null;
	}
	,addCompound: function(x) {
		x.space = this;
		x.addedToSpace();
		var cx_ite = x.bodies.head;
		while(cx_ite != null) {
			var i = cx_ite.elt;
			this.addBody(i);
			cx_ite = cx_ite.next;
		}
		var cx_ite1 = x.constraints.head;
		while(cx_ite1 != null) {
			var i1 = cx_ite1.elt;
			this.addConstraint(i1);
			cx_ite1 = cx_ite1.next;
		}
		var cx_ite2 = x.compounds.head;
		while(cx_ite2 != null) {
			var i2 = cx_ite2.elt;
			this.addCompound(i2);
			cx_ite2 = cx_ite2.next;
		}
	}
	,remCompound: function(x) {
		var cx_ite = x.bodies.head;
		while(cx_ite != null) {
			var i = cx_ite.elt;
			this.remBody(i);
			cx_ite = cx_ite.next;
		}
		var cx_ite1 = x.constraints.head;
		while(cx_ite1 != null) {
			var i1 = cx_ite1.elt;
			this.remConstraint(i1);
			cx_ite1 = cx_ite1.next;
		}
		var cx_ite2 = x.compounds.head;
		while(cx_ite2 != null) {
			var i2 = cx_ite2.elt;
			this.remCompound(i2);
			cx_ite2 = cx_ite2.next;
		}
		x.removedFromSpace();
		x.space = null;
	}
	,addBody: function(body,flag) {
		if(flag == null) flag = -1;
		body.space = this;
		body.addedToSpace();
		body.component.sleeping = true;
		var o = body;
		if(!o.world) {
			o.component.waket = this.stamp + (this.midstep?0:1);
			if(o.type == 3) o.kinematicDelaySleep = true;
			if(o.component.sleeping) this.really_wake(o,true);
		}
		var cx_ite = body.shapes.head;
		while(cx_ite != null) {
			var shape = cx_ite.elt;
			this.added_shape(shape,true);
			cx_ite = cx_ite.next;
		}
		if(body.type == 1) {
			this.static_validation(body);
		} else if(body.type == 2) {
		} else {
			if(flag != 3) this.kinematics.add(body);
		}
	}
	,remBody: function(body,flag) {
		if(flag == null) flag = -1;
		if(body.type == 1) {
			var o = body;
			if(!o.world) {
				o.component.waket = this.stamp + (this.midstep?0:1);
				if(o.type == 3) o.kinematicDelaySleep = true;
				if(o.component.sleeping) this.really_wake(o,true);
			}
			this.staticsleep.remove(body);
		} else if(body.type == 2) {
			var o1 = body;
			if(!o1.world) {
				o1.component.waket = this.stamp + (this.midstep?0:1);
				if(o1.type == 3) o1.kinematicDelaySleep = true;
				if(o1.component.sleeping) this.really_wake(o1,true);
			}
			this.live.remove(body);
		} else {
			if(flag != 3) this.kinematics.remove(body);
			var o2 = body;
			if(!o2.world) {
				o2.component.waket = this.stamp + (this.midstep?0:1);
				if(o2.type == 3) o2.kinematicDelaySleep = true;
				if(o2.component.sleeping) this.really_wake(o2,true);
			}
			this.staticsleep.remove(body);
		}
		var cx_ite = body.shapes.head;
		while(cx_ite != null) {
			var shape = cx_ite.elt;
			this.removed_shape(shape,true);
			cx_ite = cx_ite.next;
		}
		body.removedFromSpace();
		body.space = null;
	}
	,push_callback: function(i) {
		var cb;
		if(zpp_$nape_callbacks_ZPP_$Callback.zpp_pool == null) cb = new zpp_$nape_callbacks_ZPP_$Callback(); else {
			cb = zpp_$nape_callbacks_ZPP_$Callback.zpp_pool;
			zpp_$nape_callbacks_ZPP_$Callback.zpp_pool = cb.next;
			cb.next = null;
		}
		null;
		this.callbacks.push(cb);
		cb.listener = i;
		return cb;
	}
	,step: function(deltaTime,velocityIterations,positionIterations) {
		var _g = this;
		if(this.midstep) throw new js__$Boot_HaxeError("Error: ... REALLY?? you're going to call space.step() inside of space.step()? COME ON!!");
		this.time += deltaTime;
		this.pre_dt = deltaTime;
		this.midstep = true;
		this.stamp++;
		this.validation();
		this.bphase.broadphase(this,true);
		this.prestep(deltaTime);
		if(this.sortcontacts) {
			var xxlist = this.c_arbiters_false;
			if(!(xxlist.head == null) && xxlist.head.next != null) {
				var head = xxlist.head;
				var tail = null;
				var left = null;
				var right = null;
				var nxt = null;
				var listSize = 1;
				var numMerges;
				var leftSize;
				var rightSize;
				do {
					numMerges = 0;
					left = head;
					tail = head = null;
					while(left != null) {
						numMerges++;
						right = left;
						leftSize = 0;
						rightSize = listSize;
						while(right != null && leftSize < listSize) {
							leftSize++;
							right = right.next;
						}
						while(leftSize > 0 || rightSize > 0 && right != null) {
							if(leftSize == 0) {
								nxt = right;
								right = right.next;
								rightSize--;
							} else if(rightSize == 0 || right == null) {
								nxt = left;
								left = left.next;
								leftSize--;
							} else if(left.elt.active && right.elt.active?left.elt.oc1.dist < right.elt.oc1.dist:true) {
								nxt = left;
								left = left.next;
								leftSize--;
							} else {
								nxt = right;
								right = right.next;
								rightSize--;
							}
							if(tail != null) tail.next = nxt; else head = nxt;
							tail = nxt;
						}
						left = right;
					}
					tail.next = null;
					listSize <<= 1;
				} while(numMerges > 1);
				xxlist.head = head;
				xxlist.modified = true;
				xxlist.pushmod = true;
			}
		}
		this.updateVel(deltaTime);
		this.warmStart();
		this.iterateVel(velocityIterations);
		var cx_ite = this.kinematics.head;
		while(cx_ite != null) {
			var cur = cx_ite.elt;
			cur.pre_posx = cur.posx;
			cur.pre_posy = cur.posy;
			cur.pre_rot = cur.rot;
			cx_ite = cx_ite.next;
		}
		var cx_ite1 = this.live.head;
		while(cx_ite1 != null) {
			var cur1 = cx_ite1.elt;
			cur1.pre_posx = cur1.posx;
			cur1.pre_posy = cur1.posy;
			cur1.pre_rot = cur1.rot;
			cx_ite1 = cx_ite1.next;
		}
		this.updatePos(deltaTime);
		this.continuous = true;
		this.continuousCollisions(deltaTime);
		this.continuous = false;
		this.iteratePos(positionIterations);
		var cx_ite2 = this.kinematics.head;
		while(cx_ite2 != null) {
			var cur2 = cx_ite2.elt;
			var upos = !(cur2.posx == cur2.pre_posx && cur2.posy == cur2.pre_posy);
			var urot = cur2.pre_rot != cur2.rot;
			if(upos) cur2.invalidate_pos();
			if(urot) cur2.invalidate_rot();
			cx_ite2 = cx_ite2.next;
		}
		var cx_ite3 = this.live.head;
		while(cx_ite3 != null) {
			var cur3 = cx_ite3.elt;
			var upos1 = !(cur3.posx == cur3.pre_posx && cur3.posy == cur3.pre_posy);
			var urot1 = cur3.pre_rot != cur3.rot;
			if(upos1) cur3.invalidate_pos();
			if(urot1) cur3.invalidate_rot();
			cx_ite3 = cx_ite3.next;
		}
		var pre = null;
		var cx_ite4 = this.staticsleep.head;
		while(cx_ite4 != null) {
			var b = cx_ite4.elt;
			if(!(b.type == 3) || b.velx == 0 && b.vely == 0 && b.angvel == 0) {
				if(b.kinematicDelaySleep) {
					b.kinematicDelaySleep = false;
					cx_ite4 = cx_ite4.next;
					continue;
				}
				b.component.sleeping = true;
				cx_ite4 = this.staticsleep.inlined_erase(pre);
				continue;
			}
			pre = cx_ite4;
			cx_ite4 = cx_ite4.next;
		}
		this.doForests(deltaTime);
		this.sleepArbiters();
		this.midstep = false;
		var pre1 = null;
		var cx_ite5 = this.callbackset_list.next;
		while(cx_ite5 != null) {
			var set = [cx_ite5];
			if(set[0].arbiters.head == null) {
				cx_ite5 = this.callbackset_list.inlined_erase(pre1);
				var o = set[0];
				o.int1 = o.int2 = null;
				o.id = o.di = -1;
				o.freed = true;
				null;
				o.next = zpp_$nape_space_ZPP_$CallbackSet.zpp_pool;
				zpp_$nape_space_ZPP_$CallbackSet.zpp_pool = o;
				continue;
			}
			var sleeping = [set[0].sleeping()];
			zpp_$nape_callbacks_ZPP_$CbSet.find_all(set[0].int1.cbSet,set[0].int2.cbSet,6,(function(sleeping,set) {
				return function(x) {
					if((!sleeping[0] || x.allowSleepingCallbacks) && !set[0].empty_arb(x.itype)) {
						var cb = _g.push_callback(x);
						cb.event = 6;
						zpp_$nape_phys_ZPP_$Interactor.int_callback(set[0],x,cb);
						cb.set = set[0];
					}
				};
			})(sleeping,set));
			pre1 = cx_ite5;
			cx_ite5 = cx_ite5.next;
		}
		while(!this.callbacks.empty()) {
			var cb1 = this.callbacks.pop();
			if(cb1.listener.type == 0) {
				var o1 = cb1.listener.body;
				o1.handler(cb1.wrapper_body());
			} else if(cb1.listener.type == 1) {
				var o2 = cb1.listener.constraint;
				o2.handler(cb1.wrapper_con());
			} else if(cb1.listener.type == 2) {
				var o3 = cb1.listener.interaction;
				o3.handleri(cb1.wrapper_int());
			}
			var o4 = cb1;
			o4.int1 = o4.int2 = null;
			o4.body = null;
			o4.constraint = null;
			o4.listener = null;
			if(o4.wrap_arbiters != null) o4.wrap_arbiters.zpp_inner.inner = null;
			o4.set = null;
			o4.next = zpp_$nape_callbacks_ZPP_$Callback.zpp_pool;
			zpp_$nape_callbacks_ZPP_$Callback.zpp_pool = o4;
		}
	}
	,continuousCollisions: function(deltaTime) {
		var MAX_VEL = 2 * Math.PI / deltaTime;
		this.bphase.broadphase(this,false);
		var curTimeAlpha = 0.0;
		while(curTimeAlpha < 1 && !(this.toiEvents.head == null)) {
			var minTOI = null;
			var minTime = 2.0;
			var minKinematic = false;
			var preMin = null;
			var pre = null;
			var cx_ite = this.toiEvents.head;
			while(cx_ite != null) {
				var toi = cx_ite.elt;
				var b11 = toi.s1.body;
				var b21 = toi.s2.body;
				if(b11.sweepFrozen && b21.sweepFrozen) {
					if(toi.toi != 0 && zpp_$nape_geom_ZPP_$Collide.testCollide_safe(toi.s1,toi.s2)) toi.toi = 0; else {
						cx_ite = this.toiEvents.erase(pre);
						var o = toi;
						o.next = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
						zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = o;
						continue;
					}
				}
				if(toi.frozen1 != b11.sweepFrozen || toi.frozen2 != b21.sweepFrozen) {
					if(!toi.kinematic) {
						toi.frozen1 = b11.sweepFrozen;
						toi.frozen2 = b21.sweepFrozen;
						if(toi.frozen1) {
							var tmp = toi.s1;
							toi.s1 = toi.s2;
							toi.s2 = tmp;
							toi.frozen1 = false;
							toi.frozen2 = true;
						}
						zpp_$nape_geom_ZPP_$SweepDistance.staticSweep(toi,deltaTime,0,nape_Config.collisionSlopCCD);
						if(toi.toi < 0) {
							cx_ite = this.toiEvents.erase(pre);
							var o1 = toi;
							o1.next = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
							zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = o1;
							continue;
						}
					} else {
						cx_ite = this.toiEvents.erase(pre);
						var o2 = toi;
						o2.next = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
						zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = o2;
						continue;
					}
				}
				if(toi.toi >= 0 && (toi.toi < minTime || !minKinematic && toi.kinematic)) {
					minTOI = toi;
					minTime = toi.toi;
					minKinematic = toi.kinematic;
					preMin = pre;
				}
				pre = cx_ite;
				cx_ite = cx_ite.next;
			}
			if(minTOI == null) break;
			this.toiEvents.erase(preMin);
			curTimeAlpha = minTOI.toi;
			var b1 = minTOI.s1.body;
			var b2 = minTOI.s2.body;
			if(!b1.sweepFrozen) {
				b1.sweepIntegrate(curTimeAlpha * deltaTime);
				b1.sweepValidate(minTOI.s1);
			}
			if(!b2.sweepFrozen) {
				b2.sweepIntegrate(curTimeAlpha * deltaTime);
				b2.sweepValidate(minTOI.s2);
			}
			var wasnull = minTOI.arbiter == null;
			var arb = this.narrowPhase(minTOI.s1,minTOI.s2,true,minTOI.arbiter,true);
			if(arb == null) {
				if(minTOI.arbiter != null && minTOI.arbiter.pair != null) {
					minTOI.arbiter.pair.arb = null;
					minTOI.arbiter.pair = null;
				}
			} else if(!this.presteparb(arb,deltaTime,true)) {
				if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL && (arb.active && (arb.immState & 1) != 0)) {
					arb.colarb.warmStart();
					arb.colarb.applyImpulseVel();
					arb.colarb.applyImpulseVel();
					arb.colarb.applyImpulseVel();
					arb.colarb.applyImpulseVel();
					b1.sweep_angvel = b1.angvel % MAX_VEL;
					b2.sweep_angvel = b2.angvel % MAX_VEL;
				}
			}
			if(arb != null && (arb.active && (arb.immState & 1) != 0) && arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL) {
				if(!b1.sweepFrozen && !(b1.type == 3)) {
					b1.sweepFrozen = true;
					if(minTOI.failed) b1.angvel = b1.sweep_angvel = 0; else if(minTOI.slipped) b1.angvel = b1.sweep_angvel *= nape_Config.angularCCDSlipScale; else b1.angvel = b1.sweep_angvel;
				}
				if(!b2.sweepFrozen && !(b2.type == 3)) {
					b2.sweepFrozen = true;
					if(minTOI.failed) b2.angvel = b2.sweep_angvel = 0; else if(minTOI.slipped) b2.angvel = b2.sweep_angvel *= nape_Config.angularCCDSlipScale; else b2.angvel = b2.sweep_angvel;
				}
			}
			var o3 = minTOI;
			o3.next = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
			zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = o3;
		}
		while(!(this.toiEvents.head == null)) {
			var toi1 = this.toiEvents.pop_unsafe();
			var o4 = toi1;
			o4.next = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
			zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = o4;
		}
		var cx_ite1 = this.kinematics.head;
		while(cx_ite1 != null) {
			var cur = cx_ite1.elt;
			cur.sweepIntegrate(deltaTime);
			cur.sweepTime = 0;
			cx_ite1 = cx_ite1.next;
		}
		var cx_ite2 = this.live.head;
		while(cx_ite2 != null) {
			var cur1 = cx_ite2.elt;
			if(!cur1.sweepFrozen) cur1.sweepIntegrate(deltaTime);
			cur1.sweepTime = 0;
			cx_ite2 = cx_ite2.next;
		}
	}
	,continuousEvent: function(s1,s2,stat,in_arb,_) {
		if(s1.body.sweepFrozen && s2.body.sweepFrozen) return in_arb;
		if(s1.body.disableCCD || s2.body.disableCCD) return in_arb;
		if(in_arb != null && in_arb.colarb == null || this.interactionType(s1,s2,s1.body,s2.body) <= 0) return in_arb;
		var b1 = s1.body;
		var b2 = s2.body;
		if(stat || b1.bullet || b2.bullet) {
			var toi;
			if(zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool == null) toi = new zpp_$nape_geom_ZPP_$ToiEvent(); else {
				toi = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
				zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = toi.next;
				toi.next = null;
			}
			toi.failed = false;
			toi.s1 = toi.s2 = null;
			toi.arbiter = null;
			var kin = b1.type == 3 || b2.type == 3;
			if(stat && !kin) {
				if(!(s1.body.type == 2)) {
					toi.s2 = s1;
					toi.s1 = s2;
				} else {
					toi.s1 = s1;
					toi.s2 = s2;
				}
				toi.kinematic = false;
				zpp_$nape_geom_ZPP_$SweepDistance.staticSweep(toi,this.pre_dt,0,nape_Config.collisionSlopCCD);
			} else {
				toi.s1 = s1;
				toi.s2 = s2;
				toi.kinematic = kin;
				if(toi.s1.body.sweepFrozen || toi.s2.body.sweepFrozen) {
					if(toi.s1.body.sweepFrozen) {
						var tmp = toi.s1;
						toi.s1 = toi.s2;
						toi.s2 = tmp;
						toi.frozen1 = false;
						toi.frozen2 = true;
					}
					zpp_$nape_geom_ZPP_$SweepDistance.staticSweep(toi,this.pre_dt,0,nape_Config.collisionSlopCCD);
				} else zpp_$nape_geom_ZPP_$SweepDistance.dynamicSweep(toi,this.pre_dt,0,nape_Config.collisionSlopCCD);
			}
			if(stat && toi.toi < 0 || toi.failed) {
				var o = toi;
				o.next = zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool;
				zpp_$nape_geom_ZPP_$ToiEvent.zpp_pool = o;
			} else {
				this.toiEvents.add(toi);
				toi.frozen1 = toi.s1.body.sweepFrozen;
				toi.frozen2 = toi.s2.body.sweepFrozen;
				if(in_arb != null) toi.arbiter = in_arb.colarb; else toi.arbiter = null;
			}
		}
		return in_arb;
	}
	,bodyCbWake: function(b) {
		if(b.type == 2 && b.cbSet != null) {
			if(this.midstep) {
				var cx_ite = b.cbSet.bodylisteners.head;
				while(cx_ite != null) {
					var i = cx_ite.elt;
					if(i.event != 2) {
						cx_ite = cx_ite.next;
						continue;
					}
					var cb = this.push_callback(i);
					cb.event = 2;
					cb.body = b;
					cx_ite = cx_ite.next;
				}
			} else b.component.woken = true;
		}
	}
	,bodyCbSleep: function(b) {
		if(b.type == 2 && b.cbSet != null) {
			var cx_ite = b.cbSet.bodylisteners.head;
			while(cx_ite != null) {
				var i = cx_ite.elt;
				if(i.event != 3) {
					cx_ite = cx_ite.next;
					continue;
				}
				var cb = this.push_callback(i);
				cb.event = 3;
				cb.body = b;
				cx_ite = cx_ite.next;
			}
		}
	}
	,constraintCbWake: function(con) {
		if(con.cbSet != null) {
			if(this.midstep) {
				var cx_ite = con.cbSet.conlisteners.head;
				while(cx_ite != null) {
					var i = cx_ite.elt;
					if(i.event != 2) {
						cx_ite = cx_ite.next;
						continue;
					}
					var cb = this.push_callback(i);
					cb.event = 2;
					cb.constraint = con;
					cx_ite = cx_ite.next;
				}
			} else con.component.woken = true;
		}
	}
	,constraintCbSleep: function(con) {
		if(con.cbSet != null) {
			var cx_ite = con.cbSet.conlisteners.head;
			while(cx_ite != null) {
				var i = cx_ite.elt;
				if(i.event != 3) {
					cx_ite = cx_ite.next;
					continue;
				}
				var cb = this.push_callback(i);
				cb.event = 3;
				cb.constraint = con;
				cx_ite = cx_ite.next;
			}
		}
	}
	,constraintCbBreak: function(con) {
		if(con.cbSet != null) {
			var cx_ite = con.cbSet.conlisteners.head;
			while(cx_ite != null) {
				var i = cx_ite.elt;
				if(i.event != 4) {
					cx_ite = cx_ite.next;
					continue;
				}
				var cb = this.push_callback(i);
				cb.event = 4;
				cb.constraint = con;
				cx_ite = cx_ite.next;
			}
		}
	}
	,nullListenerType: function(cb1,cb2) {
		var stack = new zpp_$nape_util_ZNPList_$ZPP_$Interactor();
		var cx_ite = cb1.interactors.head;
		while(cx_ite != null) {
			var i = cx_ite.elt;
			stack.add(i);
			cx_ite = cx_ite.next;
		}
		if(cb1 != cb2) {
			var cx_ite1 = cb2.interactors.head;
			while(cx_ite1 != null) {
				var i1 = cx_ite1.elt;
				stack.add(i1);
				cx_ite1 = cx_ite1.next;
			}
		}
		while(!(stack.head == null)) {
			var intx = stack.pop_unsafe();
			if(intx.icompound != null) {
				var comp = intx.icompound;
				var cx_ite2 = comp.bodies.head;
				while(cx_ite2 != null) {
					var i2 = cx_ite2.elt;
					stack.add(i2);
					cx_ite2 = cx_ite2.next;
				}
				var cx_ite3 = comp.compounds.head;
				while(cx_ite3 != null) {
					var i3 = cx_ite3.elt;
					stack.add(i3);
					cx_ite3 = cx_ite3.next;
				}
			} else {
				var xbody;
				if(intx.ibody != null) xbody = intx.ibody; else xbody = intx.ishape.body;
				var xshp;
				if(intx.ishape != null) xshp = intx.ishape; else xshp = null;
				var cx_ite4 = xbody.arbiters.head;
				while(cx_ite4 != null) {
					var xarb = cx_ite4.elt;
					if(xarb.present == 0) {
						cx_ite4 = cx_ite4.next;
						continue;
					}
					if(xshp != null && !(xarb.ws1 == xshp || xarb.ws2 == xshp)) {
						cx_ite4 = cx_ite4.next;
						continue;
					}
					this.MRCA_chains(xarb.ws1,xarb.ws2);
					var cx_ite5 = this.mrca1.head;
					while(cx_ite5 != null) {
						var i11 = cx_ite5.elt;
						if(i11.cbSet != cb1 && i11.cbSet != cb2) {
							cx_ite5 = cx_ite5.next;
							continue;
						}
						var cx_ite6 = this.mrca2.head;
						while(cx_ite6 != null) {
							var i21 = cx_ite6.elt;
							if(i11.cbSet == cb1 && i21.cbSet != cb2 || i11.cbSet == cb2 && i21.cbSet != cb1) {
								cx_ite6 = cx_ite6.next;
								continue;
							}
							var callbackset = zpp_$nape_phys_ZPP_$Interactor.get(i11,i21);
							if(callbackset != null) {
								while(!(callbackset.arbiters.head == null)) {
									var arb = callbackset.arbiters.pop_unsafe();
									arb.present--;
								}
								this.remove_callbackset(callbackset);
							}
							cx_ite6 = cx_ite6.next;
						}
						cx_ite5 = cx_ite5.next;
					}
					cx_ite4 = cx_ite4.next;
				}
			}
		}
	}
	,nullInteractorType: function(intx,me) {
		if(me == null) me = intx;
		if(intx.icompound != null) {
			var comp = intx.icompound;
			var cx_ite = comp.bodies.head;
			while(cx_ite != null) {
				var body = cx_ite.elt;
				this.nullInteractorType(body,me);
				cx_ite = cx_ite.next;
			}
			var cx_ite1 = comp.compounds.head;
			while(cx_ite1 != null) {
				var comp1 = cx_ite1.elt;
				this.nullInteractorType(comp1,me);
				cx_ite1 = cx_ite1.next;
			}
		} else {
			var xbody;
			if(intx.ibody != null) xbody = intx.ibody; else xbody = intx.ishape.body;
			var xshp;
			if(intx.ishape != null) xshp = intx.ishape; else xshp = null;
			var cx_ite2 = xbody.arbiters.head;
			while(cx_ite2 != null) {
				var xarb = cx_ite2.elt;
				if(xarb.present == 0) {
					cx_ite2 = cx_ite2.next;
					continue;
				}
				if(xshp != null && !(xarb.ws1 == xshp || xarb.ws2 == xshp)) {
					cx_ite2 = cx_ite2.next;
					continue;
				}
				this.MRCA_chains(xarb.ws1,xarb.ws2);
				var cx_ite3 = this.mrca1.head;
				while(cx_ite3 != null) {
					var i1 = cx_ite3.elt;
					var cx_ite4 = this.mrca2.head;
					while(cx_ite4 != null) {
						var i2 = cx_ite4.elt;
						if(i1 != me && i2 != me) {
							cx_ite4 = cx_ite4.next;
							continue;
						}
						var callbackset = zpp_$nape_phys_ZPP_$Interactor.get(i1,i2);
						if(callbackset != null) {
							xarb.present--;
							callbackset.remove_arb(xarb);
							if(callbackset.arbiters.head == null) this.remove_callbackset(callbackset);
						}
						cx_ite4 = cx_ite4.next;
					}
					cx_ite3 = cx_ite3.next;
				}
				cx_ite2 = cx_ite2.next;
			}
		}
	}
	,freshListenerType: function(cb1,cb2) {
		var stack = new zpp_$nape_util_ZNPList_$ZPP_$Interactor();
		var cx_ite = cb1.interactors.head;
		while(cx_ite != null) {
			var i = cx_ite.elt;
			stack.add(i);
			cx_ite = cx_ite.next;
		}
		if(cb1 != cb2) {
			var cx_ite1 = cb2.interactors.head;
			while(cx_ite1 != null) {
				var i1 = cx_ite1.elt;
				stack.add(i1);
				cx_ite1 = cx_ite1.next;
			}
		}
		while(!(stack.head == null)) {
			var intx = stack.pop_unsafe();
			if(intx.icompound != null) {
				var comp = intx.icompound;
				var cx_ite2 = comp.bodies.head;
				while(cx_ite2 != null) {
					var i2 = cx_ite2.elt;
					stack.add(i2);
					cx_ite2 = cx_ite2.next;
				}
				var cx_ite3 = comp.compounds.head;
				while(cx_ite3 != null) {
					var i3 = cx_ite3.elt;
					stack.add(i3);
					cx_ite3 = cx_ite3.next;
				}
			} else {
				var xbody;
				if(intx.ibody != null) xbody = intx.ibody; else xbody = intx.ishape.body;
				var xshp;
				if(intx.ishape != null) xshp = intx.ishape; else xshp = null;
				var cx_ite4 = xbody.arbiters.head;
				while(cx_ite4 != null) {
					var xarb = cx_ite4.elt;
					if(!xarb.presentable) {
						cx_ite4 = cx_ite4.next;
						continue;
					}
					if(xshp != null && !(xarb.ws1 == xshp || xarb.ws2 == xshp)) {
						cx_ite4 = cx_ite4.next;
						continue;
					}
					this.MRCA_chains(xarb.ws1,xarb.ws2);
					var cx_ite5 = this.mrca1.head;
					while(cx_ite5 != null) {
						var i11 = cx_ite5.elt;
						if(i11.cbSet != cb1 && i11.cbSet != cb2) {
							cx_ite5 = cx_ite5.next;
							continue;
						}
						var cx_ite6 = this.mrca2.head;
						while(cx_ite6 != null) {
							var i21 = cx_ite6.elt;
							if(i11.cbSet == cb1 && i21.cbSet != cb2 || i11.cbSet == cb2 && i21.cbSet != cb1) {
								cx_ite6 = cx_ite6.next;
								continue;
							}
							var callbackset = zpp_$nape_phys_ZPP_$Interactor.get(i11,i21);
							if(callbackset == null) {
								callbackset = zpp_$nape_space_ZPP_$CallbackSet.get(i11,i21);
								this.add_callbackset(callbackset);
							}
							if(!callbackset.arbiters.inlined_has(xarb)?(function($this) {
								var $r;
								callbackset.arbiters.inlined_add(xarb);
								$r = true;
								return $r;
							}(this)):false) xarb.present++;
							cx_ite6 = cx_ite6.next;
						}
						cx_ite5 = cx_ite5.next;
					}
					cx_ite4 = cx_ite4.next;
				}
			}
		}
	}
	,freshInteractorType: function(intx,me) {
		if(me == null) me = intx;
		if(intx.icompound != null) {
			var comp = intx.icompound;
			var cx_ite = comp.bodies.head;
			while(cx_ite != null) {
				var body = cx_ite.elt;
				this.freshInteractorType(body,me);
				cx_ite = cx_ite.next;
			}
			var cx_ite1 = comp.compounds.head;
			while(cx_ite1 != null) {
				var comp1 = cx_ite1.elt;
				this.freshInteractorType(comp1,me);
				cx_ite1 = cx_ite1.next;
			}
		} else {
			var xbody;
			if(intx.ibody != null) xbody = intx.ibody; else xbody = intx.ishape.body;
			var xshp;
			if(intx.ishape != null) xshp = intx.ishape; else xshp = null;
			var cx_ite2 = xbody.arbiters.head;
			while(cx_ite2 != null) {
				var xarb = cx_ite2.elt;
				if(!xarb.presentable) {
					cx_ite2 = cx_ite2.next;
					continue;
				}
				if(xshp != null && !(xarb.ws1 == xshp || xarb.ws2 == xshp)) {
					cx_ite2 = cx_ite2.next;
					continue;
				}
				this.MRCA_chains(xarb.ws1,xarb.ws2);
				var cx_ite3 = this.mrca1.head;
				while(cx_ite3 != null) {
					var i1 = cx_ite3.elt;
					var cx_ite4 = this.mrca2.head;
					while(cx_ite4 != null) {
						var i2 = cx_ite4.elt;
						if(i1 != me && i2 != me) {
							cx_ite4 = cx_ite4.next;
							continue;
						}
						var cb1 = i1.cbSet;
						var cb2 = i2.cbSet;
						cb1.validate();
						cb2.validate();
						if(!cb1.manager.pair(cb1,cb2).empty_intersection()) {
							var callbackset = zpp_$nape_phys_ZPP_$Interactor.get(i1,i2);
							if(callbackset == null) {
								callbackset = zpp_$nape_space_ZPP_$CallbackSet.get(i1,i2);
								this.add_callbackset(callbackset);
							}
							if(!callbackset.arbiters.inlined_has(xarb)?(function($this) {
								var $r;
								callbackset.arbiters.inlined_add(xarb);
								$r = true;
								return $r;
							}(this)):false) xarb.present++;
						}
						cx_ite4 = cx_ite4.next;
					}
					cx_ite3 = cx_ite3.next;
				}
				cx_ite2 = cx_ite2.next;
			}
		}
	}
	,wakeCompound: function(x) {
		var cx_ite = x.bodies.head;
		while(cx_ite != null) {
			var y = cx_ite.elt;
			var o = y;
			if(!o.world) {
				o.component.waket = this.stamp + (this.midstep?0:1);
				if(o.type == 3) o.kinematicDelaySleep = true;
				if(o.component.sleeping) this.really_wake(o,false);
			}
			cx_ite = cx_ite.next;
		}
		var cx_ite1 = x.constraints.head;
		while(cx_ite1 != null) {
			var i = cx_ite1.elt;
			this.wake_constraint(i);
			cx_ite1 = cx_ite1.next;
		}
		var cx_ite2 = x.compounds.head;
		while(cx_ite2 != null) {
			var i1 = cx_ite2.elt;
			this.wakeCompound(i1);
			cx_ite2 = cx_ite2.next;
		}
	}
	,wakeIsland: function(i) {
		while(!(i.comps.head == null)) {
			var c = i.comps.pop_unsafe();
			c.waket = this.stamp + (this.midstep?0:1);
			if(c.isBody) {
				var b = c.body;
				this.live.add(b);
				var cx_ite = b.arbiters.head;
				while(cx_ite != null) {
					var arb = cx_ite.elt;
					if(arb.sleeping) {
						arb.sleeping = false;
						arb.up_stamp += this.stamp - arb.sleep_stamp;
						if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL) {
							var carb = arb.colarb;
							if(carb.stat) this.c_arbiters_true.inlined_add(carb); else this.c_arbiters_false.inlined_add(carb);
						} else if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.FLUID) this.f_arbiters.inlined_add(arb.fluidarb); else this.s_arbiters.inlined_add(arb.sensorarb);
					}
					cx_ite = cx_ite.next;
				}
				this.bodyCbWake(b);
				c.sleeping = false;
				c.island = null;
				c.parent = c;
				c.rank = 0;
				if(!(b.type == 1)) {
					var cx_ite1 = b.shapes.head;
					while(cx_ite1 != null) {
						var shape = cx_ite1.elt;
						if(shape.node != null) this.bphase.sync(shape);
						cx_ite1 = cx_ite1.next;
					}
				}
			} else {
				var con = c.constraint;
				this.live_constraints.inlined_add(con);
				this.constraintCbWake(con);
				c.sleeping = false;
				c.island = null;
				c.parent = c;
				c.rank = 0;
			}
		}
		var o = i;
		o.next = zpp_$nape_space_ZPP_$Island.zpp_pool;
		zpp_$nape_space_ZPP_$Island.zpp_pool = o;
	}
	,non_inlined_wake: function(o,fst) {
		if(fst == null) fst = false;
		var o1 = o;
		if(!o1.world) {
			o1.component.waket = this.stamp + (this.midstep?0:1);
			if(o1.type == 3) o1.kinematicDelaySleep = true;
			if(o1.component.sleeping) this.really_wake(o1,fst);
		}
	}
	,really_wake: function(o,fst) {
		if(fst == null) fst = false;
		if(o.component.island == null) {
			o.component.sleeping = false;
			if(o.type == 3 || o.type == 1) this.staticsleep.inlined_add(o); else this.live.inlined_add(o);
			var cx_ite = o.constraints.head;
			while(cx_ite != null) {
				var con = cx_ite.elt;
				if(con.space == this) this.wake_constraint(con);
				cx_ite = cx_ite.next;
			}
			var cx_ite1 = o.arbiters.head;
			while(cx_ite1 != null) {
				var arb = cx_ite1.elt;
				if(arb.sleeping) {
					arb.sleeping = false;
					arb.up_stamp += this.stamp + (this.midstep?0:1) - arb.sleep_stamp;
					if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL) {
						var carb = arb.colarb;
						if(carb.stat) this.c_arbiters_true.inlined_add(carb); else this.c_arbiters_false.inlined_add(carb);
					} else if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.FLUID) this.f_arbiters.inlined_add(arb.fluidarb); else this.s_arbiters.inlined_add(arb.sensorarb);
				}
				if(arb.type != zpp_$nape_dynamics_ZPP_$Arbiter.SENSOR && !arb.cleared && arb.up_stamp >= this.stamp && (arb.immState & 1) != 0) {
					if(arb.b1.type == 2 && arb.b1.component.sleeping) {
						var o1 = arb.b1;
						if(!o1.world) {
							o1.component.waket = this.stamp + (this.midstep?0:1);
							if(o1.type == 3) o1.kinematicDelaySleep = true;
							if(o1.component.sleeping) this.really_wake(o1,false);
						}
					}
					if(arb.b2.type == 2 && arb.b2.component.sleeping) {
						var o2 = arb.b2;
						if(!o2.world) {
							o2.component.waket = this.stamp + (this.midstep?0:1);
							if(o2.type == 3) o2.kinematicDelaySleep = true;
							if(o2.component.sleeping) this.really_wake(o2,false);
						}
					}
				}
				cx_ite1 = cx_ite1.next;
			}
			if(!fst && o.type == 2) this.bodyCbWake(o);
			if(!fst && !this.bphase.is_sweep && !(o.type == 1)) {
				var cx_ite2 = o.shapes.head;
				while(cx_ite2 != null) {
					var shape = cx_ite2.elt;
					if(shape.node != null) this.bphase.sync(shape);
					cx_ite2 = cx_ite2.next;
				}
			}
		} else this.wakeIsland(o.component.island);
	}
	,wake_constraint: function(con,fst) {
		if(fst == null) fst = false;
		if(con.active) {
			con.component.waket = this.stamp + (this.midstep?0:1);
			if(con.component.sleeping) {
				if(con.component.island == null) {
					con.component.sleeping = false;
					this.live_constraints.inlined_add(con);
					con.wake_connected();
					if(!fst) this.constraintCbWake(con);
				} else this.wakeIsland(con.component.island);
				return true;
			} else return false;
		} else return false;
	}
	,doForests: function(dt) {
		var cx_ite = this.c_arbiters_false.head;
		while(cx_ite != null) {
			var arb = cx_ite.elt;
			if(!arb.cleared && arb.up_stamp == this.stamp && (arb.immState & 1) != 0) {
				if(arb.b1.type == 2 && arb.b2.type == 2) {
					var xr;
					if(arb.b1.component == arb.b1.component.parent) xr = arb.b1.component; else {
						var obj = arb.b1.component;
						var stack = null;
						while(obj != obj.parent) {
							var nxt = obj.parent;
							obj.parent = stack;
							stack = obj;
							obj = nxt;
						}
						while(stack != null) {
							var nxt1 = stack.parent;
							stack.parent = obj;
							stack = nxt1;
						}
						xr = obj;
					}
					var yr;
					if(arb.b2.component == arb.b2.component.parent) yr = arb.b2.component; else {
						var obj1 = arb.b2.component;
						var stack1 = null;
						while(obj1 != obj1.parent) {
							var nxt2 = obj1.parent;
							obj1.parent = stack1;
							stack1 = obj1;
							obj1 = nxt2;
						}
						while(stack1 != null) {
							var nxt3 = stack1.parent;
							stack1.parent = obj1;
							stack1 = nxt3;
						}
						yr = obj1;
					}
					if(xr != yr) {
						if(xr.rank < yr.rank) xr.parent = yr; else if(xr.rank > yr.rank) yr.parent = xr; else {
							yr.parent = xr;
							xr.rank++;
						}
					}
				}
			}
			cx_ite = cx_ite.next;
		}
		var cx_ite1 = this.f_arbiters.head;
		while(cx_ite1 != null) {
			var arb1 = cx_ite1.elt;
			if(!arb1.cleared && arb1.up_stamp == this.stamp && (arb1.immState & 1) != 0) {
				if(arb1.b1.type == 2 && arb1.b2.type == 2) {
					var xr1;
					if(arb1.b1.component == arb1.b1.component.parent) xr1 = arb1.b1.component; else {
						var obj2 = arb1.b1.component;
						var stack2 = null;
						while(obj2 != obj2.parent) {
							var nxt4 = obj2.parent;
							obj2.parent = stack2;
							stack2 = obj2;
							obj2 = nxt4;
						}
						while(stack2 != null) {
							var nxt5 = stack2.parent;
							stack2.parent = obj2;
							stack2 = nxt5;
						}
						xr1 = obj2;
					}
					var yr1;
					if(arb1.b2.component == arb1.b2.component.parent) yr1 = arb1.b2.component; else {
						var obj3 = arb1.b2.component;
						var stack3 = null;
						while(obj3 != obj3.parent) {
							var nxt6 = obj3.parent;
							obj3.parent = stack3;
							stack3 = obj3;
							obj3 = nxt6;
						}
						while(stack3 != null) {
							var nxt7 = stack3.parent;
							stack3.parent = obj3;
							stack3 = nxt7;
						}
						yr1 = obj3;
					}
					if(xr1 != yr1) {
						if(xr1.rank < yr1.rank) xr1.parent = yr1; else if(xr1.rank > yr1.rank) yr1.parent = xr1; else {
							yr1.parent = xr1;
							xr1.rank++;
						}
					}
				}
			}
			cx_ite1 = cx_ite1.next;
		}
		var cx_ite2 = this.live_constraints.head;
		while(cx_ite2 != null) {
			var con = cx_ite2.elt;
			con.forest();
			cx_ite2 = cx_ite2.next;
		}
		while(!(this.live.head == null)) {
			var o = this.live.inlined_pop_unsafe();
			var oc = o.component;
			var root;
			if(oc == oc.parent) root = oc; else {
				var obj4 = oc;
				var stack4 = null;
				while(obj4 != obj4.parent) {
					var nxt8 = obj4.parent;
					obj4.parent = stack4;
					stack4 = obj4;
					obj4 = nxt8;
				}
				while(stack4 != null) {
					var nxt9 = stack4.parent;
					stack4.parent = obj4;
					stack4 = nxt9;
				}
				root = obj4;
			}
			if(root.island == null) {
				if(zpp_$nape_space_ZPP_$Island.zpp_pool == null) root.island = new zpp_$nape_space_ZPP_$Island(); else {
					root.island = zpp_$nape_space_ZPP_$Island.zpp_pool;
					zpp_$nape_space_ZPP_$Island.zpp_pool = root.island.next;
					root.island.next = null;
				}
				root.island.waket = 0;
				this.islands.inlined_add(root.island);
				root.island.sleep = true;
			}
			oc.island = root.island;
			oc.island.comps.inlined_add(oc);
			var rest = o.atRest(dt);
			oc.island.sleep = oc.island.sleep && rest;
			if(oc.waket > oc.island.waket) oc.island.waket = oc.waket;
		}
		while(!(this.live_constraints.head == null)) {
			var o1 = this.live_constraints.inlined_pop_unsafe();
			var oc1 = o1.component;
			var root1;
			if(oc1 == oc1.parent) root1 = oc1; else {
				var obj5 = oc1;
				var stack5 = null;
				while(obj5 != obj5.parent) {
					var nxt10 = obj5.parent;
					obj5.parent = stack5;
					stack5 = obj5;
					obj5 = nxt10;
				}
				while(stack5 != null) {
					var nxt11 = stack5.parent;
					stack5.parent = obj5;
					stack5 = nxt11;
				}
				root1 = obj5;
			}
			oc1.island = root1.island;
			oc1.island.comps.inlined_add(oc1);
			if(oc1.waket > oc1.island.waket) oc1.island.waket = oc1.waket;
		}
		while(!(this.islands.next == null)) {
			var i = this.islands.inlined_pop_unsafe();
			if(i.sleep) {
				var cx_ite3 = i.comps.head;
				while(cx_ite3 != null) {
					var c = cx_ite3.elt;
					if(c.isBody) {
						var b = c.body;
						b.velx = 0;
						b.vely = 0;
						b.angvel = 0;
						c.sleeping = true;
						var cx_ite4 = b.shapes.head;
						while(cx_ite4 != null) {
							var shape = cx_ite4.elt;
							this.bphase.sync(shape);
							cx_ite4 = cx_ite4.next;
						}
						this.bodyCbSleep(b);
					} else {
						var con1 = c.constraint;
						this.constraintCbSleep(con1);
						c.sleeping = true;
					}
					cx_ite3 = cx_ite3.next;
				}
			} else {
				while(!(i.comps.head == null)) {
					var c1 = i.comps.inlined_pop_unsafe();
					c1.waket = i.waket;
					if(c1.isBody) this.live.inlined_add(c1.body); else this.live_constraints.inlined_add(c1.constraint);
					c1.sleeping = false;
					c1.island = null;
					c1.parent = c1;
					c1.rank = 0;
				}
				var o2 = i;
				o2.next = zpp_$nape_space_ZPP_$Island.zpp_pool;
				zpp_$nape_space_ZPP_$Island.zpp_pool = o2;
			}
		}
	}
	,sleepArbiters: function() {
		var pre = null;
		var arbs = this.c_arbiters_true;
		var arbite = arbs.head;
		var fst = this.c_arbiters_false != null;
		if(fst && arbite == null) {
			fst = false;
			arbite = this.c_arbiters_false.head;
			arbs = this.c_arbiters_false;
			pre = null;
		}
		while(arbite != null) {
			var arb = arbite.elt;
			if(arb.b1.component.sleeping && arb.b2.component.sleeping) {
				arb.sleep_stamp = this.stamp;
				arb.sleeping = true;
				arbite = arbs.inlined_erase(pre);
				if(fst && arbite == null) {
					fst = false;
					arbite = this.c_arbiters_false.head;
					arbs = this.c_arbiters_false;
					pre = null;
				}
				continue;
			}
			pre = arbite;
			arbite = arbite.next;
			if(fst && arbite == null) {
				fst = false;
				arbite = this.c_arbiters_false.head;
				arbs = this.c_arbiters_false;
				pre = null;
			}
		}
		var pre1 = null;
		var arbs1 = this.f_arbiters;
		var arbite1 = arbs1.head;
		var fst1 = false;
		if(fst1 && arbite1 == null) {
			fst1 = false;
			arbs1 = null;
			pre1 = null;
		}
		while(arbite1 != null) {
			var arb1 = arbite1.elt;
			if(arb1.b1.component.sleeping && arb1.b2.component.sleeping) {
				arb1.sleep_stamp = this.stamp;
				arb1.sleeping = true;
				arbite1 = arbs1.inlined_erase(pre1);
				if(fst1 && arbite1 == null) {
					fst1 = false;
					arbs1 = null;
					pre1 = null;
				}
				continue;
			}
			pre1 = arbite1;
			arbite1 = arbite1.next;
			if(fst1 && arbite1 == null) {
				fst1 = false;
				arbs1 = null;
				pre1 = null;
			}
		}
		var pre2 = null;
		var arbs2 = this.s_arbiters;
		var arbite2 = arbs2.head;
		var fst2 = false;
		if(fst2 && arbite2 == null) {
			fst2 = false;
			arbs2 = null;
			pre2 = null;
		}
		while(arbite2 != null) {
			var arb2 = arbite2.elt;
			if(arb2.b1.component.sleeping && arb2.b2.component.sleeping) {
				arb2.sleep_stamp = this.stamp;
				arb2.sleeping = true;
				arbite2 = arbs2.inlined_erase(pre2);
				if(fst2 && arbite2 == null) {
					fst2 = false;
					arbs2 = null;
					pre2 = null;
				}
				continue;
			}
			pre2 = arbite2;
			arbite2 = arbite2.next;
			if(fst2 && arbite2 == null) {
				fst2 = false;
				arbs2 = null;
				pre2 = null;
			}
		}
	}
	,static_validation: function(body) {
		if(!(body.shapes.head == null)) body.validate_aabb();
		body.validate_mass();
		body.validate_inertia();
		if(body.velx != 0 || body.vely != 0 || body.angvel != 0) throw new js__$Boot_HaxeError("Error: Static body cannot have any real velocity, only kinematic or surface velocities");
		var cx_ite = body.shapes.head;
		while(cx_ite != null) {
			var s = cx_ite.elt;
			if(s.type == 1) {
				s.polygon.splice_collinear();
				var res = s.polygon.valid();
				if(res != (function($this) {
					var $r;
					if(zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID == null) {
						zpp_$nape_util_ZPP_$Flags.internal = true;
						zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID = new nape_shape_ValidationResult();
						zpp_$nape_util_ZPP_$Flags.internal = false;
					}
					$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID;
					return $r;
				}(this))) throw new js__$Boot_HaxeError("Error: Cannot simulate with an invalid Polygon : " + s.polygon.outer.toString() + " is invalid : " + res.toString());
				s.polygon.validate_gaxi();
			}
			cx_ite = cx_ite.next;
		}
		body.sweepFrozen = true;
	}
	,validation: function() {
		this.cbsets.validate();
		var cx_ite = this.live.head;
		while(cx_ite != null) {
			var cur = cx_ite.elt;
			cur.sweepRadius = 0;
			var cx_ite1 = cur.shapes.head;
			while(cx_ite1 != null) {
				var s = cx_ite1.elt;
				if(s.type == 1) {
					s.polygon.splice_collinear();
					var res = s.polygon.valid();
					if(res != (function($this) {
						var $r;
						if(zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID == null) {
							zpp_$nape_util_ZPP_$Flags.internal = true;
							zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID = new nape_shape_ValidationResult();
							zpp_$nape_util_ZPP_$Flags.internal = false;
						}
						$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID;
						return $r;
					}(this))) throw new js__$Boot_HaxeError("Error: Cannot simulate with an invalid Polygon : " + s.polygon.outer.toString() + " is invalid : " + res.toString());
					s.polygon.validate_gaxi();
				}
				s.validate_sweepRadius();
				if(s.sweepRadius > cur.sweepRadius) cur.sweepRadius = s.sweepRadius;
				cx_ite1 = cx_ite1.next;
			}
			cur.validate_mass();
			cur.validate_inertia();
			if(!(cur.shapes.head == null)) {
				cur.validate_aabb();
				cur.validate_worldCOM();
			}
			cur.validate_gravMass();
			if(cur.zip_axis) {
				cur.zip_axis = false;
				cur.axisx = Math.sin(cur.rot);
				cur.axisy = Math.cos(cur.rot);
				null;
			}
			if(!cur.nomove && cur.type == 2 && cur.mass == 0) throw new js__$Boot_HaxeError("Error: Dynamic Body cannot be simulated with 0 mass unless allowMovement is false");
			if(!cur.norotate && cur.type == 2 && cur.inertia == 0) throw new js__$Boot_HaxeError("Error: Dynamic Body cannot be simulated with 0 inertia unless allowRotation is false");
			if(cur.component.woken && cur.cbSet != null) {
				var cx_ite2 = cur.cbSet.bodylisteners.head;
				while(cx_ite2 != null) {
					var i = cx_ite2.elt;
					if(i.event != 2) {
						cx_ite2 = cx_ite2.next;
						continue;
					}
					var cb = this.push_callback(i);
					cb.event = 2;
					cb.body = cur;
					cx_ite2 = cx_ite2.next;
				}
			}
			cur.component.woken = false;
			var cx_ite3 = cur.shapes.head;
			while(cx_ite3 != null) {
				var shape = cx_ite3.elt;
				this.bphase.sync(shape);
				cx_ite3 = cx_ite3.next;
			}
			cx_ite = cx_ite.next;
		}
		var cx_ite4 = this.kinematics.head;
		while(cx_ite4 != null) {
			var cur1 = cx_ite4.elt;
			cur1.sweepRadius = 0;
			var cx_ite5 = cur1.shapes.head;
			while(cx_ite5 != null) {
				var s1 = cx_ite5.elt;
				if(s1.type == 1) {
					s1.polygon.splice_collinear();
					var res1 = s1.polygon.valid();
					if(res1 != (function($this) {
						var $r;
						if(zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID == null) {
							zpp_$nape_util_ZPP_$Flags.internal = true;
							zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID = new nape_shape_ValidationResult();
							zpp_$nape_util_ZPP_$Flags.internal = false;
						}
						$r = zpp_$nape_util_ZPP_$Flags.ValidationResult_VALID;
						return $r;
					}(this))) throw new js__$Boot_HaxeError("Error: Cannot simulate with an invalid Polygon : " + s1.polygon.outer.toString() + " is invalid : " + res1.toString());
					s1.polygon.validate_gaxi();
				}
				s1.validate_sweepRadius();
				if(s1.sweepRadius > cur1.sweepRadius) cur1.sweepRadius = s1.sweepRadius;
				cx_ite5 = cx_ite5.next;
			}
			cur1.validate_mass();
			cur1.validate_inertia();
			if(!(cur1.shapes.head == null)) {
				cur1.validate_aabb();
				cur1.validate_worldCOM();
			}
			cur1.validate_gravMass();
			if(cur1.zip_axis) {
				cur1.zip_axis = false;
				cur1.axisx = Math.sin(cur1.rot);
				cur1.axisy = Math.cos(cur1.rot);
				null;
			}
			if(!cur1.nomove && cur1.type == 2 && cur1.mass == 0) throw new js__$Boot_HaxeError("Error: Dynamic Body cannot be simulated with 0 mass unless allowMovement is false");
			if(!cur1.norotate && cur1.type == 2 && cur1.inertia == 0) throw new js__$Boot_HaxeError("Error: Dynamic Body cannot be simulated with 0 inertia unless allowRotation is false");
			var cx_ite6 = cur1.shapes.head;
			while(cx_ite6 != null) {
				var shape1 = cx_ite6.elt;
				this.bphase.sync(shape1);
				cx_ite6 = cx_ite6.next;
			}
			cx_ite4 = cx_ite4.next;
		}
		var cx_ite7 = this.live_constraints.head;
		while(cx_ite7 != null) {
			var con = cx_ite7.elt;
			if(con.active) {
				con.validate();
				if(con.component.woken && con.cbSet != null) {
					var cx_ite8 = con.cbSet.conlisteners.head;
					while(cx_ite8 != null) {
						var i1 = cx_ite8.elt;
						if(i1.event != 2) {
							cx_ite8 = cx_ite8.next;
							continue;
						}
						var cb1 = this.push_callback(i1);
						cb1.event = 2;
						cb1.constraint = con;
						cx_ite8 = cx_ite8.next;
					}
				}
				con.component.woken = false;
			}
			cx_ite7 = cx_ite7.next;
		}
	}
	,updateVel: function(dt) {
		var pre = null;
		var linDrag = 1 - dt * this.global_lin_drag;
		var angDrag = 1 - dt * this.global_ang_drag;
		var cx_ite = this.live.head;
		while(cx_ite != null) {
			var cur = cx_ite.elt;
			if(cur.smass != 0.0) {
				var time = dt * cur.imass;
				cur.velx = linDrag * cur.velx + (cur.forcex + this.gravityx * cur.gravMass) * time;
				cur.vely = linDrag * cur.vely + (cur.forcey + this.gravityy * cur.gravMass) * time;
			}
			if(cur.sinertia != 0.0) {
				var dpx = 0.0;
				var dpy = 0.0;
				dpx = cur.worldCOMx - cur.posx;
				dpy = cur.worldCOMy - cur.posy;
				var torque = cur.torque + (this.gravityy * dpx - this.gravityx * dpy) * cur.gravMass;
				cur.angvel = angDrag * cur.angvel + torque * dt * cur.iinertia;
			}
			pre = cx_ite;
			cx_ite = cx_ite.next;
		}
	}
	,updatePos: function(dt) {
		var MAX_VEL = 2 * Math.PI / dt;
		var cx_ite = this.live.head;
		while(cx_ite != null) {
			var cur = cx_ite.elt;
			cur.pre_posx = cur.posx;
			cur.pre_posy = cur.posy;
			cur.pre_rot = cur.rot;
			cur.sweepTime = 0;
			cur.sweep_angvel = cur.angvel % MAX_VEL;
			cur.sweepIntegrate(dt);
			if(!cur.disableCCD) {
				var linThreshold = nape_Config.staticCCDLinearThreshold * cur.sweepRadius;
				var angThreshold = nape_Config.staticCCDAngularThreshold;
				if((cur.velx * cur.velx + cur.vely * cur.vely) * dt * dt > linThreshold * linThreshold || cur.angvel * cur.angvel * dt * dt > angThreshold * angThreshold || cur.type == 3) {
					var angvel = cur.sweep_angvel;
					if(angvel < 0) angvel = -angvel;
					var iangvel = 1 / angvel;
					var cx_ite1 = cur.shapes.head;
					while(cx_ite1 != null) {
						var s = cx_ite1.elt;
						var aabb = s.aabb;
						var minx = aabb.minx;
						var miny = aabb.miny;
						var maxx = aabb.maxx;
						var maxy = aabb.maxy;
						var count = angvel * dt * s.sweepCoef * 0.00833333333333333322 | 0;
						if(count > 8) count = 8;
						var anginc = angvel * dt / count;
						cur.sweepIntegrate(dt);
						if(s.type == 0) s.circle._force_validate_aabb(); else s.polygon._force_validate_aabb();
						if(minx < aabb.minx) aabb.minx = minx; else minx = aabb.minx;
						if(miny < aabb.miny) aabb.miny = miny; else miny = aabb.miny;
						if(maxx > aabb.maxx) aabb.maxx = maxx; else maxx = aabb.maxx;
						if(maxy > aabb.maxy) aabb.maxy = maxy; else maxy = aabb.maxy;
						var _g = 1;
						while(_g < count) {
							var i = _g++;
							cur.sweepIntegrate(anginc * i * iangvel);
							if(s.type == 0) s.circle._force_validate_aabb(); else s.polygon._force_validate_aabb();
							if(minx < aabb.minx) aabb.minx = minx; else minx = aabb.minx;
							if(miny < aabb.miny) aabb.miny = miny; else miny = aabb.miny;
							if(maxx > aabb.maxx) aabb.maxx = maxx; else maxx = aabb.maxx;
							if(maxy > aabb.maxy) aabb.maxy = maxy; else maxy = aabb.maxy;
						}
						this.bphase.sync(s);
						cx_ite1 = cx_ite1.next;
					}
					cur.sweepFrozen = false;
					if(cur.type == 2 && cur.bulletEnabled) {
						var linThreshold2 = nape_Config.bulletCCDLinearThreshold * cur.sweepRadius;
						var angThreshold2 = nape_Config.bulletCCDAngularThreshold;
						if((cur.velx * cur.velx + cur.vely * cur.vely) * dt * dt > linThreshold2 * linThreshold2 || cur.angvel * cur.angvel * dt * dt > angThreshold2 * angThreshold2) cur.bullet = true;
					}
				} else {
					cur.sweepFrozen = true;
					cur.bullet = false;
				}
			} else {
				cur.sweepFrozen = true;
				cur.bullet = false;
			}
			cx_ite = cx_ite.next;
		}
		var cx_ite2 = this.kinematics.head;
		while(cx_ite2 != null) {
			var cur1 = cx_ite2.elt;
			cur1.pre_posx = cur1.posx;
			cur1.pre_posy = cur1.posy;
			cur1.pre_rot = cur1.rot;
			cur1.sweepTime = 0;
			cur1.sweep_angvel = cur1.angvel % MAX_VEL;
			cur1.sweepIntegrate(dt);
			if(!cur1.disableCCD) {
				var linThreshold1 = nape_Config.staticCCDLinearThreshold * cur1.sweepRadius;
				var angThreshold1 = nape_Config.staticCCDAngularThreshold;
				if((cur1.velx * cur1.velx + cur1.vely * cur1.vely) * dt * dt > linThreshold1 * linThreshold1 || cur1.angvel * cur1.angvel * dt * dt > angThreshold1 * angThreshold1 || cur1.type == 3) {
					var angvel1 = cur1.sweep_angvel;
					if(angvel1 < 0) angvel1 = -angvel1;
					var iangvel1 = 1 / angvel1;
					var cx_ite3 = cur1.shapes.head;
					while(cx_ite3 != null) {
						var s1 = cx_ite3.elt;
						var aabb1 = s1.aabb;
						var minx1 = aabb1.minx;
						var miny1 = aabb1.miny;
						var maxx1 = aabb1.maxx;
						var maxy1 = aabb1.maxy;
						var count1 = angvel1 * dt * s1.sweepCoef * 0.00833333333333333322 | 0;
						if(count1 > 8) count1 = 8;
						var anginc1 = angvel1 * dt / count1;
						cur1.sweepIntegrate(dt);
						if(s1.type == 0) s1.circle._force_validate_aabb(); else s1.polygon._force_validate_aabb();
						if(minx1 < aabb1.minx) aabb1.minx = minx1; else minx1 = aabb1.minx;
						if(miny1 < aabb1.miny) aabb1.miny = miny1; else miny1 = aabb1.miny;
						if(maxx1 > aabb1.maxx) aabb1.maxx = maxx1; else maxx1 = aabb1.maxx;
						if(maxy1 > aabb1.maxy) aabb1.maxy = maxy1; else maxy1 = aabb1.maxy;
						var _g1 = 1;
						while(_g1 < count1) {
							var i1 = _g1++;
							cur1.sweepIntegrate(anginc1 * i1 * iangvel1);
							if(s1.type == 0) s1.circle._force_validate_aabb(); else s1.polygon._force_validate_aabb();
							if(minx1 < aabb1.minx) aabb1.minx = minx1; else minx1 = aabb1.minx;
							if(miny1 < aabb1.miny) aabb1.miny = miny1; else miny1 = aabb1.miny;
							if(maxx1 > aabb1.maxx) aabb1.maxx = maxx1; else maxx1 = aabb1.maxx;
							if(maxy1 > aabb1.maxy) aabb1.maxy = maxy1; else maxy1 = aabb1.maxy;
						}
						this.bphase.sync(s1);
						cx_ite3 = cx_ite3.next;
					}
					cur1.sweepFrozen = false;
					if(cur1.type == 2 && cur1.bulletEnabled) {
						var linThreshold21 = nape_Config.bulletCCDLinearThreshold * cur1.sweepRadius;
						var angThreshold21 = nape_Config.bulletCCDAngularThreshold;
						if((cur1.velx * cur1.velx + cur1.vely * cur1.vely) * dt * dt > linThreshold21 * linThreshold21 || cur1.angvel * cur1.angvel * dt * dt > angThreshold21 * angThreshold21) cur1.bullet = true;
					}
				} else {
					cur1.sweepFrozen = true;
					cur1.bullet = false;
				}
			} else {
				cur1.sweepFrozen = true;
				cur1.bullet = false;
			}
			cx_ite2 = cx_ite2.next;
		}
	}
	,presteparb: function(arb,dt,cont) {
		if(cont == null) cont = false;
		var _g = this;
		if(!arb.cleared && (arb.b1.component.sleeping && arb.b2.component.sleeping)) {
			arb.sleep_stamp = this.stamp;
			arb.sleeping = true;
			return true;
		}
		if(!arb.cleared || arb.present != 0 || arb.intchange) {
			var endcb = !cont && arb.up_stamp == this.stamp - 1 && !arb.cleared && !arb.intchange;
			var begcb = arb.fresh && !arb.cleared && !arb.intchange;
			if(endcb) arb.endGenerated = this.stamp;
			if(begcb || endcb || arb.cleared || arb.intchange) {
				this.inlined_MRCA_chains(arb.ws1,arb.ws2);
				var cx_ite = this.mrca1.head;
				while(cx_ite != null) {
					var i1 = cx_ite.elt;
					var cx_ite1 = this.mrca2.head;
					while(cx_ite1 != null) {
						var i2 = cx_ite1.elt;
						var cb1 = i1.cbSet;
						var cb2 = i2.cbSet;
						if(cb1.manager.pair(cb1,cb2).empty_intersection()) {
							cx_ite1 = cx_ite1.next;
							continue;
						}
						var callbackset = [zpp_$nape_phys_ZPP_$Interactor.get(i1,i2)];
						if(begcb || arb.intchange) {
							if(callbackset[0] == null) {
								callbackset[0] = zpp_$nape_space_ZPP_$CallbackSet.get(i1,i2);
								this.add_callbackset(callbackset[0]);
							}
							cb1.manager.pair(cb1,cb2).forall(0,(function(callbackset) {
								return function(listener) {
									if((listener.itype & arb.type) != 0 && callbackset[0].empty_arb(listener.itype)) {
										var cb = _g.push_callback(listener);
										cb.event = 0;
										zpp_$nape_phys_ZPP_$Interactor.int_callback(callbackset[0],listener,cb);
										cb.set = callbackset[0];
									}
								};
							})(callbackset));
							if(!callbackset[0].arbiters.inlined_has(arb)?(function($this) {
								var $r;
								callbackset[0].arbiters.inlined_add(arb);
								$r = true;
								return $r;
							}(this)):false) arb.present++;
						} else {
							arb.present--;
							callbackset[0].remove_arb(arb);
							cb1.manager.pair(cb1,cb2).forall(1,(function(callbackset) {
								return function(listener1) {
									if((listener1.itype & arb.type) != 0 && callbackset[0].empty_arb(listener1.itype)) {
										var cb3 = _g.push_callback(listener1);
										cb3.event = 1;
										zpp_$nape_phys_ZPP_$Interactor.int_callback(callbackset[0],listener1,cb3);
										cb3.set = callbackset[0];
									}
								};
							})(callbackset));
							if(callbackset[0].arbiters.head == null) this.remove_callbackset(callbackset[0]);
						}
						cx_ite1 = cx_ite1.next;
					}
					cx_ite = cx_ite.next;
				}
			}
			arb.fresh = false;
			arb.intchange = false;
		}
		if(arb.cleared || arb.up_stamp + (arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.COL?nape_Config.arbiterExpirationDelay:0) < this.stamp) {
			if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.SENSOR) arb.sensorarb.retire(); else if(arb.type == zpp_$nape_dynamics_ZPP_$Arbiter.FLUID) arb.fluidarb.retire(); else arb.colarb.retire();
			return true;
		}
		var pact = arb.active;
		arb.active = arb.presentable = arb.up_stamp == this.stamp;
		if((arb.immState & 1) != 0) {
			if(arb.active && arb.type != zpp_$nape_dynamics_ZPP_$Arbiter.SENSOR) {
				if(arb.colarb != null) {
					if(arb.colarb.preStep(dt)) arb.active = false;
				} else arb.fluidarb.preStep(this,dt);
			}
		} else if(arb.colarb != null) {
			if(arb.colarb.cleanupContacts()) arb.active = false;
		}
		if(pact != arb.active) {
			arb.b1.arbiters.modified = true;
			arb.b2.arbiters.modified = true;
			this.c_arbiters_true.modified = this.c_arbiters_false.modified = true;
			this.s_arbiters.modified = this.f_arbiters.modified = true;
		}
		return false;
	}
	,prestep: function(dt) {
		var pre = null;
		var cx_ite = this.live_constraints.head;
		while(cx_ite != null) {
			var con = cx_ite.elt;
			if(con.preStep(dt)) {
				cx_ite = this.live_constraints.erase(pre);
				con.broken();
				this.constraintCbBreak(con);
				if(con.removeOnBreak) {
					con.component.sleeping = true;
					this.midstep = false;
					if(con.compound != null) con.compound.wrap_constraints.remove(con.outer); else this.wrap_constraints.remove(con.outer);
					this.midstep = true;
				} else con.active = false;
				con.clearcache();
				continue;
			}
			pre = cx_ite;
			cx_ite = cx_ite.next;
		}
		var pre1 = null;
		var arbs = this.c_arbiters_true;
		var arbite = arbs.head;
		var fst = this.c_arbiters_false != null;
		if(fst && arbite == null) {
			fst = false;
			arbite = this.c_arbiters_false.head;
			arbs = this.c_arbiters_false;
			pre1 = null;
		}
		while(arbite != null) {
			var arb = arbite.elt;
			if(this.presteparb(arb,dt)) {
				arbite = arbs.inlined_erase(pre1);
				if(fst && arbite == null) {
					fst = false;
					arbite = this.c_arbiters_false.head;
					arbs = this.c_arbiters_false;
					pre1 = null;
				}
				continue;
			}
			pre1 = arbite;
			arbite = arbite.next;
			if(fst && arbite == null) {
				fst = false;
				arbite = this.c_arbiters_false.head;
				arbs = this.c_arbiters_false;
				pre1 = null;
			}
		}
		var pre2 = null;
		var arbs1 = this.f_arbiters;
		var arbite1 = arbs1.head;
		var fst1 = false;
		if(fst1 && arbite1 == null) {
			fst1 = false;
			arbs1 = null;
			pre2 = null;
		}
		while(arbite1 != null) {
			var arb1 = arbite1.elt;
			if(this.presteparb(arb1,dt)) {
				arbite1 = arbs1.inlined_erase(pre2);
				if(fst1 && arbite1 == null) {
					fst1 = false;
					arbs1 = null;
					pre2 = null;
				}
				continue;
			}
			pre2 = arbite1;
			arbite1 = arbite1.next;
			if(fst1 && arbite1 == null) {
				fst1 = false;
				arbs1 = null;
				pre2 = null;
			}
		}
		var pre3 = null;
		var arbs2 = this.s_arbiters;
		var arbite2 = arbs2.head;
		var fst2 = false;
		if(fst2 && arbite2 == null) {
			fst2 = false;
			arbs2 = null;
			pre3 = null;
		}
		while(arbite2 != null) {
			var arb2 = arbite2.elt;
			if(this.presteparb(arb2,dt)) {
				arbite2 = arbs2.inlined_erase(pre3);
				if(fst2 && arbite2 == null) {
					fst2 = false;
					arbs2 = null;
					pre3 = null;
				}
				continue;
			}
			pre3 = arbite2;
			arbite2 = arbite2.next;
			if(fst2 && arbite2 == null) {
				fst2 = false;
				arbs2 = null;
				pre3 = null;
			}
		}
	}
	,warmStart: function() {
		var cx_ite = this.f_arbiters.head;
		while(cx_ite != null) {
			var arb = cx_ite.elt;
			if(arb.active && (arb.immState & 1) != 0) arb.warmStart();
			cx_ite = cx_ite.next;
		}
		var arbi = this.c_arbiters_false.head;
		var fst = true;
		if(arbi == null) {
			arbi = this.c_arbiters_true.head;
			fst = false;
		}
		while(arbi != null) {
			var arb1 = arbi.elt;
			if(arb1.active && (arb1.immState & 1) != 0) arb1.warmStart();
			arbi = arbi.next;
			if(fst && arbi == null) {
				arbi = this.c_arbiters_true.head;
				fst = false;
			}
		}
		var cx_ite1 = this.live_constraints.head;
		while(cx_ite1 != null) {
			var con = cx_ite1.elt;
			con.warmStart();
			cx_ite1 = cx_ite1.next;
		}
	}
	,iterateVel: function(times) {
		var _g = 0;
		while(_g < times) {
			var i = _g++;
			var cx_ite = this.f_arbiters.head;
			while(cx_ite != null) {
				var arb = cx_ite.elt;
				if(arb.active && (arb.immState & 1) != 0) arb.applyImpulseVel();
				cx_ite = cx_ite.next;
			}
			var pre = null;
			var cx_ite1 = this.live_constraints.head;
			while(cx_ite1 != null) {
				var con = cx_ite1.elt;
				if(con.applyImpulseVel()) {
					cx_ite1 = this.live_constraints.erase(pre);
					con.broken();
					this.constraintCbBreak(con);
					if(con.removeOnBreak) {
						con.component.sleeping = true;
						this.midstep = false;
						if(con.compound != null) con.compound.wrap_constraints.remove(con.outer); else this.wrap_constraints.remove(con.outer);
						this.midstep = true;
					} else con.active = false;
					con.clearcache();
					continue;
				}
				pre = cx_ite1;
				cx_ite1 = cx_ite1.next;
			}
			var arbi = this.c_arbiters_false.head;
			var fst = true;
			if(arbi == null) {
				arbi = this.c_arbiters_true.head;
				fst = false;
			}
			while(arbi != null) {
				var arb1 = arbi.elt;
				if(arb1.active && (arb1.immState & 1) != 0) arb1.applyImpulseVel();
				arbi = arbi.next;
				if(fst && arbi == null) {
					arbi = this.c_arbiters_true.head;
					fst = false;
				}
			}
		}
	}
	,iteratePos: function(times) {
		var _g = 0;
		while(_g < times) {
			var i = _g++;
			var pre = null;
			var cx_ite = this.live_constraints.head;
			while(cx_ite != null) {
				var con = cx_ite.elt;
				if(!con.__velocity && con.stiff) {
					if(con.applyImpulsePos()) {
						cx_ite = this.live_constraints.erase(pre);
						con.broken();
						this.constraintCbBreak(con);
						if(con.removeOnBreak) {
							con.component.sleeping = true;
							this.midstep = false;
							if(con.compound != null) con.compound.wrap_constraints.remove(con.outer); else this.wrap_constraints.remove(con.outer);
							this.midstep = true;
						} else con.active = false;
						con.clearcache();
						continue;
					}
				}
				pre = cx_ite;
				cx_ite = cx_ite.next;
			}
			var arbi = this.c_arbiters_false.head;
			var fst = true;
			if(arbi == null) {
				arbi = this.c_arbiters_true.head;
				fst = false;
			}
			while(arbi != null) {
				var arb = arbi.elt;
				if(arb.active && (arb.immState & 1) != 0) arb.applyImpulsePos();
				arbi = arbi.next;
				if(fst && arbi == null) {
					arbi = this.c_arbiters_true.head;
					fst = false;
				}
			}
		}
	}
	,group_ignore: function(s1,s2) {
		var g1 = s1.lookup_group();
		if(g1 == null) return false; else {
			var g2 = s2.lookup_group();
			if(g2 == null) return false; else {
				var ret = false;
				while(g1 != null && g2 != null) {
					if(g1 == g2) {
						ret = g1.ignore;
						break;
					}
					if(g1.depth < g2.depth) g2 = g2.group; else g1 = g1.group;
				}
				return ret;
			}
		}
	}
	,interactionType: function(s1,s2,b1,b2) {
		var con_ignore;
		con_ignore = false;
		var cx_ite = b1.constraints.head;
		while(cx_ite != null) {
			var con = cx_ite.elt;
			if(con.ignore && con.pair_exists(b1.id,b2.id)) {
				con_ignore = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		if(!con_ignore && !this.group_ignore(s1,s2)) {
			if((s1.sensorEnabled || s2.sensorEnabled) && s1.filter.shouldSense(s2.filter)) return 2; else if((s1.fluidEnabled || s2.fluidEnabled) && s1.filter.shouldFlow(s2.filter) && !(b1.imass == 0 && b2.imass == 0 && b1.iinertia == 0 && b2.iinertia == 0)) return 0; else if(s1.filter.shouldCollide(s2.filter) && !(b1.imass == 0 && b2.imass == 0 && b1.iinertia == 0 && b2.iinertia == 0)) return 1; else return -1;
		} else return -1;
	}
	,narrowPhase: function(s1,s2,stat,in_arb,continuous) {
		var _g = this;
		var ret = null;
		var b1 = s1.body;
		var b2 = s2.body;
		var itype = this.interactionType(s1,s2,b1,b2);
		if(itype != -1) {
			var sa;
			var sb;
			if(s1.type > s2.type) {
				sa = s2;
				sb = s1;
			} else if(s1.type == s2.type) {
				if(s1.id < s2.id) {
					sa = s1;
					sb = s2;
				} else {
					sb = s1;
					sa = s2;
				}
			} else {
				sa = s1;
				sb = s2;
			}
			var reverse = sa == s2;
			if(itype == 0) {
				var xarb;
				if(in_arb == null) {
					var ret1 = null;
					var b;
					if(b1.arbiters.length < b2.arbiters.length) b = b1; else b = b2;
					var cx_ite = b.arbiters.head;
					while(cx_ite != null) {
						var arb1 = cx_ite.elt;
						if(arb1.id == sa.id && arb1.di == sb.id) {
							ret1 = arb1;
							break;
						}
						cx_ite = cx_ite.next;
					}
					xarb = ret1;
				} else xarb = in_arb;
				var first = xarb == null;
				var arb;
				var swapped = false;
				if(first) {
					if(zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool == null) arb = new zpp_$nape_dynamics_ZPP_$FluidArbiter(); else {
						arb = zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool = arb.next;
						arb.next = null;
					}
					null;
				} else if(xarb.fluidarb == null) {
					xarb.cleared = true;
					xarb.b1.arbiters.inlined_try_remove(xarb);
					xarb.b2.arbiters.inlined_try_remove(xarb);
					if(xarb.pair != null) {
						xarb.pair.arb = null;
						xarb.pair = null;
					}
					xarb.active = false;
					this.f_arbiters.modified = true;
					if(zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool == null) arb = new zpp_$nape_dynamics_ZPP_$FluidArbiter(); else {
						arb = zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool = arb.next;
						arb.next = null;
					}
					null;
					arb.intchange = true;
					first = true;
					swapped = true;
				} else arb = xarb.fluidarb;
				var inttype = 4;
				if(first || arb.stamp != this.stamp || continuous) {
					arb.stamp = this.stamp;
					if(zpp_$nape_geom_ZPP_$Collide.flowCollide(sa,sb,arb)) {
						if(first) {
							arb.b1 = s1.body;
							arb.ws1 = s1;
							arb.b2 = s2.body;
							arb.ws2 = s2;
							arb.id = sa.id;
							arb.di = sb.id;
							arb.b1.arbiters.inlined_add(arb);
							arb.b2.arbiters.inlined_add(arb);
							arb.active = true;
							arb.present = 0;
							arb.cleared = false;
							arb.sleeping = false;
							arb.fresh = false;
							arb.presentable = false;
							arb.nx = 0;
							arb.ny = 1;
							arb.dampx = 0;
							arb.dampy = 0;
							arb.adamp = 0.0;
							this.f_arbiters.inlined_add(arb);
							arb.fresh = !swapped;
						} else arb.fresh = arb.up_stamp < this.stamp - 1 || arb.endGenerated == this.stamp && continuous;
						arb.up_stamp = arb.stamp;
						if(arb.fresh || (arb.immState & 4) == 0) {
							arb.immState = 1;
							var anyimpure = false;
							var arbs1;
							if(arb.ws1.id > arb.ws2.id) arbs1 = arb.ws2; else arbs1 = arb.ws1;
							var arbs2;
							if(arb.ws1.id > arb.ws2.id) arbs2 = arb.ws1; else arbs2 = arb.ws2;
							this.inlined_MRCA_chains(arbs1,arbs2);
							var cx_ite1 = this.mrca1.head;
							while(cx_ite1 != null) {
								var i1 = cx_ite1.elt;
								var cx_ite2 = this.mrca2.head;
								while(cx_ite2 != null) {
									var i2 = cx_ite2.elt;
									var cb1 = i1.cbSet;
									var cb2 = i2.cbSet;
									if(cb1.manager.pair(cb1,cb2).empty_intersection()) {
										cx_ite2 = cx_ite2.next;
										continue;
									}
									var callbackset = null;
									var ncallbackset = null;
									this.prelisteners.inlined_clear();
									var lite = [null];
									cb1.manager.pair(cb1,cb2).forall(5,(function(lite) {
										return function(listener) {
											if((listener.itype & inttype) != 0) {
												lite[0] = _g.prelisteners.inlined_insert(lite[0],listener);
												anyimpure = anyimpure || !listener.pure;
											}
										};
									})(lite));
									if(this.prelisteners.head == null) {
										cx_ite2 = cx_ite2.next;
										continue;
									}
									callbackset = zpp_$nape_phys_ZPP_$Interactor.get(i1,i2);
									if(callbackset == null) {
										ncallbackset = zpp_$nape_space_ZPP_$CallbackSet.get(i1,i2);
										this.add_callbackset(ncallbackset);
									}
									if(callbackset == null || (callbackset.FLUIDstamp != this.stamp || continuous) && (callbackset.FLUIDstate & 4) == 0) {
										if(ncallbackset != null) callbackset = ncallbackset;
										if(callbackset != null) {
											var cx_ite3 = this.prelisteners.head;
											while(cx_ite3 != null) {
												var listener1 = cx_ite3.elt;
												if(listener1.itype == 7) {
													callbackset.COLLISIONstamp = this.stamp;
													callbackset.SENSORstamp = this.stamp;
													callbackset.FLUIDstamp = this.stamp;
												} else callbackset.FLUIDstamp = this.stamp;
												cx_ite3 = cx_ite3.next;
											}
										}
										arb.mutable = true;
										if(arb.wrap_position != null) arb.wrap_position.zpp_inner._immutable = false;
										var pact = arb.active;
										arb.active = true;
										var emptycontacts = false;
										this.precb.zpp_inner.pre_arbiter = arb;
										this.precb.zpp_inner.set = callbackset;
										var cx_ite4 = this.prelisteners.head;
										while(cx_ite4 != null) {
											var listener2 = cx_ite4.elt;
											this.precb.zpp_inner.listener = listener2;
											zpp_$nape_phys_ZPP_$Interactor.int_callback(callbackset,listener2,this.precb.zpp_inner);
											this.precb.zpp_inner.pre_swapped = i1 != this.precb.zpp_inner.int1;
											var ret2 = listener2.handlerp(this.precb);
											if(ret2 != null) if(ret2 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT;
												return $r;
											}(this))) arb.immState = 5; else if(ret2 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE;
												return $r;
											}(this))) arb.immState = 1; else if(ret2 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE;
												return $r;
											}(this))) arb.immState = 6; else arb.immState = 2;
											cx_ite4 = cx_ite4.next;
										}
										arb.mutable = false;
										if(arb.wrap_position != null) arb.wrap_position.zpp_inner._immutable = true;
										arb.active = pact;
										if(callbackset != null) {
											var cx_ite5 = this.prelisteners.head;
											while(cx_ite5 != null) {
												var listener3 = cx_ite5.elt;
												if(listener3.itype == 7) {
													callbackset.COLLISIONstate = arb.immState;
													callbackset.SENSORstate = arb.immState;
													callbackset.FLUIDstate = arb.immState;
												} else callbackset.FLUIDstate = arb.immState;
												cx_ite5 = cx_ite5.next;
											}
										}
									} else if(callbackset == null) {
										if((arb.immState & 4) == 0) arb.immState = 1;
									} else arb.immState = callbackset.FLUIDstate;
									cx_ite2 = cx_ite2.next;
								}
								cx_ite1 = cx_ite1.next;
							}
							if(anyimpure && (arb.immState & 4) == 0) {
								if(arb.b1.type == 2) {
									var o = arb.b1;
									if(!o.world) {
										o.component.waket = this.stamp + (this.midstep?0:1);
										if(o.type == 3) o.kinematicDelaySleep = true;
										if(o.component.sleeping) this.really_wake(o,false);
									}
								}
								if(arb.b1.type == 2) {
									var o1 = arb.b2;
									if(!o1.world) {
										o1.component.waket = this.stamp + (this.midstep?0:1);
										if(o1.type == 3) o1.kinematicDelaySleep = true;
										if(o1.component.sleeping) this.really_wake(o1,false);
									}
								}
							}
						}
						if((arb.immState & 1) != 0) {
							if(arb.b1.type == 2 && arb.b1.component.sleeping) {
								var o2 = arb.b1;
								if(!o2.world) {
									o2.component.waket = this.stamp + (this.midstep?0:1);
									if(o2.type == 3) o2.kinematicDelaySleep = true;
									if(o2.component.sleeping) this.really_wake(o2,false);
								}
							}
							if(arb.b2.type == 2 && arb.b2.component.sleeping) {
								var o3 = arb.b2;
								if(!o3.world) {
									o3.component.waket = this.stamp + (this.midstep?0:1);
									if(o3.type == 3) o3.kinematicDelaySleep = true;
									if(o3.component.sleeping) this.really_wake(o3,false);
								}
							}
						}
						if(arb.sleeping) {
							arb.sleeping = false;
							this.f_arbiters.inlined_add(arb);
						}
						ret = arb;
					} else if(first) {
						var o4 = arb;
						o4.next = zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$FluidArbiter.zpp_pool = o4;
						ret = null;
					} else ret = arb;
				} else ret = arb;
			} else if(itype == 1) {
				var carbs;
				if(stat) carbs = this.c_arbiters_true; else carbs = this.c_arbiters_false;
				var xarb1;
				if(in_arb == null) {
					var ret3 = null;
					var b3;
					if(b1.arbiters.length < b2.arbiters.length) b3 = b1; else b3 = b2;
					var cx_ite6 = b3.arbiters.head;
					while(cx_ite6 != null) {
						var arb3 = cx_ite6.elt;
						if(arb3.id == sa.id && arb3.di == sb.id) {
							ret3 = arb3;
							break;
						}
						cx_ite6 = cx_ite6.next;
					}
					xarb1 = ret3;
				} else xarb1 = in_arb;
				var first1 = xarb1 == null;
				var arb2;
				var swapped1 = false;
				if(first1) {
					if(zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool == null) arb2 = new zpp_$nape_dynamics_ZPP_$ColArbiter(); else {
						arb2 = zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool = arb2.next;
						arb2.next = null;
					}
					null;
					arb2.stat = stat;
				} else if(xarb1.colarb == null) {
					xarb1.cleared = true;
					xarb1.b1.arbiters.inlined_try_remove(xarb1);
					xarb1.b2.arbiters.inlined_try_remove(xarb1);
					if(xarb1.pair != null) {
						xarb1.pair.arb = null;
						xarb1.pair = null;
					}
					xarb1.active = false;
					this.f_arbiters.modified = true;
					if(zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool == null) arb2 = new zpp_$nape_dynamics_ZPP_$ColArbiter(); else {
						arb2 = zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool = arb2.next;
						arb2.next = null;
					}
					null;
					arb2.intchange = true;
					arb2.stat = stat;
					first1 = true;
					swapped1 = true;
				} else {
					arb2 = xarb1.colarb;
					reverse = sa != arb2.s1;
					if(arb2.stat != stat) {
						arb2.stat = stat;
						if(!arb2.sleeping) {
							(stat?this.c_arbiters_false:this.c_arbiters_true).remove(arb2);
							carbs.add(arb2);
						}
					}
				}
				var inttype1 = 1;
				if(first1 || arb2.stamp != this.stamp || continuous) {
					arb2.stamp = this.stamp;
					if(zpp_$nape_geom_ZPP_$Collide.contactCollide(sa,sb,arb2,reverse)) {
						if(first1) {
							arb2.b1 = s1.body;
							arb2.ws1 = s1;
							arb2.b2 = s2.body;
							arb2.ws2 = s2;
							arb2.id = sa.id;
							arb2.di = sb.id;
							arb2.b1.arbiters.inlined_add(arb2);
							arb2.b2.arbiters.inlined_add(arb2);
							arb2.active = true;
							arb2.present = 0;
							arb2.cleared = false;
							arb2.sleeping = false;
							arb2.fresh = false;
							arb2.presentable = false;
							arb2.s1 = s1;
							arb2.s2 = s2;
							if(!arb2.userdef_restitution) {
								if(arb2.s1.material.elasticity <= -Infinity || arb2.s2.material.elasticity <= -Infinity) arb2.restitution = 0; else if(arb2.s1.material.elasticity >= Infinity || arb2.s2.material.elasticity >= Infinity) arb2.restitution = 1; else arb2.restitution = (arb2.s1.material.elasticity + arb2.s2.material.elasticity) / 2;
								if(arb2.restitution < 0) arb2.restitution = 0;
								if(arb2.restitution > 1) arb2.restitution = 1;
							}
							if(!arb2.userdef_dyn_fric) arb2.dyn_fric = Math.sqrt(arb2.s1.material.dynamicFriction * arb2.s2.material.dynamicFriction);
							if(!arb2.userdef_stat_fric) arb2.stat_fric = Math.sqrt(arb2.s1.material.staticFriction * arb2.s2.material.staticFriction);
							if(!arb2.userdef_rfric) arb2.rfric = Math.sqrt(arb2.s1.material.rollingFriction * arb2.s2.material.rollingFriction);
							carbs.inlined_add(arb2);
							arb2.fresh = !swapped1;
						} else arb2.fresh = arb2.up_stamp < this.stamp - 1 || arb2.endGenerated == this.stamp && continuous;
						arb2.up_stamp = arb2.stamp;
						if(arb2.fresh || (arb2.immState & 4) == 0) {
							arb2.immState = 1;
							var anyimpure1 = false;
							var arbs11;
							if(arb2.ws1.id > arb2.ws2.id) arbs11 = arb2.ws2; else arbs11 = arb2.ws1;
							var arbs21;
							if(arb2.ws1.id > arb2.ws2.id) arbs21 = arb2.ws1; else arbs21 = arb2.ws2;
							this.inlined_MRCA_chains(arbs11,arbs21);
							var cx_ite7 = this.mrca1.head;
							while(cx_ite7 != null) {
								var i11 = cx_ite7.elt;
								var cx_ite8 = this.mrca2.head;
								while(cx_ite8 != null) {
									var i21 = cx_ite8.elt;
									var cb11 = i11.cbSet;
									var cb21 = i21.cbSet;
									if(cb11.manager.pair(cb11,cb21).empty_intersection()) {
										cx_ite8 = cx_ite8.next;
										continue;
									}
									var callbackset1 = null;
									var ncallbackset1 = null;
									this.prelisteners.inlined_clear();
									var lite1 = [null];
									cb11.manager.pair(cb11,cb21).forall(5,(function(lite1) {
										return function(listener4) {
											if((listener4.itype & inttype1) != 0) {
												lite1[0] = _g.prelisteners.inlined_insert(lite1[0],listener4);
												anyimpure1 = anyimpure1 || !listener4.pure;
											}
										};
									})(lite1));
									if(this.prelisteners.head == null) {
										cx_ite8 = cx_ite8.next;
										continue;
									}
									callbackset1 = zpp_$nape_phys_ZPP_$Interactor.get(i11,i21);
									if(callbackset1 == null) {
										ncallbackset1 = zpp_$nape_space_ZPP_$CallbackSet.get(i11,i21);
										this.add_callbackset(ncallbackset1);
									}
									if(callbackset1 == null || (callbackset1.COLLISIONstamp != this.stamp || continuous) && (callbackset1.COLLISIONstate & 4) == 0) {
										if(ncallbackset1 != null) callbackset1 = ncallbackset1;
										if(callbackset1 != null) {
											var cx_ite9 = this.prelisteners.head;
											while(cx_ite9 != null) {
												var listener5 = cx_ite9.elt;
												if(listener5.itype == 7) {
													callbackset1.COLLISIONstamp = this.stamp;
													callbackset1.SENSORstamp = this.stamp;
													callbackset1.FLUIDstamp = this.stamp;
												} else callbackset1.COLLISIONstamp = this.stamp;
												cx_ite9 = cx_ite9.next;
											}
										}
										arb2.mutable = true;
										if(arb2.wrap_normal != null) arb2.wrap_normal.zpp_inner._immutable = false;
										if(arb2.wrap_contacts != null) arb2.wrap_contacts.zpp_inner.immutable = false;
										var pact1 = arb2.active;
										arb2.active = true;
										var emptycontacts1 = false;
										arb2.cleanupContacts();
										this.precb.zpp_inner.pre_arbiter = arb2;
										this.precb.zpp_inner.set = callbackset1;
										var cx_ite10 = this.prelisteners.head;
										while(cx_ite10 != null) {
											var listener6 = cx_ite10.elt;
											this.precb.zpp_inner.listener = listener6;
											zpp_$nape_phys_ZPP_$Interactor.int_callback(callbackset1,listener6,this.precb.zpp_inner);
											this.precb.zpp_inner.pre_swapped = i11 != this.precb.zpp_inner.int1;
											var ret4 = listener6.handlerp(this.precb);
											if(ret4 != null) if(ret4 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT;
												return $r;
											}(this))) arb2.immState = 5; else if(ret4 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE;
												return $r;
											}(this))) arb2.immState = 1; else if(ret4 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE;
												return $r;
											}(this))) arb2.immState = 6; else arb2.immState = 2;
											cx_ite10 = cx_ite10.next;
										}
										arb2.mutable = false;
										if(arb2.wrap_normal != null) arb2.wrap_normal.zpp_inner._immutable = true;
										if(arb2.wrap_contacts != null) arb2.wrap_contacts.zpp_inner.immutable = true;
										arb2.active = pact1;
										if(callbackset1 != null) {
											var cx_ite11 = this.prelisteners.head;
											while(cx_ite11 != null) {
												var listener7 = cx_ite11.elt;
												if(listener7.itype == 7) {
													callbackset1.COLLISIONstate = arb2.immState;
													callbackset1.SENSORstate = arb2.immState;
													callbackset1.FLUIDstate = arb2.immState;
												} else callbackset1.COLLISIONstate = arb2.immState;
												cx_ite11 = cx_ite11.next;
											}
										}
									} else if(callbackset1 == null) {
										if((arb2.immState & 4) == 0) arb2.immState = 1;
									} else arb2.immState = callbackset1.COLLISIONstate;
									cx_ite8 = cx_ite8.next;
								}
								cx_ite7 = cx_ite7.next;
							}
							if(anyimpure1 && (arb2.immState & 4) == 0) {
								if(arb2.b1.type == 2) {
									var o5 = arb2.b1;
									if(!o5.world) {
										o5.component.waket = this.stamp + (this.midstep?0:1);
										if(o5.type == 3) o5.kinematicDelaySleep = true;
										if(o5.component.sleeping) this.really_wake(o5,false);
									}
								}
								if(arb2.b1.type == 2) {
									var o6 = arb2.b2;
									if(!o6.world) {
										o6.component.waket = this.stamp + (this.midstep?0:1);
										if(o6.type == 3) o6.kinematicDelaySleep = true;
										if(o6.component.sleeping) this.really_wake(o6,false);
									}
								}
							}
						}
						if((arb2.immState & 1) != 0) {
							if(arb2.b1.type == 2 && arb2.b1.component.sleeping) {
								var o7 = arb2.b1;
								if(!o7.world) {
									o7.component.waket = this.stamp + (this.midstep?0:1);
									if(o7.type == 3) o7.kinematicDelaySleep = true;
									if(o7.component.sleeping) this.really_wake(o7,false);
								}
							}
							if(arb2.b2.type == 2 && arb2.b2.component.sleeping) {
								var o8 = arb2.b2;
								if(!o8.world) {
									o8.component.waket = this.stamp + (this.midstep?0:1);
									if(o8.type == 3) o8.kinematicDelaySleep = true;
									if(o8.component.sleeping) this.really_wake(o8,false);
								}
							}
						}
						if(arb2.sleeping) {
							arb2.sleeping = false;
							carbs.inlined_add(arb2);
						}
						ret = arb2;
					} else if(first1) {
						var o9 = arb2;
						o9.userdef_dyn_fric = false;
						o9.userdef_stat_fric = false;
						o9.userdef_restitution = false;
						o9.userdef_rfric = false;
						o9.__ref_edge1 = o9.__ref_edge2 = null;
						o9.next = zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$ColArbiter.zpp_pool = o9;
						ret = null;
					} else ret = arb2;
				} else ret = arb2;
			} else {
				var xarb2;
				if(in_arb == null) {
					var ret5 = null;
					var b4;
					if(b1.arbiters.length < b2.arbiters.length) b4 = b1; else b4 = b2;
					var cx_ite12 = b4.arbiters.head;
					while(cx_ite12 != null) {
						var arb5 = cx_ite12.elt;
						if(arb5.id == sa.id && arb5.di == sb.id) {
							ret5 = arb5;
							break;
						}
						cx_ite12 = cx_ite12.next;
					}
					xarb2 = ret5;
				} else xarb2 = in_arb;
				var first2 = xarb2 == null;
				var arb4;
				var swapped2 = false;
				if(first2) {
					if(zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool == null) arb4 = new zpp_$nape_dynamics_ZPP_$SensorArbiter(); else {
						arb4 = zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool = arb4.next;
						arb4.next = null;
					}
					null;
				} else if(xarb2.sensorarb == null) {
					xarb2.cleared = true;
					xarb2.b1.arbiters.inlined_try_remove(xarb2);
					xarb2.b2.arbiters.inlined_try_remove(xarb2);
					if(xarb2.pair != null) {
						xarb2.pair.arb = null;
						xarb2.pair = null;
					}
					xarb2.active = false;
					this.f_arbiters.modified = true;
					if(zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool == null) arb4 = new zpp_$nape_dynamics_ZPP_$SensorArbiter(); else {
						arb4 = zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool = arb4.next;
						arb4.next = null;
					}
					null;
					arb4.intchange = true;
					first2 = true;
					swapped2 = true;
				} else arb4 = xarb2.sensorarb;
				var inttype2 = 2;
				if(first2 || arb4.stamp != this.stamp || continuous) {
					arb4.stamp = this.stamp;
					if(zpp_$nape_geom_ZPP_$Collide.testCollide(sa,sb)) {
						if(first2) {
							arb4.b1 = s1.body;
							arb4.ws1 = s1;
							arb4.b2 = s2.body;
							arb4.ws2 = s2;
							arb4.id = sa.id;
							arb4.di = sb.id;
							arb4.b1.arbiters.inlined_add(arb4);
							arb4.b2.arbiters.inlined_add(arb4);
							arb4.active = true;
							arb4.present = 0;
							arb4.cleared = false;
							arb4.sleeping = false;
							arb4.fresh = false;
							arb4.presentable = false;
							this.s_arbiters.inlined_add(arb4);
							arb4.fresh = !swapped2;
						} else arb4.fresh = arb4.up_stamp < this.stamp - 1 || arb4.endGenerated == this.stamp && continuous;
						arb4.up_stamp = arb4.stamp;
						if(arb4.fresh || (arb4.immState & 4) == 0) {
							arb4.immState = 1;
							var anyimpure2 = false;
							var arbs12;
							if(arb4.ws1.id > arb4.ws2.id) arbs12 = arb4.ws2; else arbs12 = arb4.ws1;
							var arbs22;
							if(arb4.ws1.id > arb4.ws2.id) arbs22 = arb4.ws1; else arbs22 = arb4.ws2;
							this.inlined_MRCA_chains(arbs12,arbs22);
							var cx_ite13 = this.mrca1.head;
							while(cx_ite13 != null) {
								var i12 = cx_ite13.elt;
								var cx_ite14 = this.mrca2.head;
								while(cx_ite14 != null) {
									var i22 = cx_ite14.elt;
									var cb12 = i12.cbSet;
									var cb22 = i22.cbSet;
									if(cb12.manager.pair(cb12,cb22).empty_intersection()) {
										cx_ite14 = cx_ite14.next;
										continue;
									}
									var callbackset2 = null;
									var ncallbackset2 = null;
									this.prelisteners.inlined_clear();
									var lite2 = [null];
									cb12.manager.pair(cb12,cb22).forall(5,(function(lite2) {
										return function(listener8) {
											if((listener8.itype & inttype2) != 0) {
												lite2[0] = _g.prelisteners.inlined_insert(lite2[0],listener8);
												anyimpure2 = anyimpure2 || !listener8.pure;
											}
										};
									})(lite2));
									if(this.prelisteners.head == null) {
										cx_ite14 = cx_ite14.next;
										continue;
									}
									callbackset2 = zpp_$nape_phys_ZPP_$Interactor.get(i12,i22);
									if(callbackset2 == null) {
										ncallbackset2 = zpp_$nape_space_ZPP_$CallbackSet.get(i12,i22);
										this.add_callbackset(ncallbackset2);
									}
									if(callbackset2 == null || (callbackset2.SENSORstamp != this.stamp || continuous) && (callbackset2.SENSORstate & 4) == 0) {
										if(ncallbackset2 != null) callbackset2 = ncallbackset2;
										if(callbackset2 != null) {
											var cx_ite15 = this.prelisteners.head;
											while(cx_ite15 != null) {
												var listener9 = cx_ite15.elt;
												if(listener9.itype == 7) {
													callbackset2.COLLISIONstamp = this.stamp;
													callbackset2.SENSORstamp = this.stamp;
													callbackset2.FLUIDstamp = this.stamp;
												} else callbackset2.SENSORstamp = this.stamp;
												cx_ite15 = cx_ite15.next;
											}
										}
										var pact2 = arb4.active;
										arb4.active = true;
										var emptycontacts2 = false;
										this.precb.zpp_inner.pre_arbiter = arb4;
										this.precb.zpp_inner.set = callbackset2;
										var cx_ite16 = this.prelisteners.head;
										while(cx_ite16 != null) {
											var listener10 = cx_ite16.elt;
											this.precb.zpp_inner.listener = listener10;
											zpp_$nape_phys_ZPP_$Interactor.int_callback(callbackset2,listener10,this.precb.zpp_inner);
											this.precb.zpp_inner.pre_swapped = i12 != this.precb.zpp_inner.int1;
											var ret6 = listener10.handlerp(this.precb);
											if(ret6 != null) if(ret6 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT;
												return $r;
											}(this))) arb4.immState = 5; else if(ret6 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_ACCEPT_ONCE;
												return $r;
											}(this))) arb4.immState = 1; else if(ret6 == (function($this) {
												var $r;
												if(zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE == null) {
													zpp_$nape_util_ZPP_$Flags.internal = true;
													zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE = new nape_callbacks_PreFlag();
													zpp_$nape_util_ZPP_$Flags.internal = false;
												}
												$r = zpp_$nape_util_ZPP_$Flags.PreFlag_IGNORE;
												return $r;
											}(this))) arb4.immState = 6; else arb4.immState = 2;
											cx_ite16 = cx_ite16.next;
										}
										arb4.active = pact2;
										if(callbackset2 != null) {
											var cx_ite17 = this.prelisteners.head;
											while(cx_ite17 != null) {
												var listener11 = cx_ite17.elt;
												if(listener11.itype == 7) {
													callbackset2.COLLISIONstate = arb4.immState;
													callbackset2.SENSORstate = arb4.immState;
													callbackset2.FLUIDstate = arb4.immState;
												} else callbackset2.SENSORstate = arb4.immState;
												cx_ite17 = cx_ite17.next;
											}
										}
									} else if(callbackset2 == null) {
										if((arb4.immState & 4) == 0) arb4.immState = 1;
									} else arb4.immState = callbackset2.SENSORstate;
									cx_ite14 = cx_ite14.next;
								}
								cx_ite13 = cx_ite13.next;
							}
							if(anyimpure2 && (arb4.immState & 4) == 0) {
								if(!(arb4.b1.type == 1)) {
									var o10 = arb4.b1;
									if(!o10.world) {
										o10.component.waket = this.stamp + (this.midstep?0:1);
										if(o10.type == 3) o10.kinematicDelaySleep = true;
										if(o10.component.sleeping) this.really_wake(o10,false);
									}
								}
								if(!(arb4.b2.type == 1)) {
									var o11 = arb4.b2;
									if(!o11.world) {
										o11.component.waket = this.stamp + (this.midstep?0:1);
										if(o11.type == 3) o11.kinematicDelaySleep = true;
										if(o11.component.sleeping) this.really_wake(o11,false);
									}
								}
							}
						}
						if(arb4.sleeping) {
							arb4.sleeping = false;
							this.s_arbiters.inlined_add(arb4);
						}
						ret = arb4;
					} else if(first2) {
						var o12 = arb4;
						o12.next = zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool;
						zpp_$nape_dynamics_ZPP_$SensorArbiter.zpp_pool = o12;
						ret = null;
					} else ret = arb4;
				} else ret = arb4;
			}
		}
		return ret;
	}
	,MRCA_chains: function(s1,s2) {
		this.inlined_MRCA_chains(s1,s2);
	}
	,inlined_MRCA_chains: function(s1,s2) {
		this.mrca1.inlined_clear();
		this.mrca2.inlined_clear();
		if(s1.cbSet != null) this.mrca1.inlined_add(s1);
		if(s1.body.cbSet != null) this.mrca1.inlined_add(s1.body);
		if(s2.cbSet != null) this.mrca2.inlined_add(s2);
		if(s2.body.cbSet != null) this.mrca2.inlined_add(s2.body);
		var c1 = s1.body.compound;
		var c2 = s2.body.compound;
		while(c1 != c2) {
			var d1;
			if(c1 == null) d1 = 0; else d1 = c1.depth;
			var d2;
			if(c2 == null) d2 = 0; else d2 = c2.depth;
			if(d1 < d2) {
				if(c2.cbSet != null) this.mrca2.inlined_add(c2);
				c2 = c2.compound;
			} else {
				if(c1.cbSet != null) this.mrca1.inlined_add(c1);
				c1 = c1.compound;
			}
		}
	}
	,__class__: zpp_$nape_space_ZPP_$Space
};
var zpp_$nape_space_ZPP_$SweepData = function() {
	this.aabb = null;
	this.shape = null;
	this.prev = null;
	this.next = null;
};
zpp_$nape_space_ZPP_$SweepData.__name__ = true;
zpp_$nape_space_ZPP_$SweepData.prototype = {
	__class__: zpp_$nape_space_ZPP_$SweepData
};
var zpp_$nape_space_ZPP_$SweepPhase = function(space) {
	this.list = null;
	zpp_$nape_space_ZPP_$Broadphase.call(this);
	this.space = space;
	this.is_sweep = true;
	this.sweep = this;
};
zpp_$nape_space_ZPP_$SweepPhase.__name__ = true;
zpp_$nape_space_ZPP_$SweepPhase.__super__ = zpp_$nape_space_ZPP_$Broadphase;
zpp_$nape_space_ZPP_$SweepPhase.prototype = $extend(zpp_$nape_space_ZPP_$Broadphase.prototype,{
	__insert: function(shape) {
		var dat;
		if(zpp_$nape_space_ZPP_$SweepData.zpp_pool == null) dat = new zpp_$nape_space_ZPP_$SweepData(); else {
			dat = zpp_$nape_space_ZPP_$SweepData.zpp_pool;
			zpp_$nape_space_ZPP_$SweepData.zpp_pool = dat.next;
			dat.next = null;
		}
		null;
		shape.sweep = dat;
		dat.shape = shape;
		dat.aabb = shape.aabb;
		dat.next = this.list;
		if(this.list != null) this.list.prev = dat;
		this.list = dat;
	}
	,__remove: function(shape) {
		var dat = shape.sweep;
		if(dat.prev == null) this.list = dat.next; else dat.prev.next = dat.next;
		if(dat.next != null) dat.next.prev = dat.prev;
		shape.sweep = null;
		var o = dat;
		o.prev = null;
		o.shape = null;
		o.aabb = null;
		o.next = zpp_$nape_space_ZPP_$SweepData.zpp_pool;
		zpp_$nape_space_ZPP_$SweepData.zpp_pool = o;
	}
	,sync_broadphase_fast: function() {
		var a = this.list.next;
		while(a != null) {
			var n = a.next;
			var b = a.prev;
			if(a.aabb.minx > b.aabb.minx) {
				a = n;
				continue;
			}
			while(b.prev != null && b.prev.aabb.minx > a.aabb.minx) b = b.prev;
			var prev = a.prev;
			prev.next = a.next;
			if(a.next != null) a.next.prev = prev;
			if(b.prev == null) {
				a.prev = null;
				this.list = a;
				a.next = b;
				b.prev = a;
			} else {
				a.prev = b.prev;
				b.prev = a;
				a.prev.next = a;
				a.next = b;
			}
			a = n;
		}
	}
	,broadphase: function(space,discrete) {
		if(this.list != null) {
			this.sync_broadphase_fast();
			var d1 = this.list;
			while(d1 != null) {
				var d2 = d1.next;
				var s1 = d1.shape;
				var b1 = s1.body;
				var bottom = d1.aabb.maxx;
				while(d2 != null) {
					if(d2.aabb.minx > bottom) break;
					var s2 = d2.shape;
					var b2 = s2.body;
					if(b2 == b1) {
						d2 = d2.next;
						continue;
					}
					if(b1.type == 1 && b2.type == 1) {
						d2 = d2.next;
						continue;
					}
					if(b1.component.sleeping && b2.component.sleeping) {
						d2 = d2.next;
						continue;
					}
					if(s1.aabb.intersectY(s2.aabb)) {
						if(discrete) space.narrowPhase(s1,s2,!(b1.type == 2) || !(b2.type == 2),null,false); else space.continuousEvent(s1,s2,!(b1.type == 2) || !(b2.type == 2),null,false);
					}
					d2 = d2.next;
				}
				d1 = d1.next;
			}
		}
	}
	,__class__: zpp_$nape_space_ZPP_$SweepPhase
});
var zpp_$nape_util_ZNPList_$ZPP_$CallbackSet = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$CallbackSet.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$CallbackSet.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$CallbackSet
};
var zpp_$nape_util_ZNPList_$ZPP_$Shape = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Shape.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Shape.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Shape(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,insert: function(cur,o) {
		return this.inlined_insert(cur,o);
	}
	,inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Shape(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Shape.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Shape
};
var zpp_$nape_util_ZNPList_$ZPP_$Body = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Body.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Body.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Body(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,insert: function(cur,o) {
		return this.inlined_insert(cur,o);
	}
	,inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Body(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Body.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Body
};
var zpp_$nape_util_ZNPList_$ZPP_$Compound = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Compound.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Compound.prototype = {
	remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Compound.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Compound.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Compound
};
var zpp_$nape_util_ZNPList_$ZPP_$Arbiter = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Arbiter.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Arbiter.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Arbiter(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,erase: function(pre) {
		return this.inlined_erase(pre);
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,inlined_has: function(obj) {
		var ret;
		ret = false;
		var cx_ite = this.head;
		while(cx_ite != null) {
			var npite = cx_ite.elt;
			if(npite == obj) {
				ret = true;
				break;
			}
			cx_ite = cx_ite.next;
		}
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Arbiter
};
var zpp_$nape_util_ZNPList_$ZPP_$CbSetPair = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$CbSetPair.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$CbSetPair.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$CbSetPair
};
var zpp_$nape_util_ZNPList_$ZPP_$AABBPair = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$AABBPair.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$AABBPair.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$AABBPair(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$AABBPair
};
var zpp_$nape_util_ZNPList_$ZPP_$Edge = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Edge.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Edge.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Edge(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,insert: function(cur,o) {
		return this.inlined_insert(cur,o);
	}
	,inlined_insert: function(cur,o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Edge(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		if(cur == null) {
			temp.next = this.head;
			this.head = temp;
		} else {
			temp.next = cur.next;
			cur.next = temp;
		}
		this.pushmod = this.modified = true;
		this.length++;
		return temp;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,erase: function(pre) {
		return this.inlined_erase(pre);
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Edge.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,reverse: function() {
		var cur = this.head;
		var pre = null;
		while(cur != null) {
			var nx = cur.next;
			cur.next = pre;
			this.head = cur;
			pre = cur;
			cur = nx;
		}
		this.modified = true;
		this.pushmod = true;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Edge
};
var zpp_$nape_util_ZNPList_$ZPP_$Component = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Component.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Component.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$Component.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$Component(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$Component.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$Component.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Component.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Component.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Component
};
var zpp_$nape_util_ZNPList_$ZPP_$FluidArbiter = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$FluidArbiter.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$FluidArbiter.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$FluidArbiter
};
var zpp_$nape_util_ZNPList_$ZPP_$SensorArbiter = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$SensorArbiter.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$SensorArbiter.prototype = {
	inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$SensorArbiter
};
var zpp_$nape_util_ZNPList_$ZPP_$Listener = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$Listener.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$Listener.prototype = {
	remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$Listener.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$Listener.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$Listener
};
var zpp_$nape_util_ZNPList_$ZPP_$ColArbiter = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$ColArbiter.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$ColArbiter.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,remove: function(obj) {
		this.inlined_try_remove(obj);
	}
	,inlined_try_remove: function(obj) {
		var pre = null;
		var cur = this.head;
		var ret = false;
		while(cur != null) {
			if(cur.elt == obj) {
				this.inlined_erase(pre);
				ret = true;
				break;
			}
			pre = cur;
			cur = cur.next;
		}
		return ret;
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$ColArbiter
};
var zpp_$nape_util_ZNPList_$ZPP_$InteractionGroup = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$InteractionGroup.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$InteractionGroup.prototype = {
	iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$InteractionGroup
};
var zpp_$nape_util_ZNPList_$ZPP_$ToiEvent = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$ToiEvent.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$ToiEvent.prototype = {
	add: function(o) {
		return this.inlined_add(o);
	}
	,inlined_add: function(o) {
		var temp;
		var ret;
		if(zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool == null) ret = new zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent(); else {
			ret = zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool;
			zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool = ret.next;
			ret.next = null;
		}
		null;
		ret.elt = o;
		temp = ret;
		temp.next = this.head;
		this.head = temp;
		this.modified = true;
		this.length++;
		return o;
	}
	,pop: function() {
		this.inlined_pop();
	}
	,inlined_pop: function() {
		var ret = this.head;
		this.head = ret.next;
		var o = ret;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool = o;
		if(this.head == null) this.pushmod = true;
		this.modified = true;
		this.length--;
	}
	,pop_unsafe: function() {
		return this.inlined_pop_unsafe();
	}
	,inlined_pop_unsafe: function() {
		var ret = this.head.elt;
		this.pop();
		return ret;
	}
	,erase: function(pre) {
		return this.inlined_erase(pre);
	}
	,inlined_erase: function(pre) {
		var old;
		var ret;
		if(pre == null) {
			old = this.head;
			ret = old.next;
			this.head = ret;
			if(this.head == null) this.pushmod = true;
		} else {
			old = pre.next;
			ret = old.next;
			pre.next = ret;
			if(ret == null) this.pushmod = true;
		}
		var o = old;
		o.elt = null;
		o.next = zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool;
		zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.zpp_pool = o;
		this.modified = true;
		this.length--;
		this.pushmod = true;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$ToiEvent
};
var zpp_$nape_util_ZNPList_$ConvexResult = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ConvexResult.__name__ = true;
zpp_$nape_util_ZNPList_$ConvexResult.prototype = {
	iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ConvexResult
};
var zpp_$nape_util_ZNPList_$ZPP_$GeomPoly = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$ZPP_$GeomPoly.__name__ = true;
zpp_$nape_util_ZNPList_$ZPP_$GeomPoly.prototype = {
	iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$ZPP_$GeomPoly
};
var zpp_$nape_util_ZNPList_$RayResult = function() {
	this.length = 0;
	this.pushmod = false;
	this.modified = false;
	this.head = null;
};
zpp_$nape_util_ZNPList_$RayResult.__name__ = true;
zpp_$nape_util_ZNPList_$RayResult.prototype = {
	iterator_at: function(ind) {
		var ret = this.head;
		while(ind-- > 0 && ret != null) ret = ret.next;
		return ret;
	}
	,__class__: zpp_$nape_util_ZNPList_$RayResult
};
var zpp_$nape_util_ZNPNode_$ZPP_$CbType = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$CbType.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$CbType.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$CbType
};
var zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$CallbackSet
};
var zpp_$nape_util_ZNPNode_$ZPP_$Shape = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Shape.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Shape.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Shape
};
var zpp_$nape_util_ZNPNode_$ZPP_$Body = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Body.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Body.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Body
};
var zpp_$nape_util_ZNPNode_$ZPP_$Constraint = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Constraint.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Constraint.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Constraint
};
var zpp_$nape_util_ZNPNode_$ZPP_$Compound = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Compound.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Compound.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Compound
};
var zpp_$nape_util_ZNPNode_$ZPP_$Arbiter = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Arbiter.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Arbiter
};
var zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$InteractionListener
};
var zpp_$nape_util_ZNPNode_$ZPP_$CbSet = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$CbSet.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$CbSet.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$CbSet
};
var zpp_$nape_util_ZNPNode_$ZPP_$Interactor = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Interactor.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Interactor.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Interactor
};
var zpp_$nape_util_ZNPNode_$ZPP_$BodyListener = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$BodyListener.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$BodyListener
};
var zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$CbSetPair
};
var zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$ConstraintListener
};
var zpp_$nape_util_ZNPNode_$ZPP_$Vec2 = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Vec2.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Vec2.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Vec2
};
var zpp_$nape_util_ZNPNode_$ZPP_$AABBPair = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$AABBPair.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$AABBPair
};
var zpp_$nape_util_ZNPNode_$ZPP_$Edge = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Edge.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Edge.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Edge
};
var zpp_$nape_util_ZNPNode_$ZPP_$Component = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Component.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Component.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Component
};
var zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$FluidArbiter
};
var zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$SensorArbiter
};
var zpp_$nape_util_ZNPNode_$ZPP_$Listener = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$Listener.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$Listener.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$Listener
};
var zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$ColArbiter
};
var zpp_$nape_util_ZNPNode_$ZPP_$InteractionGroup = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$InteractionGroup.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$InteractionGroup.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$InteractionGroup
};
var zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$ToiEvent
};
var zpp_$nape_util_ZNPNode_$ConvexResult = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ConvexResult.__name__ = true;
zpp_$nape_util_ZNPNode_$ConvexResult.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ConvexResult
};
var zpp_$nape_util_ZNPNode_$ZPP_$GeomPoly = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$ZPP_$GeomPoly.__name__ = true;
zpp_$nape_util_ZNPNode_$ZPP_$GeomPoly.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$ZPP_$GeomPoly
};
var zpp_$nape_util_ZNPNode_$RayResult = function() {
	this.elt = null;
	this.next = null;
};
zpp_$nape_util_ZNPNode_$RayResult.__name__ = true;
zpp_$nape_util_ZNPNode_$RayResult.prototype = {
	__class__: zpp_$nape_util_ZNPNode_$RayResult
};
var zpp_$nape_util_ZPP_$MixVec2List = function() {
	this.at_index = 0;
	this.at_ite = null;
	this.zip_length = false;
	this._length = 0;
	this.inner = null;
	nape_geom_Vec2List.call(this);
	this.at_ite = null;
	this.at_index = 0;
	this.zip_length = true;
	this._length = 0;
};
zpp_$nape_util_ZPP_$MixVec2List.__name__ = true;
zpp_$nape_util_ZPP_$MixVec2List.get = function(list,immutable) {
	if(immutable == null) immutable = false;
	var ret = new zpp_$nape_util_ZPP_$MixVec2List();
	ret.inner = list;
	ret.zpp_inner.immutable = immutable;
	return ret;
};
zpp_$nape_util_ZPP_$MixVec2List.__super__ = nape_geom_Vec2List;
zpp_$nape_util_ZPP_$MixVec2List.prototype = $extend(nape_geom_Vec2List.prototype,{
	zpp_gl: function() {
		this.zpp_vm();
		if(this.zip_length) {
			this._length = 0;
			var cx_ite = this.inner.next;
			while(cx_ite != null) {
				var i = cx_ite;
				this._length++;
				cx_ite = cx_ite.next;
			}
			this.zip_length = false;
		}
		return this._length;
	}
	,zpp_vm: function() {
		this.zpp_inner.validate();
		if(this.inner.modified) {
			this.zip_length = true;
			this._length = 0;
			this.at_ite = null;
		}
	}
	,at: function(index) {
		this.zpp_vm();
		if(index < 0 || index >= this.zpp_gl()) throw new js__$Boot_HaxeError("Error: Index out of bounds");
		if(this.zpp_inner.reverse_flag) index = this.zpp_gl() - 1 - index;
		if(index < this.at_index || this.at_ite == null) {
			this.at_index = 0;
			this.at_ite = this.inner.next;
			while(true) {
				var x = this.at_ite;
				break;
				this.at_ite = this.at_ite.next;
			}
		}
		while(this.at_index != index) {
			this.at_index++;
			this.at_ite = this.at_ite.next;
			while(true) {
				var x1 = this.at_ite;
				break;
				this.at_ite = this.at_ite.next;
			}
		}
		return this.at_ite.wrapper();
	}
	,push: function(obj) {
		if(this.zpp_inner.immutable) throw new js__$Boot_HaxeError("Error: " + "Vec2" + "List is immutable");
		this.zpp_inner.modify_test();
		this.zpp_vm();
		if(obj.zpp_inner._inuse) throw new js__$Boot_HaxeError("Error: " + "Vec2" + " is already in use");
		var cont;
		if(this.zpp_inner.adder != null) cont = this.zpp_inner.adder(obj); else cont = true;
		if(cont) {
			if(this.zpp_inner.reverse_flag) this.inner.add(obj.zpp_inner); else {
				var ite = this.inner.iterator_at(this.zpp_gl() - 1);
				this.inner.insert(ite,obj.zpp_inner);
			}
			this.zpp_inner.invalidate();
			if(this.zpp_inner.post_adder != null) this.zpp_inner.post_adder(obj);
		}
		return cont;
	}
	,__class__: zpp_$nape_util_ZPP_$MixVec2List
});
var zpp_$nape_util_ZPP_$ConstraintList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this.dontremove = false;
	this.subber = null;
	this.adder = null;
	this._modifiable = null;
	this._validate = null;
	this._invalidate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Constraint();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$ConstraintList.__name__ = true;
zpp_$nape_util_ZPP_$ConstraintList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_constraint_ConstraintList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$ConstraintList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,modify_test: function() {
		if(this._modifiable != null) this._modifiable();
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,invalidate: function() {
		this._invalidated = true;
		if(this._invalidate != null) this._invalidate(this);
	}
	,__class__: zpp_$nape_util_ZPP_$ConstraintList
};
var zpp_$nape_util_ZPP_$BodyList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this.dontremove = false;
	this.subber = null;
	this.post_adder = null;
	this.adder = null;
	this._modifiable = null;
	this._validate = null;
	this._invalidate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Body();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$BodyList.__name__ = true;
zpp_$nape_util_ZPP_$BodyList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_phys_BodyList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$BodyList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,modify_test: function() {
		if(this._modifiable != null) this._modifiable();
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,invalidate: function() {
		this._invalidated = true;
		if(this._invalidate != null) this._invalidate(this);
	}
	,__class__: zpp_$nape_util_ZPP_$BodyList
};
var zpp_$nape_util_ZPP_$InteractorList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$InteractorList.__name__ = true;
zpp_$nape_util_ZPP_$InteractorList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$InteractorList
};
var zpp_$nape_util_ZPP_$CompoundList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this.dontremove = false;
	this.subber = null;
	this.adder = null;
	this._modifiable = null;
	this._validate = null;
	this._invalidate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Compound();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$CompoundList.__name__ = true;
zpp_$nape_util_ZPP_$CompoundList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_phys_CompoundList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$CompoundList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,modify_test: function() {
		if(this._modifiable != null) this._modifiable();
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,invalidate: function() {
		this._invalidated = true;
		if(this._invalidate != null) this._invalidate(this);
	}
	,__class__: zpp_$nape_util_ZPP_$CompoundList
};
var zpp_$nape_util_ZPP_$ListenerList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this.dontremove = false;
	this.subber = null;
	this.adder = null;
	this._modifiable = null;
	this._validate = null;
	this._invalidate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Listener();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$ListenerList.__name__ = true;
zpp_$nape_util_ZPP_$ListenerList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_callbacks_ListenerList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$ListenerList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,modify_test: function() {
		if(this._modifiable != null) this._modifiable();
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,invalidate: function() {
		this._invalidated = true;
		if(this._invalidate != null) this._invalidate(this);
	}
	,__class__: zpp_$nape_util_ZPP_$ListenerList
};
var zpp_$nape_util_ZPP_$CbTypeList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$CbType();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$CbTypeList.__name__ = true;
zpp_$nape_util_ZPP_$CbTypeList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_callbacks_CbTypeList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$CbTypeList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$CbTypeList
};
var zpp_$nape_util_ZPP_$Vec2List = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this.subber = null;
	this.post_adder = null;
	this.adder = null;
	this._modifiable = null;
	this._validate = null;
	this._invalidate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Vec2();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$Vec2List.__name__ = true;
zpp_$nape_util_ZPP_$Vec2List.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,modify_test: function() {
		if(this._modifiable != null) this._modifiable();
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,invalidate: function() {
		this._invalidated = true;
		if(this._invalidate != null) this._invalidate(this);
	}
	,__class__: zpp_$nape_util_ZPP_$Vec2List
};
var zpp_$nape_util_ZPP_$GeomPolyList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$GeomPolyList.__name__ = true;
zpp_$nape_util_ZPP_$GeomPolyList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$GeomPolyList
};
var zpp_$nape_util_ZPP_$RayResultList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$RayResultList.__name__ = true;
zpp_$nape_util_ZPP_$RayResultList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$RayResultList
};
var zpp_$nape_util_ZPP_$ConvexResultList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$ConvexResultList.__name__ = true;
zpp_$nape_util_ZPP_$ConvexResultList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$ConvexResultList
};
var zpp_$nape_util_ZPP_$EdgeList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$EdgeList.__name__ = true;
zpp_$nape_util_ZPP_$EdgeList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$EdgeList
};
var zpp_$nape_util_ZPP_$ShapeList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this.dontremove = false;
	this.subber = null;
	this.post_adder = null;
	this.adder = null;
	this._modifiable = null;
	this._validate = null;
	this._invalidate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Shape();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$ShapeList.__name__ = true;
zpp_$nape_util_ZPP_$ShapeList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_shape_ShapeList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$ShapeList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,modify_test: function() {
		if(this._modifiable != null) this._modifiable();
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,invalidate: function() {
		this._invalidated = true;
		if(this._invalidate != null) this._invalidate(this);
	}
	,__class__: zpp_$nape_util_ZPP_$ShapeList
};
var zpp_$nape_util_ZPP_$InteractionGroupList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$InteractionGroupList.__name__ = true;
zpp_$nape_util_ZPP_$InteractionGroupList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$InteractionGroupList
};
var zpp_$nape_util_ZPP_$ArbiterList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
	this.outer = null;
	this.inner = new zpp_$nape_util_ZNPList_$ZPP_$Arbiter();
	this._invalidated = true;
};
zpp_$nape_util_ZPP_$ArbiterList.__name__ = true;
zpp_$nape_util_ZPP_$ArbiterList.get = function(list,imm) {
	if(imm == null) imm = false;
	var ret = new nape_dynamics_ArbiterList();
	ret.zpp_inner.inner = list;
	if(imm) ret.zpp_inner.immutable = true;
	ret.zpp_inner.zip_length = true;
	return ret;
};
zpp_$nape_util_ZPP_$ArbiterList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$ArbiterList
};
var zpp_$nape_util_ZPP_$ContactList = function() {
	this.user_length = 0;
	this.zip_length = false;
	this.push_ite = null;
	this.at_ite = null;
	this.at_index = 0;
	this.reverse_flag = false;
	this._validate = null;
	this._invalidated = false;
	this.immutable = false;
	this.inner = null;
};
zpp_$nape_util_ZPP_$ContactList.__name__ = true;
zpp_$nape_util_ZPP_$ContactList.prototype = {
	valmod: function() {
		this.validate();
		if(this.inner.modified) {
			if(this.inner.pushmod) this.push_ite = null;
			this.at_ite = null;
			this.inner.modified = false;
			this.inner.pushmod = false;
			this.zip_length = true;
		}
	}
	,validate: function() {
		if(this._invalidated) {
			this._invalidated = false;
			if(this._validate != null) this._validate();
		}
	}
	,__class__: zpp_$nape_util_ZPP_$ContactList
};
var zpp_$nape_util_ZPP_$Math = function() { };
zpp_$nape_util_ZPP_$Math.__name__ = true;
zpp_$nape_util_ZPP_$Math.sqr = function(x) {
	return x * x;
};
var zpp_$nape_util_ZPP_$PubPool = function() { };
zpp_$nape_util_ZPP_$PubPool.__name__ = true;
var zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair = function() {
	this.colour = 0;
	this.parent = null;
	this.next = null;
	this.prev = null;
	this.data = null;
	this.swapped = null;
	this.lt = null;
};
zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.__name__ = true;
zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.prototype = {
	clear_with: function(lambda) {
		if(this.parent == null) return; else {
			var cur = this.parent;
			while(cur != null) if(cur.prev != null) cur = cur.prev; else if(cur.next != null) cur = cur.next; else cur = this.clear_node(cur,lambda);
			this.parent = null;
		}
	}
	,clear_node: function(node,lambda) {
		lambda(node.data);
		var ret = node.parent;
		if(ret != null) {
			if(node == ret.prev) ret.prev = null; else ret.next = null;
			node.parent = null;
		}
		var o = node;
		o.data = null;
		o.lt = null;
		o.swapped = null;
		o.next = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool;
		zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool = o;
		return ret;
	}
	,__fix_dbl_red: function(x) {
		while(true) {
			var par = x.parent;
			var g = par.parent;
			if(g == null) {
				par.colour = 1;
				break;
			}
			var n1;
			var n2;
			var n3;
			var t1;
			var t2;
			var t3;
			var t4;
			if(par == g.prev) {
				n3 = g;
				t4 = g.next;
				if(x == par.prev) {
					n1 = x;
					n2 = par;
					t1 = x.prev;
					t2 = x.next;
					t3 = par.next;
				} else {
					n1 = par;
					n2 = x;
					t1 = par.prev;
					t2 = x.prev;
					t3 = x.next;
				}
			} else {
				n1 = g;
				t1 = g.prev;
				if(x == par.prev) {
					n2 = x;
					n3 = par;
					t2 = x.prev;
					t3 = x.next;
					t4 = par.next;
				} else {
					n2 = par;
					n3 = x;
					t2 = par.prev;
					t3 = x.prev;
					t4 = x.next;
				}
			}
			var par1 = g.parent;
			if(par1 == null) this.parent = n2; else if(par1.prev == g) par1.prev = n2; else par1.next = n2;
			if(n2 != null) n2.parent = par1;
			n1.prev = t1;
			if(t1 != null) t1.parent = n1;
			n1.next = t2;
			if(t2 != null) t2.parent = n1;
			n2.prev = n1;
			if(n1 != null) n1.parent = n2;
			n2.next = n3;
			if(n3 != null) n3.parent = n2;
			n3.prev = t3;
			if(t3 != null) t3.parent = n3;
			n3.next = t4;
			if(t4 != null) t4.parent = n3;
			n2.colour = g.colour - 1;
			n1.colour = 1;
			n3.colour = 1;
			if(n2 == this.parent) this.parent.colour = 1; else if(n2.colour == 0 && n2.parent.colour == 0) {
				x = n2;
				continue;
			}
			break;
		}
	}
	,try_insert: function(obj) {
		var x = null;
		var cur = null;
		if(this.parent == null) {
			if(zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool == null) x = new zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair(); else {
				x = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool;
				zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool = x.next;
				x.next = null;
			}
			null;
			x.data = obj;
			this.parent = x;
		} else {
			cur = this.parent;
			while(true) if(this.lt(obj,cur.data)) {
				if(cur.prev == null) {
					if(zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool == null) x = new zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair(); else {
						x = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool;
						zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool = x.next;
						x.next = null;
					}
					null;
					x.data = obj;
					cur.prev = x;
					x.parent = cur;
					break;
				} else cur = cur.prev;
			} else if(this.lt(cur.data,obj)) {
				if(cur.next == null) {
					if(zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool == null) x = new zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair(); else {
						x = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool;
						zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair.zpp_pool = x.next;
						x.next = null;
					}
					null;
					x.data = obj;
					cur.next = x;
					x.parent = cur;
					break;
				} else cur = cur.next;
			} else break;
		}
		if(x == null) return cur; else {
			if(x.parent == null) x.colour = 1; else {
				x.colour = 0;
				if(x.parent.colour == 0) this.__fix_dbl_red(x);
			}
			return x;
		}
	}
	,__class__: zpp_$nape_util_ZPP_$Set_$ZPP_$CbSetPair
};
var zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet = function() {
	this.colour = 0;
	this.parent = null;
	this.next = null;
	this.prev = null;
	this.data = null;
	this.swapped = null;
	this.lt = null;
};
zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.__name__ = true;
zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.prototype = {
	empty: function() {
		return this.parent == null;
	}
	,find: function(obj) {
		var cur = this.parent;
		while(cur != null && cur.data != obj) if(this.lt(obj,cur.data)) cur = cur.prev; else cur = cur.next;
		return cur;
	}
	,find_weak: function(obj) {
		var cur = this.parent;
		while(cur != null) if(this.lt(obj,cur.data)) cur = cur.prev; else if(this.lt(cur.data,obj)) cur = cur.next; else break;
		return cur;
	}
	,remove: function(obj) {
		var node = this.find(obj);
		this.remove_node(node);
	}
	,remove_node: function(cur) {
		if(cur.next != null && cur.prev != null) {
			var sm = cur.next;
			while(sm.prev != null) sm = sm.prev;
			var t = cur.data;
			cur.data = sm.data;
			sm.data = t;
			if(this.swapped != null) this.swapped(cur.data,sm.data);
			cur = sm;
		}
		var child;
		if(cur.prev == null) child = cur.next; else child = cur.prev;
		if(cur.colour == 1) {
			if(cur.prev != null || cur.next != null) child.colour = 1; else if(cur.parent != null) {
				var parent = cur.parent;
				while(true) {
					parent.colour++;
					parent.prev.colour--;
					parent.next.colour--;
					var child1 = parent.prev;
					if(child1.colour == -1) {
						this.__fix_neg_red(child1);
						break;
					} else if(child1.colour == 0) {
						if(child1.prev != null && child1.prev.colour == 0) {
							this.__fix_dbl_red(child1.prev);
							break;
						}
						if(child1.next != null && child1.next.colour == 0) {
							this.__fix_dbl_red(child1.next);
							break;
						}
					}
					var child2 = parent.next;
					if(child2.colour == -1) {
						this.__fix_neg_red(child2);
						break;
					} else if(child2.colour == 0) {
						if(child2.prev != null && child2.prev.colour == 0) {
							this.__fix_dbl_red(child2.prev);
							break;
						}
						if(child2.next != null && child2.next.colour == 0) {
							this.__fix_dbl_red(child2.next);
							break;
						}
					}
					if(parent.colour == 2) {
						if(parent.parent == null) parent.colour = 1; else {
							parent = parent.parent;
							continue;
						}
					}
					break;
				}
			}
		}
		var par = cur.parent;
		if(par == null) this.parent = child; else if(par.prev == cur) par.prev = child; else par.next = child;
		if(child != null) child.parent = par;
		cur.parent = cur.prev = cur.next = null;
		var o = cur;
		o.data = null;
		o.lt = null;
		o.swapped = null;
		o.next = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool;
		zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool = o;
	}
	,__fix_neg_red: function(negred) {
		var parent = negred.parent;
		var child;
		if(parent.prev == negred) {
			var nl = negred.prev;
			var nr = negred.next;
			var trl = nr.prev;
			var trr = nr.next;
			nl.colour = 0;
			negred.colour = parent.colour = 1;
			negred.next = trl;
			if(trl != null) trl.parent = negred;
			var t = parent.data;
			parent.data = nr.data;
			nr.data = t;
			if(this.swapped != null) this.swapped(parent.data,nr.data);
			nr.prev = trr;
			if(trr != null) trr.parent = nr;
			nr.next = parent.next;
			if(parent.next != null) parent.next.parent = nr;
			parent.next = nr;
			if(nr != null) nr.parent = parent;
			child = nl;
		} else {
			var nl1 = negred.next;
			var nr1 = negred.prev;
			var trl1 = nr1.next;
			var trr1 = nr1.prev;
			nl1.colour = 0;
			negred.colour = parent.colour = 1;
			negred.prev = trl1;
			if(trl1 != null) trl1.parent = negred;
			var t1 = parent.data;
			parent.data = nr1.data;
			nr1.data = t1;
			if(this.swapped != null) this.swapped(parent.data,nr1.data);
			nr1.next = trr1;
			if(trr1 != null) trr1.parent = nr1;
			nr1.prev = parent.prev;
			if(parent.prev != null) parent.prev.parent = nr1;
			parent.prev = nr1;
			if(nr1 != null) nr1.parent = parent;
			child = nl1;
		}
		if(child.prev != null && child.prev.colour == 0) this.__fix_dbl_red(child.prev); else if(child.next != null && child.next.colour == 0) this.__fix_dbl_red(child.next);
	}
	,__fix_dbl_red: function(x) {
		while(true) {
			var par = x.parent;
			var g = par.parent;
			if(g == null) {
				par.colour = 1;
				break;
			}
			var n1;
			var n2;
			var n3;
			var t1;
			var t2;
			var t3;
			var t4;
			if(par == g.prev) {
				n3 = g;
				t4 = g.next;
				if(x == par.prev) {
					n1 = x;
					n2 = par;
					t1 = x.prev;
					t2 = x.next;
					t3 = par.next;
				} else {
					n1 = par;
					n2 = x;
					t1 = par.prev;
					t2 = x.prev;
					t3 = x.next;
				}
			} else {
				n1 = g;
				t1 = g.prev;
				if(x == par.prev) {
					n2 = x;
					n3 = par;
					t2 = x.prev;
					t3 = x.next;
					t4 = par.next;
				} else {
					n2 = par;
					n3 = x;
					t2 = par.prev;
					t3 = x.prev;
					t4 = x.next;
				}
			}
			var par1 = g.parent;
			if(par1 == null) this.parent = n2; else if(par1.prev == g) par1.prev = n2; else par1.next = n2;
			if(n2 != null) n2.parent = par1;
			n1.prev = t1;
			if(t1 != null) t1.parent = n1;
			n1.next = t2;
			if(t2 != null) t2.parent = n1;
			n2.prev = n1;
			if(n1 != null) n1.parent = n2;
			n2.next = n3;
			if(n3 != null) n3.parent = n2;
			n3.prev = t3;
			if(t3 != null) t3.parent = n3;
			n3.next = t4;
			if(t4 != null) t4.parent = n3;
			n2.colour = g.colour - 1;
			n1.colour = 1;
			n3.colour = 1;
			if(n2 == this.parent) this.parent.colour = 1; else if(n2.colour == 0 && n2.parent.colour == 0) {
				x = n2;
				continue;
			}
			break;
		}
	}
	,insert: function(obj) {
		var x;
		if(zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool == null) x = new zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet(); else {
			x = zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool;
			zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet.zpp_pool = x.next;
			x.next = null;
		}
		null;
		x.data = obj;
		if(this.parent == null) this.parent = x; else {
			var cur = this.parent;
			while(true) if(this.lt(x.data,cur.data)) {
				if(cur.prev == null) {
					cur.prev = x;
					x.parent = cur;
					break;
				} else cur = cur.prev;
			} else if(cur.next == null) {
				cur.next = x;
				x.parent = cur;
				break;
			} else cur = cur.next;
		}
		if(x.parent == null) x.colour = 1; else {
			x.colour = 0;
			if(x.parent.colour == 0) this.__fix_dbl_red(x);
		}
		return x;
	}
	,__class__: zpp_$nape_util_ZPP_$Set_$ZPP_$CbSet
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
Date.prototype.__class__ = Date;
Date.__name__ = ["Date"];
var Int = { __name__ : ["Int"]};
var Dynamic = { __name__ : ["Dynamic"]};
var Float = Number;
Float.__name__ = ["Float"];
var Bool = Boolean;
Bool.__ename__ = ["Bool"];
var Class = { __name__ : ["Class"]};
var Enum = { };
Perf.MEASUREMENT_INTERVAL = 1000;
Perf.FONT_FAMILY = "Helvetica,Arial";
Perf.FPS_BG_CLR = "#00FF00";
Perf.FPS_WARN_BG_CLR = "#FF8000";
Perf.FPS_PROB_BG_CLR = "#FF0000";
Perf.MS_BG_CLR = "#FFFF00";
Perf.MEM_BG_CLR = "#086A87";
Perf.INFO_BG_CLR = "#00FFFF";
Perf.FPS_TXT_CLR = "#000000";
Perf.MS_TXT_CLR = "#000000";
Perf.MEM_TXT_CLR = "#FFFFFF";
Perf.INFO_TXT_CLR = "#000000";
Perf.DELAY_TIME = 4000;
js_Boot.__toStr = {}.toString;
nape_Config.epsilon = 1e-8;
nape_Config.fluidAngularDragFriction = 2.5;
nape_Config.fluidAngularDrag = 100;
nape_Config.fluidVacuumDrag = 0.5;
nape_Config.fluidLinearDrag = 0.5;
nape_Config.collisionSlop = 0.2;
nape_Config.collisionSlopCCD = 0.5;
nape_Config.distanceThresholdCCD = 0.05;
nape_Config.staticCCDLinearThreshold = 0.05;
nape_Config.staticCCDAngularThreshold = 0.005;
nape_Config.bulletCCDLinearThreshold = 0.125;
nape_Config.bulletCCDAngularThreshold = 0.0125;
nape_Config.dynamicSweepLinearThreshold = 17;
nape_Config.dynamicSweepAngularThreshold = 0.6;
nape_Config.angularCCDSlipScale = 0.75;
nape_Config.arbiterExpirationDelay = 6;
nape_Config.staticFrictionThreshold = 2;
nape_Config.elasticThreshold = 20;
nape_Config.sleepDelay = 60;
nape_Config.linearSleepThreshold = 0.2;
nape_Config.angularSleepThreshold = 0.4;
nape_Config.contactBiasCoef = 0.3;
nape_Config.contactStaticBiasCoef = 0.6;
nape_Config.contactContinuousBiasCoef = 0.4;
nape_Config.contactContinuousStaticBiasCoef = 0.5;
nape_Config.illConditionedThreshold = 2e+8;
nape_phys_Interactor.zpp_internalAlloc = false;
nape_shape_Shape.zpp_internalAlloc = false;
zpp_$nape_ZPP_$ID._Interactor = 0;
zpp_$nape_ZPP_$ID._CbType = 0;
zpp_$nape_ZPP_$ID._CbSet = 0;
zpp_$nape_callbacks_ZPP_$Callback.internal = false;
zpp_$nape_callbacks_ZPP_$CbType.ANY_SHAPE = new nape_callbacks_CbType();
zpp_$nape_callbacks_ZPP_$CbType.ANY_BODY = new nape_callbacks_CbType();
zpp_$nape_callbacks_ZPP_$CbType.ANY_COMPOUND = new nape_callbacks_CbType();
zpp_$nape_callbacks_ZPP_$CbType.ANY_CONSTRAINT = new nape_callbacks_CbType();
zpp_$nape_util_ZPP_$Flags.internal = false;
zpp_$nape_callbacks_ZPP_$InteractionListener.UCbSet = new zpp_$nape_util_ZNPList_$ZPP_$CbSet();
zpp_$nape_callbacks_ZPP_$InteractionListener.VCbSet = new zpp_$nape_util_ZNPList_$ZPP_$CbSet();
zpp_$nape_callbacks_ZPP_$InteractionListener.WCbSet = new zpp_$nape_util_ZNPList_$ZPP_$CbSet();
zpp_$nape_callbacks_ZPP_$InteractionListener.UCbType = new zpp_$nape_util_ZNPList_$ZPP_$CbType();
zpp_$nape_callbacks_ZPP_$InteractionListener.VCbType = new zpp_$nape_util_ZNPList_$ZPP_$CbType();
zpp_$nape_callbacks_ZPP_$InteractionListener.WCbType = new zpp_$nape_util_ZNPList_$ZPP_$CbType();
zpp_$nape_dynamics_ZPP_$Arbiter.internal = false;
zpp_$nape_dynamics_ZPP_$Arbiter.COL = 1;
zpp_$nape_dynamics_ZPP_$Arbiter.FLUID = 4;
zpp_$nape_dynamics_ZPP_$Arbiter.SENSOR = 2;
zpp_$nape_dynamics_ZPP_$Contact.internal = false;
zpp_$nape_geom_ZPP_$Collide.flowpoly = new zpp_$nape_util_ZNPList_$ZPP_$Vec2();
zpp_$nape_geom_ZPP_$Collide.flowsegs = new zpp_$nape_util_ZNPList_$ZPP_$Vec2();
zpp_$nape_phys_ZPP_$Body.types = [null,(function($this) {
	var $r;
	if(zpp_$nape_util_ZPP_$Flags.BodyType_STATIC == null) {
		zpp_$nape_util_ZPP_$Flags.internal = true;
		zpp_$nape_util_ZPP_$Flags.BodyType_STATIC = new nape_phys_BodyType();
		zpp_$nape_util_ZPP_$Flags.internal = false;
	}
	$r = zpp_$nape_util_ZPP_$Flags.BodyType_STATIC;
	return $r;
}(this)),(function($this) {
	var $r;
	if(zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC == null) {
		zpp_$nape_util_ZPP_$Flags.internal = true;
		zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC = new nape_phys_BodyType();
		zpp_$nape_util_ZPP_$Flags.internal = false;
	}
	$r = zpp_$nape_util_ZPP_$Flags.BodyType_DYNAMIC;
	return $r;
}(this)),(function($this) {
	var $r;
	if(zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC == null) {
		zpp_$nape_util_ZPP_$Flags.internal = true;
		zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC = new nape_phys_BodyType();
		zpp_$nape_util_ZPP_$Flags.internal = false;
	}
	$r = zpp_$nape_util_ZPP_$Flags.BodyType_KINEMATIC;
	return $r;
}(this))];
zpp_$nape_phys_ZPP_$Material.WAKE = 1;
zpp_$nape_phys_ZPP_$Material.PROPS = 2;
zpp_$nape_phys_ZPP_$Material.ANGDRAG = 4;
zpp_$nape_phys_ZPP_$Material.ARBITERS = 8;
zpp_$nape_shape_ZPP_$Edge.internal = false;
zpp_$nape_space_ZPP_$AABBTree.tmpaabb = new zpp_$nape_geom_ZPP_$AABB();
zpp_$nape_util_ZPP_$ConstraintList.internal = false;
zpp_$nape_util_ZPP_$BodyList.internal = false;
zpp_$nape_util_ZPP_$InteractorList.internal = false;
zpp_$nape_util_ZPP_$CompoundList.internal = false;
zpp_$nape_util_ZPP_$ListenerList.internal = false;
zpp_$nape_util_ZPP_$CbTypeList.internal = false;
zpp_$nape_util_ZPP_$Vec2List.internal = false;
zpp_$nape_util_ZPP_$GeomPolyList.internal = false;
zpp_$nape_util_ZPP_$RayResultList.internal = false;
zpp_$nape_util_ZPP_$ConvexResultList.internal = false;
zpp_$nape_util_ZPP_$EdgeList.internal = false;
zpp_$nape_util_ZPP_$ShapeList.internal = false;
zpp_$nape_util_ZPP_$InteractionGroupList.internal = false;
zpp_$nape_util_ZPP_$ArbiterList.internal = false;
zpp_$nape_util_ZPP_$ContactList.internal = false;
nape_Main.main();
})(typeof console != "undefined" ? console : {log:function(){}}, typeof window != "undefined" ? window : exports, typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);

//# sourceMappingURL=nape.js.map