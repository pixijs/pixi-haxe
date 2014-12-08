(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var demos = {};
demos.blur = {};
demos.blur.Main = function() {
	this._stage = new PIXI.Stage(16777215);
	this._renderer = PIXI.autoDetectRenderer(window.innerWidth,window.innerHeight);
	window.document.body.appendChild(this._renderer.view);
	this._renderer.view.style.position = "absolute";
	this._renderer.view.style.width = window.innerWidth + "px";
	this._renderer.view.style.height = window.innerHeight + "px";
	this._renderer.view.style.display = "block";
	this._bg = PIXI.Sprite.fromImage("assets/filters/depth_blur_BG.jpg");
	this._stage.addChild(this._bg);
	this._littleDudes = PIXI.Sprite.fromImage("assets/filters/depth_blur_dudes.jpg");
	this._littleDudes.y = 100;
	this._stage.addChild(this._littleDudes);
	this._littleRobot = PIXI.Sprite.fromImage("assets/filters/depth_blur_moby.jpg");
	this._littleRobot.x = 120;
	this._stage.addChild(this._littleRobot);
	this._blurFilter1 = new pixi.filters.PerlinFilter();
	this._blurFilter2 = new PIXI.BlurFilter();
	this._blurFilter1.set_time(20);
	this._littleDudes.filters = [this._blurFilter1];
	this._count = 0;
	window.requestAnimationFrame($bind(this,this.animate));
};
demos.blur.Main.main = function() {
	new demos.blur.Main();
};
demos.blur.Main.prototype = {
	animate: function() {
		window.requestAnimationFrame($bind(this,this.animate));
		this._count += 0.01;
		var blurAmount1 = Math.cos(this._count);
		var blurAmount2 = Math.sin(this._count);
		this._blurFilter2.blur = 20 * blurAmount2;
		this._renderer.render(this._stage);
	}
};
var pixi = {};
pixi.filters = {};
pixi.filters.PerlinFilter = function() {
	PIXI.AbstractFilter.call(this);
	this.passes = [this];
	this.set_time(.0);
	this.uniforms = { time : { type : "1f", value : 0.0}};
	var pnoiseChunk = ["vec3 mod289(vec3 x)","{"," return x - floor(x * (1.0 / 289.0)) * 289.0;","}","vec4 mod289(vec4 x)","{"," return x - floor(x * (1.0 / 289.0)) * 289.0;","}","vec4 permute(vec4 x)","{"," return mod289(((x * 34.0) + 1.0) * x);","}","vec4 taylorInvSqrt(vec4 r)","{","return 1.79284291400159 - 0.85373472095314 * r;","}","vec3 fade(vec3 t)","{","return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);","}","// Classic Perlin noise, periodic variant","float pnoise(vec3 P, vec3 rep)","{"," vec3 Pi0 = mod(floor(P), rep); // Integer part, modulo period"," vec3 Pi1 = mod(Pi0 + vec3(1.0), rep); // Integer part + 1, mod period"," Pi0 = mod289(Pi0);"," Pi1 = mod289(Pi1);"," vec3 Pf0 = fract(P); // Fractional part for interpolation"," vec3 Pf1 = Pf0 - vec3(1.0); // Fractional part - 1.0"," vec4 ix = vec4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);"," vec4 iy = vec4(Pi0.yy, Pi1.yy);"," vec4 iz0 = Pi0.zzzz;"," vec4 iz1 = Pi1.zzzz;"," vec4 ixy = permute(permute(ix) + iy);"," vec4 ixy0 = permute(ixy + iz0);"," vec4 ixy1 = permute(ixy + iz1);"," vec4 gx0 = ixy0 * (1.0 / 7.0);"," vec4 gy0 = fract(floor(gx0) * (1.0 / 7.0)) - 0.5;"," gx0 = fract(gx0);"," vec4 gz0 = vec4(0.5) - abs(gx0) - abs(gy0);"," vec4 sz0 = step(gz0, vec4(0.0));"," gx0 -= sz0 * (step(0.0, gx0) - 0.5);"," gy0 -= sz0 * (step(0.0, gy0) - 0.5);"," vec4 gx1 = ixy1 * (1.0 / 7.0);"," vec4 gy1 = fract(floor(gx1) * (1.0 / 7.0)) - 0.5;"," gx1 = fract(gx1);"," vec4 gz1 = vec4(0.5) - abs(gx1) - abs(gy1);"," vec4 sz1 = step(gz1, vec4(0.0));"," gx1 -= sz1 * (step(0.0, gx1) - 0.5);"," gy1 -= sz1 * (step(0.0, gy1) - 0.5);"," vec3 g000 = vec3(gx0.x, gy0.x, gz0.x);"," vec3 g100 = vec3(gx0.y, gy0.y, gz0.y);"," vec3 g010 = vec3(gx0.z, gy0.z, gz0.z);"," vec3 g110 = vec3(gx0.w, gy0.w, gz0.w);"," vec3 g001 = vec3(gx1.x, gy1.x, gz1.x);"," vec3 g101 = vec3(gx1.y, gy1.y, gz1.y);"," vec3 g011 = vec3(gx1.z, gy1.z, gz1.z);"," vec3 g111 = vec3(gx1.w, gy1.w, gz1.w);"," vec4 norm0 = taylorInvSqrt(vec4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));"," g000 *= norm0.x;"," g010 *= norm0.y;"," g100 *= norm0.z;"," g110 *= norm0.w;"," vec4 norm1 = taylorInvSqrt(vec4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));"," g001 *= norm1.x;"," g011 *= norm1.y;"," g101 *= norm1.z;"," g111 *= norm1.w;"," float n000 = dot(g000, Pf0);"," float n100 = dot(g100, vec3(Pf1.x, Pf0.yz));"," float n010 = dot(g010, vec3(Pf0.x, Pf1.y, Pf0.z));"," float n110 = dot(g110, vec3(Pf1.xy, Pf0.z));"," float n001 = dot(g001, vec3(Pf0.xy, Pf1.z));"," float n101 = dot(g101, vec3(Pf1.x, Pf0.y, Pf1.z));"," float n011 = dot(g011, vec3(Pf0.x, Pf1.yz));"," float n111 = dot(g111, Pf1);"," vec3 fade_xyz = fade(Pf0);"," vec4 n_z = mix(vec4(n000, n100, n010, n110), vec4(n001, n101, n011, n111), fade_xyz.z);"," vec2 n_yz = mix(n_z.xy, n_z.zw, fade_xyz.y);"," float n_xyz = mix(n_yz.x, n_yz.y, fade_xyz.x);"," return 2.2 * n_xyz;","}","float turb(vec3 P, vec3 rep, float lacunarity, float gain)","{"," float sum = 0.0;"," float sc = 1.0;"," float totalgain = 1.0;"," for (float i = 0.0; i < 6.0; i++)"," {"," sum += totalgain * pnoise(P * sc, rep);"," sc *= lacunarity;"," totalgain *= gain;"," }"," return abs(sum);","}"].join("\n");
	var godrayChunk = ["vec4 godray(float time)","{"," float angle = 30.0;"," float xx = cos(radians(angle));"," float yy = sin(radians(angle));"," vec3 dir = vec3((xx * vTextureCoord.x) + (yy * vTextureCoord.y), (xx * vTextureCoord.x) + (yy * vTextureCoord.y), 0.0);"," float noise = turb(dir + vec3(time, 0.0, 62.1 + time), vec3(480.0, 320.0, 480.0), 2.0, 0.5);"," noise = mix(noise, 0.0, 0.3);"," //fade vertically."," vec4 mist = vec4(noise, noise, noise, 1.0) * vTextureCoord.y; mist.a = 1.0;"," return mist;","}"].join("\n");
	this.fragmentSrc = ["precision mediump float;","varying vec2 vTextureCoord;","varying vec4 vColor;","uniform float time;","uniform sampler2D uSampler;",pnoiseChunk,godrayChunk,"void main(void) {"," gl_FragColor = texture2D(uSampler, vTextureCoord);","gl_FragColor += godray(time);","}"];
	this.syncUniforms();
};
pixi.filters.PerlinFilter.__super__ = PIXI.AbstractFilter;
pixi.filters.PerlinFilter.prototype = $extend(PIXI.AbstractFilter.prototype,{
	set_time: function(v) {
		if(this.uniforms != null && this.uniforms.time != null) this.uniforms.time.value = v;
		return v;
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
demos.blur.Main.main();
})();
