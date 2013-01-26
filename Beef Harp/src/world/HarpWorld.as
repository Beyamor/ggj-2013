package world 
{
	import game.harp.Cursor;
	import game.HeartRate;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HarpWorld extends World 
	{
		private var cursor:Cursor;
		private var heartRate:HeartRate;
		private var yDistanceDisplay:Text;
		
		public function HarpWorld() 
		{
			cursor = new Cursor(Game.WIDTH / 2, Game.HEIGHT / 2 - 50, Game.HEIGHT / 2 + 50);
			add(cursor);
			
			heartRate = new HeartRate();
			add(heartRate);
			
			yDistanceDisplay = new Text("", 20, 20, 100, 30);
			addGraphic(yDistanceDisplay);
		}
		
		override public function update():void 
		{
			super.update();
			
			var yDistance:Number = heartRate.getYDistance(cursor.x, cursor.y);
			yDistanceDisplay.text = yDistance.toString();
		}
	}

}