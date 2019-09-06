package mesh;

import pixi.core.graphics.Graphics;
import pixi.mesh.Rope;
import pixi.plugins.app.Application;
import pixi.core.math.Point;
import pixi.core.textures.Texture;

class Main extends Application {

	private var count:Float=0;
	private var ropeLength:Int=45;
	private var points:Array<Point>=[];
	private var strip:Rope=null;
	private var g:Graphics;

	public function new() {
		super();
		_init();
	}

	function _init() {

		for(i in 0...25){
			points.push(new Point(i*ropeLength,0));
		}
		strip=new Rope(Texture.from('assets/snake.png'), points);
		strip.x=-40;
		strip.y=300;
		stage.addChild(strip);

		g=new Graphics();
		g.x=strip.x;
		g.y=strip.y;
		stage.addChild(g);

		onUpdate = _onUpdate;
		super.start(Application.RECOMMENDED);
	}

	function _onUpdate(elapsedTime:Float):Void {
		count+=0.1;
		for(i in 0...points.length){
			points[i].y=Math.sin((i*0.5)+count)*30;
			points[i].x=i*ropeLength+Math.cos((i*0.3)+count)*20;
		}
		renderPoints();
	}

	private function renderPoints():Void{
		g.clear();
		g.lineStyle(2, 0xffc2c2);
		g.moveTo(points[0].x, points[0].y);

		for (i in 1...points.length) {
			g.lineTo(points[i].x, points[i].y);
		}

		for (i in 1...points.length) {
			g.beginFill(0xff0022);
			g.drawCircle(points[i].x, points[i].y, 10);
			g.endFill();
		}
	}

	static function main() {
		new Main();
	}
}