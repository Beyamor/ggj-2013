package game.harp 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class HeartSync 
	{
		// inside this percent, sync is getting stronger
		private static const SYNC_DISTANCE:Number = 0.08;
		
		private static const SYNC_GAIN_RATE:Number = 0.1;
		private static const SYNC_LOSS_RATE:Number = 2;
		
		private var _isInSync:Boolean = true; 	public function get isInSync():Boolean { return _isInSync; }
		private var _sync:Number = 0;			public function get sync():Number { return _sync; }
		
		private var hasLost:Boolean = false;
		
		public function HeartSync() 
		{
			
		}
		
		public function update():void {
			
			if (hasLost) {
				
				_sync = Math.max( -100, _sync - 3);
			}
		}
		
		// distance should be [0, 1],
		// with 0 being more accurate
		public function addAccuracyPoint(distance:Number):void {
			
			if (hasLost) return;
			
			_isInSync = (distance <= SYNC_DISTANCE);
			
			// t is a number
			// haha that comment
			var t:Number; 
			
			if (isInSync) {
				
				t = (1 - distance / SYNC_DISTANCE)
				_sync += t * SYNC_GAIN_RATE;
			}
			
			else {
				
				t = (distance - SYNC_DISTANCE) / (1 - SYNC_DISTANCE);
				_sync -= t * SYNC_LOSS_RATE;
			}
			
			_sync = FP.clamp(_sync, -100, 100);
		}
		
		public function registerLoss():void {
			
			hasLost = true;
		}
	}

}