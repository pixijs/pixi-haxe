package pixi.filters.dropshadow;

import pixi.core.renderers.webgl.filters.AbstractFilter;
import pixi.core.renderers.webgl.WebGLRenderer;

@:native("PIXI.filters.DropShadowFilter")
extern class DropShadowFilter extends AbstractFilter {
	/**
	 * The DropShadowFilter applies a Gaussian blur to an object.
	 * The strength of the blur can be set for x- and y-axis separately.
	 *
	 * @author goodboydigital
	 * @class
	 * @extends AbstractFilter
	 * @memberof PIXI.filters
	 */
	function new();
	
	
	/**
     * Sets the strength of both the blurX and blurY properties simultaneously
     *
     * @member {Float}
     * @memberOf DropShadowFilter#
     * @default 2
     */
	var blur:Float;
	
    /**
     * Sets the strength of the blurX property
     *
     * @member {Float}
     * @memberOf DropShadowFilter#
     * @default 2
     */
	var blurX:Float;
	
    /**
     * Sets the strength of the blurY property
     *
     * @member {Float}
     * @memberOf DropShadowFilter#
     * @default 2
     */	
	var blurY:Float;
	
	
    /**
     * Sets the color of the shadow
     *
     * @member {UInt}
     * @memberOf DropShadowFilter#
     * @default 0x000000
     */
	var color:UInt;
	
	/**
     * Sets the alpha of the shadow
     *
     * @member {Float}
     * @memberOf DropShadowFilter#
     * @default 0.75
     */
	var alpha:Float;
	
	/**
     * Sets the distance of the shadow
     *
     * @member {Float}
     * @memberOf DropShadowFilter#
     * @default 10
     */
	var distance:Float;
	
	
	/**
     * Sets the angle of the shadow
     *
     * @member {Float}
     * @memberOf DropShadowFilter#
     * @default 45 * Math.PI / 180
     */
	var angle:Float;
}