package pixi.core.math;

@:native("PIXI.GroupD8")
extern class GroupD8 {

	// Your friendly neighbour https://en.wikipedia.org/wiki/Dihedral_group of order 16
	
	/**
	 * Implements Dihedral Group D_8, see [group D4]{@link http://mathworld.wolfram.com/DihedralGroupD4.html}, D8 is the same but with diagonals
	 * Used for texture rotations
	 * Vector xX(i), xY(i) is U-axis of sprite with rotation i
	 * Vector yY(i), yY(i) is V-axis of sprite with rotation i
	 * Rotations: 0 grad (0), 90 grad (2), 180 grad (4), 270 grad (6)
	 * Mirrors: vertical (8), main diagonal (10), horizontal (12), reverse diagonal (14)
	 * This is the small part of gameofbombs.com portal system. It works.
	 * @author Ivan @ivanpopelyshev
	 *
	 * @namespace PIXI.GroupD8
	 */
	function new();
	
    /**
     * Adds 180 degrees to rotation. Commutative operation
     * @param rotation
     * @returns {number}
     */
	function rotate180(rotation:Float):Float;
	
    /**
     * I dont know why sometimes width and heights needs to be swapped. We'll fix it later.
     * @param rotation
     * @returns {boolean}
     */
	function isSwapWidthHeight(rotation:Float):Bool;
	
	/**
	 * 
	 * @param	dx
	 * @param	dy
	 * @return
	 */
	function byDirection(dx:Float, dy:Float):Int;
	
    /**
     * Helps sprite to compensate texture packer rotation.
     * @param matrix {PIXI.Matrix} sprite world matrix
     * @param rotation {number}
     * @param tx {number|*} sprite anchoring
     * @param ty {number|*} sprite anchoring
     */
	function matrixAppendRotationInv(matrix:Matrix, rotation:Float, tx:Float, ty:Float):Void;
}