package pixi.display;

class DisplayObject extends CoreDisplayObject {

	public var name:String;

	public function new() {
		super();
		name = "";
	}

	public function applyScale(pixelRatio:Float) {
		if (pixelRatio > 0) scale.set(1 / pixelRatio, 1 / pixelRatio);
	}
}