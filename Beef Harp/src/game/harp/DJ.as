package game.harp 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class DJ 
	{
		private var _yConstraint:YConstraint;		private function get yConstraint():YConstraint { return _yConstraint; }
		
		// this is kinda goofy,
		// but x is relative to the last point
		// y is absolute
		// and everything is in unitless measurements
		private var beats:Array =	[	{ x: 0, y: 0 },
										{ x: 4, y: 0 },
										{ x: 1, y: 3.5 },
										{ x: 2, y: -2.5 },
										{ x: 2, y: 1 },
										{ x: 1, y: -0.75 },
										{ x: 0.5, y: 0 },
										{ x: 2.5, y: 0 } ];
										
		private var _yScale:Number;
		
		private var beatIndex:uint = 0;
		
		public function DJ(yConstraint:YConstraint)
		{
			_yConstraint = yConstraint;
			
			setYScale();
		}
		
		private function get xScale():Number { return yScale;  /** ??? **/ }
		private function get yScale():Number { return _yScale; }
		
		private function setYScale():void {
			
			var maxYUnit:Number = 0;
			
			for each (var beat:Object in beats) {
				
				maxYUnit = Math.max(maxYUnit, Math.abs(beat.y));
			}
			
			_yScale = yConstraint.difference / 2 / maxYUnit;
		}
		
		public function dropNextBeat():RatePoint {
			
			var beat:Object = beats[beatIndex % beats.length];
			++beatIndex;
			
			var x:Number, y:Number;
			x = beat.x;
			y = beat.y;
			
			// scale up (somewhat arbitrarily for x)
			x *= xScale;
			
			// and offset past right edge of sreen
			x += FP.width + FP.camera.x;
			
			// scale y
			y *= yScale;
			
			// invert for tom space to world space conversion
			y *= -1;
			
			// and set relative to center of constraint
			y += yConstraint.center;
			
			return new RatePoint(x, y);
		}
	}

}