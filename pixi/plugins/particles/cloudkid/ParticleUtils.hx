package cloudkid;

@:native("cloudkid.ParticleUtils")
extern class ParticleUtils {

	/**
	*	Combines separate color components (0-255) into a single uint color.
	*	@method combineRGBComponents
	*	@param {Int} r The red value of the color
	*	@param {Int} g The green value of the color
	*	@param {Int} b The blue value of the color
	*	@return {Int} The color in the form of 0xRRGGBB
	*	@static
	*/
	public static function combineRGBComponents(r:Int,g:Int,b:Int) : Int;

	/**
	*	Generates a custom ease function, based on the GreenSock custom ease, as demonstrated
	*	by the related tool at http://www.greensock.com/customease/.
	*	@method generateEase
	*	@param {Array<Dynamic>} segments An array of segments, as created by
	*	http://www.greensock.com/customease/.
	*	@return {Float->Float} A function that calculates the percentage of change at
	*						a given point in time (0-1 inclusive).
	*	@static
	*/	
	public static function generateEase( Array<Dynamic>) : Float -> Float; 

	/**
	*	Gets a blend mode, ensuring that it is valid.
	*	@method getBlendMode
	*	@param {String} name The name of the blend mode to get.
	*	@return {Int} The blend mode as specified in the PIXI.blendModes enumeration.
	*	@static
	*/	
	public static function getBlendMode( name : String) : Int;

   /**
	*	Converts a hex string from "#AARRGGBB", "#RRGGBB", "0xAARRGGBB", "0xRRGGBB",
	*	"AARRGGBB", or "RRGGBB" to an array of ints of 0-255 or Numbers from 0-1, as
	*	[r, g, b, (a)].
	*	@method hexToRGB
	*	@param {String} color The input color string.
	*	@param {Array<Int>} output An array to put the output in. If omitted, a new array is created.
	*	@return {Array<Int>} The array of numeric color values.
	*	@static
	*/	
	public static function hexToRGB( color : String, output : Array<Int>) : Array<Int>;

	/**
	 * Returns the length (or magnitude) of this point.
	 * @method length
	 * @static
	 * @param {pixi.geom.Point} point The point to measure length
	 * @return {Float} The length of this point.
	 */	
	public static function length( point : pixi.core.Point ) : Float;

	/**
	 * Reduces the point to a length of 1.
	 * @method normalize
	 * @static
	 * @param {pixi.geom.Point} point The point to normalize
	 */
	public static function normalize( point : pixi.core.Point );

	/**
	*	Rotates a point by a given angle.
	*	@method rotatePoint
	*	@param {Float} angle The angle to rotate by in degrees
	*	@param {pixi.geom.Point} p The point to rotate around 0,0.
	*	@static
	*/	
	public static function rotatePoint( angle : Float, p : pixi.geom.Point );

	/**
	 * Multiplies the x and y values of this point by a value.
	 * @method scaleBy
	 * @static
	 * @param {pixi.geom.Point} point The point to scaleBy
	 * @param value {Float} The value to scale by.
	 */	
	public static function scaleBy( point : pixi.geom.Point, value: Float);
}
