package pixi.plugins.spine.core;


extern class IntSet 
{

	public var array:Array<Int>;
	public function add(value: Int): Bool;
	public function contains(value: Int): Bool;
	public function remove(value: Int): Bool;
	public function clear(): Void;
   	
}