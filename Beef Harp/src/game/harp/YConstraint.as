package game.harp 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class YConstraint 
	{
		private var _minY:Number;
		private var _maxY:Number;
		
		public function get min():Number		{ return _minY; }
		public function get max():Number		{ return _maxY; }
		public function get center():Number		{ return 0.5 * (min + max); }
		public function get threshold():Number	{ return 0.5 * (max - min); }
		
		
		public function YConstraint(minY:Number, maxY:Number)
		{
			_minY = minY;
			_maxY = maxY;
		}
		
	}

}