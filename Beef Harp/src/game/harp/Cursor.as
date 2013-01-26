package game.harp 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import util.ImageMaker;
	import values.Depths;
	import values.Game;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Cursor extends Entity 
	{
		private var _minY:Number;			private function get minY():Number { return _minY; }
		private var _maxY:Number;			private function get maxY():Number { return _maxY; }
		
		public function Cursor(x:Number, minY:Number, maxY:Number)
		{
			_minY = minY;
			_maxY = maxY;
			
			super(x, 0.5 * (minY + maxY), ImageMaker.centered(Sprites.HARP_CURSOR));
			
			layer = Depths.HARP_CURSOR;
		}
		
		override public function update():void 
		{
			super.update();
			
			var dY:Number = 0;
			if (Input.check("harp-up"))		dY -= 1;
			if (Input.check("harp-down"))	dY += 1;
			
			y += Game.HARP_CURSOR_SPEED * FP.elapsed * dY;
			
			y = FP.clamp(y, minY, maxY);
		}
	}

}