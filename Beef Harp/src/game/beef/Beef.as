package game.beef 
{
	import net.flashpunk.Entity;
	import util.ImageMaker;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Beef extends Entity 
	{
		
		public function Beef(x:Number, y:Number)
		{
			super(x, y, ImageMaker.centered(Sprites.BEEF));
		}
		
	}

}