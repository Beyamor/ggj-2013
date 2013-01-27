package game.beef 
{
	import flash.geom.Rectangle;
	import game.harp.HeartSync;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import util.ImageMaker;
	import util.Timer;
	import values.Depths;
	import values.Game;
	import values.Sprites;
	import values.Types;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Beef extends Entity 
	{
		private var shotTimer:Timer;
		private var _boundingRect:Rectangle;		private function get boundingRect():Rectangle { return _boundingRect; }
		private var _heartSync:HeartSync;			private function get heartSync():HeartSync { return _heartSync; }
		
		private function hasHeartSync():Boolean { return heartSync != null; }
		
		private var damage:Number = 0.5 * (Game.MAX_BEEF_STRENGTH + Game.MIN_BEEF_STRENGTH);
		
		public function Beef(x:Number, y:Number, boundingRect:Rectangle, heartSync:HeartSync=null)
		{
			super(x, y, ImageMaker.centered(Sprites.BEEF));
			
			layer = Depths.BEEF;
			type = Types.BEEF;
			
			_boundingRect = boundingRect;
			_heartSync = heartSync;
			
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
			
			// heart sync!
			if (hasHeartSync()) matchHeartSync();
			
			// shooting
			shotTimer.update();
			
			if (shotTimer.hasFired() && Input.check("beef-shot")) {
				
				shotTimer.reset();
				world.add(new Shot(x, y, 100, 0, damage));
			}
		}
		
		private function matchHeartSync():void {
			
			damage = Game.MIN_BEEF_STRENGTH
						+ (Game.MAX_BEEF_STRENGTH - Game.MIN_BEEF_STRENGTH)
						* (heartSync.sync + 100) / 200;
		}
	}

}