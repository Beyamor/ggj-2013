package game.beef 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import util.ImageMaker;
	import values.Game;
	import values.Sprites;
	import values.Types;
	import util.Hitboxer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Enemy extends Entity 
	{
		private var health:Number = Game.ENEMY_HEALTH;
		
		public function Enemy(x:Number, y:Number)
		{
			super(x, y, ImageMaker.centered(Sprites.ENEMY));
			
			type = Types.ENEMY;
			
			Hitboxer.matchImage(this);
		}
		
		override public function update():void 
		{
			super.update();
			
			x -= Game.BASE_ENEMY_SPEED * FP.elapsed;
		}
		
		public function takeHit(damage:Number):void {
			
			health -= damage;
			trace("health left: " + health);
			
			if (health <= 0) {
			
				if (world) world.remove(this);
			}
		}
	}

}