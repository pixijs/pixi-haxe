package pixi.filters.extras;

@:native("PIXI.filters.OutlineFilter")
extern class OutlineFilter {

	/**
	 * OutlineFilter, originally by mishaa
	 * http://www.html5gamedevs.com/topic/10640-outline-a-sprite-change-certain-colors/?p=69966
	 * http://codepen.io/mishaa/pen/emGNRB
	 *
	 * @class
	 * @param thickness {Float} The tickness of the outline. Make it 2 times more for resolution 2
	 * @param color {Int} The color of the glow.
	 *
	 * @example
	 *  someSprite.shader = new OutlineFilter(9, 0xFF0000);
	 */
	function new(thickness:Float, color:Int);

	var color:Array<Int>;
}