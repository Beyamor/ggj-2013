package game.beef 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import util.ImageMaker;
	import util.Timer;
	import values.Game;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Beef extends Entity 
	{
		private var shotTimer:Timer;
		private var _boundingRect:Rectangle;		private function get boundingRect():Rectangle { return _boundingRect; }
		
		public function Beef(x:Number, y:Number, boundingRect:Rectangle)
		{
			super(x, y, ImageMaker.centered(Sprites.BEEF));
			
			_boundingRect = boundingRect;
			
			shotTimer = new Timer(Game.BEEF_SHOT_DELAY);
		}
		
		override public function update():void 
		{
			super.update();
			
			// moving
			var dx:Number = 0;
			var dy:Number = 0;
			
			if (Input.check("beef-left"))	dx -= 1;
			if (Input.check("beef-right"))	dx += 1;
			if (Input.check("beef-up"))		dy -= 1;
			if (Input.check("beef-down"))	dy += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			x += dx * Game.BEEF_SPEED * FP.elapsed;
			y += dy * Game.BEEF_SPEED * FP.elapsed;
			
			x = FP.clamp(x, boundingRect.left, boundingRect.right);
			y = FP.clamp(y, boundingRect.top, boundingRect.bottom);
			
			// shooting
			shotTimer.update();
			
			if (shotTimer.hasFired() && Input.check("beef-shot")) {
				
				shotTimer.reset();
				world.add(new Shot(x, y, 100, 0));
			}
		}
	}

}