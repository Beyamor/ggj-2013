package world 
{
	import flash.geom.Rectangle;
	import game.beef.Beef;
	import game.beef.Harp;
	import game.harp.Cursor;
	import game.harp.HeartRate;
	import game.harp.HeartSync;
	import game.harp.YConstraint;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var beef:Beef;
		private var harp:Harp;
		private var sync:HeartSync;
		private var heartRate:HeartRate;
		private var cursor:Cursor;
		
		public function GameWorld() 
		{
			var spacer:Number = 50;
			
			beef = new Beef(Game.WIDTH / 2,
							Game.HEIGHT * 0.75,
							new Rectangle(0, Game.HEIGHT / 2 + 50, Game.WIDTH, Game.HEIGHT / 2 - spacer * 2));
			add(beef);
			
			harp = new Harp(beef);
			add(harp);
			
			sync = new HeartSync;
			
			var yConstraint:YConstraint = new YConstraint(0 + spacer, Game.HEIGHT / 2 - spacer);
			
			heartRate = new HeartRate(yConstraint);
			add(heartRate);
			
			cursor = new Cursor(50, yConstraint, sync);
			add(cursor);
		}
		
		override public function update():void 
		{
			super.update();
			
			var yDistance:Number = heartRate.getNormalizedYDistance(cursor.x, cursor.y);
			sync.addAccuracyPoint(yDistance);
		}
		
		override public function render():void 
		{
			super.render();
			
			Draw.linePlus(0, Game.HEIGHT / 2, Game.WIDTH, Game.HEIGHT / 2, 0x333333, 1, 2);
		}
	}

}