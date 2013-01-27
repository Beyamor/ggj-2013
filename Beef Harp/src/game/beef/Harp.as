package game.beef 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import util.ImageMaker;
	import values.Depths;
	import values.Game;
	import values.Sprites;
	import values.Types;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Harp extends Entity 
	{
		private var _beef:Beef;			private function get beef():Beef { return _beef; }
		
		public function Harp(beef:Beef)
		{
			super(beef.x - Game.HARP_FOLLOW_DISTANCE, beef.y, ImageMaker.centered(Sprites.HARP));
			
			_beef = beef;
			
			layer = Depths.HARP;
			type = Types.PLAYER;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (distanceToPoint(beef.x - Game.HARP_FOLLOW_DISTANCE, beef.y) > Game.HARP_SPEED * FP.elapsed) { // or something
			
				var targetX:Number = beef.x - Game.HARP_FOLLOW_DISTANCE;
				var targetY:Number = beef.y;
				
				var direction:Number = Math.atan2(targetY - y, targetX - x);
				
				x += Game.HARP_SPEED * Math.cos(direction) * FP.elapsed;
				y += Game.HARP_SPEED * Math.sin(direction) * FP.elapsed;
			}
		}
	}

}