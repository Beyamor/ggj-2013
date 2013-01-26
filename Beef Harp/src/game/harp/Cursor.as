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
		private var _yConstraint:YConstraint;		private function get yConstraint():YConstraint { return _yConstraint; }
		
		public function Cursor(x:Number, yConstraint:YConstraint)
		{
			_yConstraint = yConstraint;
			
			super(x, yConstraint.center, ImageMaker.centered(Sprites.HARP_CURSOR));
			
			layer = Depths.HARP_CURSOR;
		}
		
		override public function update():void 
		{
			super.update();
			
			var dY:Number = 0;
			if (Input.check("harp-up"))		dY -= 1;
			if (Input.check("harp-down"))	dY += 1;
			
			y += Game.HARP_CURSOR_SPEED * FP.elapsed * dY;
			
			y = FP.clamp(y, yConstraint.min, yConstraint.max);
		}
	}

}