package nape;

import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import pixi.plugins.app.Application;
import haxe.Timer;

import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.space.Space;
import nape.phys.Material;

class Main extends Application {

	var _floor:Body;
	var _space:Space;
	var _balls:Array<Sprite>;
	var _pballs:Array<Body>;

	public function new() {
		super();
		_init();

		_balls = [];
		_pballs = [];
		_setUpPhysics();
		onUpdate = _onUpdate;
		var timer:Timer = new Timer(1000);
		timer.run = _addBall;
		_addBall();
	}

	function _init() {
		backgroundColor = 0x6699FF;
		autoResize = false;
		width = 800;
		height = 600;
		super.start();
	}

	function _onUpdate(elapsedTime:Float) {
		_space.step(1 / 60);

		for(i in 0 ... _pballs.length) {
			_balls[i].position.x = _pballs[i].position.x;
			_balls[i].position.y = _pballs[i].position.y;
			_balls[i].rotation = _pballs[i].rotation;
		}
	}

	function _setUpPhysics() {
		var gravity = Vec2.weak(0, 600);
		_space = new Space(gravity);

		_floor = new Body(BodyType.STATIC);
		_floor.setShapeMaterials(Material.wood());
		_floor.shapes.add(new Polygon(Polygon.rect(0, 595, 800, 1)));
		_floor.space = _space;
	}

	function _addBall() {
		var ball:Sprite = new Sprite(Texture.fromImage("assets/nape/ball.png"));
		ball.anchor.set(0.5, 0.5);
		_balls.push(ball);
		stage.addChild(ball);

		var pball:Body = new Body(BodyType.DYNAMIC);
		pball.shapes.add(new Circle(10));
		pball.position.setxy(Std.random(800), 0);
		pball.angularVel = 0;
		pball.allowRotation = true;

		pball.setShapeMaterials(Material.rubber());
		pball.space = _space;
		_pballs.push(pball);
	}

	static function main() {
		new Main();
	}
}