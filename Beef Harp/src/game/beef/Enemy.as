package game.beef 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import util.ImageMaker;
	import values.Depths;
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
		
		private var flux:Number		= Math.random() * 1000;
		private var vSpeed:Number	= 0;
		
		public function Enemy(x:Number, y:Number)
		{
			super(x, y, ImageMaker.centered(Sprites.ENEMY));
			
			type = Types.ENEMY;
			
			Hitboxer.matchImage(this);
			
			layer = Depths.ENEMY;
		}
		
		override public function update():void 
		{
			super.update();
			
			flux += FP.elapsed;
			vSpeed = Math.sin(Math.PI * 2 * Game.ENEMY_CYCLE_RATE * flux) * Game.ENEMY_VERT_SPEED * FP.elapsed;
			y += vSpeed;
			
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