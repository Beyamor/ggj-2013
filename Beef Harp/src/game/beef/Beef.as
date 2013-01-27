package game.beef 
{
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
		
		public function Beef(x:Number, y:Number)
		{
			super(x, y, ImageMaker.centered(Sprites.BEEF));
			
			shotTimer = new Timer(Game.BEEF_SHOT_DELAY);
		}
		
		override public function update():void 
		{
			super.update();
			
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
			
			shotTimer.update();
			
			if (shotTimer.hasFired() && Input.check("beef-shot")) {
				
				shotTimer.reset();
				world.add(new Shot(x, y, 100, 0));
			}
		}
	}

}