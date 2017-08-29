package pixi.filters.extras;

import js.html.Float32Array;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.textures.Texture;

@:native("PIXI.filters.SimpleLightmapFilter")
extern class SimpleLightmapFilter extends Filter {

	/**
	* SimpleLightmap, originally by Oza94
	* http://www.html5gamedevs.com/topic/20027-pixijs-simple-lightmapping/
	* http://codepen.io/Oza94/pen/EPoRxj
	*
	* @class
	* @param lightmapTexture {Texture} a texture where your lightmap is rendered
	* @param ambientColor {Array<Float>} An RGBA array of the ambient color
	* @param [resolution] {Array<Float>} An array for X/Y resolution
	*
	* @example
	*  var lightmapTex = new PIXI.RenderTexture(renderer, 400, 300);
	*
	*  // ... render lightmap on lightmapTex
	*
	*  stageContainer.filters = [
	*    new SimpleLightmapFilter(lightmapTex, [0.3, 0.3, 0.7, 0.5], [1.0, 1.0])
	*  ];
	*/
	function new(lightmapTexture:Texture, ambientColor:Array<Float>, ?resolution:Array<Float>);

	var texture:Texture;
	var color:Float32Array;
}