package world 
{
	import game.harp.Cursor;
	import game.harp.HeartSync;
	import game.harp.YConstraint;
	import game.harp.HeartRate;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HarpWorld extends World 
	{
		private var sync:HeartSync;
		private var cursor:Cursor;
		private var heartRate:HeartRate;
		private var syncDisplay:Text;
		
		public function HarpWorld() 
		{
			var yConstraint:YConstraint = new YConstraint(Game.HEIGHT / 2 - 80, Game.HEIGHT / 2 + 80);
			
			sync = new HeartSync;
			
			cursor = new Cursor(Game.WIDTH/2, yConstraint, sync);
			add(cursor);
			
			heartRate = new HeartRate(yConstraint);
			add(heartRate);
			
			syncDisplay = new Text("", 20, 20, 100, 30);
			addGraphic(syncDisplay);
		}
		
		override public function update():void 
		{
			super.update();
			
			var yDistance:Number = heartRate.getNormalizedYDistance(cursor.x, cursor.y);
			sync.addAccuracyPoint(yDistance);
			
			syncDisplay.text = sync.sync.toString();
		}
	}

}