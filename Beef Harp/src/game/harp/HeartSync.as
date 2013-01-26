package game.harp 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class HeartSync 
	{
		// within this, sync is getting stronger
		private static const GOOD_DISTANCE:Number = 0.05;
		
		// outside this, sync is getting weaker
		private static const BAD_DISTANCE:Number = 0.15;
		
		public var _sync:Number = 0;		public function get sync():Number { return _sync; }
		
		public function HeartSync() 
		{
			
		}
		
		// distance should be [0, 1],
		// with 0 being more accurate
		public function addAccuracyPoint(distance:Number):void {
			
			// this is pretty well magic
			if (distance <= GOOD_DISTANCE) {
				
				var relativeGoodness:Number = (GOOD_DISTANCE - distance) / (GOOD_DISTANCE); // [0, 1], 1 -> most good
				
				_sync += relativeGoodness * 0.2; // magic
			}
			
			else if (distance >= BAD_DISTANCE) {
				
				var relativeBadness:Number = (distance - BAD_DISTANCE) / (1 - BAD_DISTANCE); // [0, 1], 1 -> most bad
				
				_sync -= relativeBadness * 3; // more magic 
			}
			
			_sync = FP.clamp(_sync, -100, 100);
		}
	}

}