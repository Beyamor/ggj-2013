package game.beef 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import util.ImageMaker;
	import values.Game;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Enemy extends Entity 
	{
		
		public function Enemy(x:Number, y:Number)
		{
			super(x, y, ImageMaker.centered(Sprites.ENEMY));
		}
		
		override public function update():void 
		{
			super.update();
			
			x -= Game.BASE_ENEMY_SPEED * FP.elapsed;
		}
	}

}