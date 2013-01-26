package game 
{
	import flash.display.NativeMenuItem;
	import game.harp.DJ;
	import game.harp.RatePoint;
	import game.harp.YConstraint;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import values.Colors;
	import values.Depths;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HeartRate extends Entity 
	{
		// Dunno if I'll have time to reinforce it,
		// but it's assumed that subsequent points have
		// a higher x than the ones before them
		private var points:Vector.<RatePoint> = new Vector.<RatePoint>;
		
		private var _dj:DJ;							private function get dj():DJ { return _dj; }
		
		private var _yConstraint:YConstraint;		private function get yConstraint():YConstraint { return _yConstraint; }
		
		public function HeartRate(yConstraint:YConstraint) 
		{
			_yConstraint = yConstraint;
			_dj = new DJ(yConstraint);
			
			points.push(new RatePoint(0, yConstraint.center));
			points.push(new RatePoint(Game.WIDTH, yConstraint.center));
			
			layer = Depths.HEART_RATE;
		}
		
		override public function render():void 
		{
			var p1:RatePoint, p2:RatePoint;
			
			for (var pointIndex:uint = 0; pointIndex < points.length - 1; ++pointIndex) {
				
				p1 = points[pointIndex];
				p2 = points[pointIndex + 1];
				
				Draw.linePlus(p1.x, p1.y, p2.x, p2.y, Colors.HEART_RATE, 1, 2);
			}
		}
		
		public function getYDistance(x:Number, y:Number):Number {
			
			var lowPoint:RatePoint, highPoint:RatePoint;
			
			for (var pointIndex:uint = 0; pointIndex < points.length - 1; ++pointIndex) {
				
				lowPoint	= points[pointIndex];
				highPoint	= points[pointIndex + 1];
				
				if (lowPoint.x <= x && highPoint.x >= x) break;
			}
			
			var relativeX:Number = (x - lowPoint.x) / (highPoint.x - lowPoint.x);
			var interpolatedY:Number = FP.lerp(lowPoint.y, highPoint.y, relativeX);
			
			return y - interpolatedY;
		}
		
		override public function update():void 
		{
			super.update();
			
			for each (var point:RatePoint in points) {
				
				point.x -= rate * FP.elapsed;
			}
			
			if (rightmostPointIsOnscreen()) {
				
				spawnNextPoint();
			}
			
			if (secondToLeftmostPointIsOffscreen()) {
				
				removeLeftmostPoint();
			}
		}
		
		private function get rightmostPoint():RatePoint {
			
			// again, assuming these things are already x-ordered
			return points[points.length - 1];
		}
		
		private function rightmostPointIsOnscreen():Boolean {
			
			return rightmostPoint.x <= FP.camera.x + FP.width;
		}
		
		private function get secondToLeftmostPoint():RatePoint {
			
			return points[1];
		}
		
		private function secondToLeftmostPointIsOffscreen():Boolean {
			
			if (points.length <= 2) return false;
			
			return secondToLeftmostPoint.x < FP.camera.x;
		}
		
		private function removeLeftmostPoint():void {
			
			points.shift();
		}
		
		private function spawnNextPoint():void {
			
			points.push(dj.dropNextBeat());
		}
		
		private function get rate():Number {
			
			return 100; // what am i even doing lol
		}
	}

}